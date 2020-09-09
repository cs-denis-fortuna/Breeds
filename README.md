# README

# Anti-patterns

Esse repositório serve como guia para a talk sobre AntiPatterns. A ideia é passar por soluções comuns de desafios rotineiros no desenvolvimento iOS e tentar enxergar pequenas alterações que podem ser valiosas ao melhorar a manutenibilidade do código, ao mesmo tempo que o torna mais escalável. 

## Start

### branch: `antiPatterns/start`

Essa é branch inicial do estudo. Aqui, podemos ver o código da BreedsCollectionViewController bem acoplado e contendo diversas responsabilidades. Desde a configuração do serviço e requisição da lista de imagens, até a configuração das células e instanciação da próxima tela são feitas dentro dessa ViewController. 

### Service

### branch: `antiPatterns/service`

Uma responsabilidade que pode ser facilmente retirada de dentro da BreedsCollectionViewController é a de configuração do serviço (*endpoint*). Faz sentido encapsular as informações dos serviços em um protocolo (**ServiceProtocol**). Assim, garantimos que os serviços que estamos listando no app possuem todos os atributos necessários para preencher uma request (Como path, método HTTP, headers, etc...). Esse protocolo pode poderia ter mais informações necessárias, dependendo da API (Query parameters, token de autenticação, etc...).

Com isso, facilitamos a escalabilidade na implementação dos endpoints. Podemos facilmente adicionar, alterar ou remover serviços do app. Além de termos encapsulado o comportamento de um serviço em um protocolo, retirando essa responsabilidade da *ViewController*.

## Network

### branch: `antiPatterns/network`

A próxima responsabilidade que podemos retirar de dentro da BreedsCollectionViewController é a de configurar e executar a request. 

O NetworkManager foi criado para encapsular a lógica de executar uma request. Essa classe pode receber um **ServiceProtocol** e criar uma request com base nele. Além disso, para reduzir ainda mais a duplicidade de código, podemos receber um tipo genérico (que precisa conformar com **Decodable**). Esse tipo genérico representa o tipo da resposta que estamos esperando. No caso da request da listagem, estamos esperando que o tipo da resposta seja um **array de Image**. Com essa informação, o **NetworkManager** tentatá decodificar a *Data* recebida e transformá-la no tipo passado. Esse processo de decodificação da Data é comum à todos os endpoints, por isso, faz sentido centralizar essa lógica dentro do **NetworkManager**.

Além disso, com essa abordagem estamos diminuindo o grau de dependência que o app tem em relação ao Alamofire. Na abordagem antiga, estávamos importando o Alamofire na ViewController para realizar a request. Imagine que, pra cada ViewController que dependa da execução de uma request, tivéssemos que importar o Alamofire para realizar essa request. Agora, imagine que haja a necessidade de refatorar o código para substituir o Alamofire por outra biblioteca de network, ou mesmo uma implementação nativa. A dificuldade para realizar essa refatoração seria muito maior. Com essa nova abordagem, apenas o **NetworkManager** sabe executar uma request e, portanto, só ele "conhece" o Alamofire. Concentramos essa dependência em um arquivo só!  O **NetworkManager** serve como um *wrapper* para o Alamofire.

## Navigation

### branch: `antiPatterns/navigation`

O grande problema de se manter a lógica de navegação dentro da ViewController é que, fazendo isso, estamos acoplando definitivamente as duas telas (**Sempre** que tocarmos na célula da listagem, iremos pra tela de detalhe). Isso pode dificultar a manutenção do app, dificultando que um fluxo seja alterado ou até mesmo que um teste A/B seja implementado.

Um padrão comum para lidar com navegação é o **Coordinator**. Existem diversas implementações desse *pattern*, a apresentada aqui é uma versão simples mas eficaz em encapsular a responsabilidade de gerenciar a navegação entre fluxos do app.

A instanciação das telas e navegação agora é responsabilidade do Coordinator. A ViewController deve apenas notificar o **Coordinator** de um evento que irá gerar uma mudança de tela. Antes, quando uma célula era tocada, a ViewController instanciava e dava um *push* na tela de detalhes. Nessa nova abordagem, quando uma célula é tocada, a ViewController apenas notifica o **Coordinator** que uma célula foi tocada.

## Cell Configuration

### branch: `antiPatterns/cell-configuration`

A próxima responsabilidade que podemos retirar de dentro da ViewController é a de configuração das células. 

Felizmente, o padrão de DataSource e Delegate utilizado por **UITableView**s e **UICollectionView**s facilita na hora de separar essa responsabilidade. A ideia é criar um objeto, o **BreedsCollectionDataSource**, que tem como responsabilidade saber criar e configurar uma lista de células com base em um array de **Image** (Objeto retornado pela API).

Seguindo a mesma ideia aplicada no padrão Coordinator, o objeto **BreedsCollectionDataSource** não tem a responsabilidade de lidar de fato com o evento de toque na célula. Essa ação é definida pela ViewController através de uma **closure**. Esse bloco de código (closure) será executado de dentro do método `**didSelectItemAt**`.

Com isso, separamos bem as responsabilidades de cada componente. O **BreedsCollectionDataSource**  tem a responsabilidade de saber criar e configurar as células com base nos modelos recebidos

Já a BreedsCollectionViewController sabe lidar com o evento de uma célula ter sido tocada pelo usuário. A closure é executada de dentro do **DataSource**, mas é a ViewController quem define essa closure.

## String Oriented Code

### branch: `antiPatterns/string-oriented`

É comum utilizarmos diversos objetos no código que podem ser instanciados através de um identifier, normalmente uma string. Exemplos disso são Storyboards, ViewControllers, Imagens, Células (reuse identifier). O problema de termos diversas strings espalhadas pelo código é o grau de incerteza que isso gera. Uma letra errada ja é o suficiente para fazer uma instanciação falhar, dificultando também o processo de *debugging* para encontrar o erro.

Para abordar esse problema, temos diversas alternativas. Uma delas é criar um protocolo pra podermos lidar com identificadores de uma maneira **Type-Safe**. O protocolo **Identifiable** define uma propriedade `uniqueIdentifier` para todas as classes que o implementarem. Essa propriedade retorna uma string que descreve a classe, ou seja, uma string com o nome da classe. Com isso, podemos fazer com que `UIViewController` implemente esse protocolo e passar a instanciar ViewControllers usando seu tipo, ao invés de uma string identificadora. Essa lógica pode ser encontrada no arquivo `**Coordinator+Instantiation.swift**`

Outra solução possível para reduzir a quantidade de hard-coded strings no código é utilizar Enums para descrever identificadores. Podemos atribuir tipos (String, no caso do enum **Identifier**) para um Enum, e até aninha-los dentro de outros Enums. Assim, conseguimos criar uma hierarquia clara dos diversos identificadores que são usados ao longo do código, e centralizamos o uso de strings nesse contexto.

## Dependency Injection

### branch: `antiPatterns/dependency-injection`

Um detalhe importante que precisamos nos atentar para aumentar a testabilidade do nosso código é permitir a injeção de dependência nos nossos componentes. Isso significa criar um baixo acoplamento entre os componentes, de modo que possamos facilmente alterar suas dependências. 

Por exemplo, nesse ponto a BreedsCollectionViewController possui duas dependências bem claras: O **NetworkManager** e o **BreedsCoordinator**. Ambos os componentes são necessários para que a BreedsCollectionViewController complete o seu ciclo de vida. Mas, quando formos escrever testes para essa ViewController, não queremos que uma request seja realmente executada durante os testes (por vários motivos). Precisamos então permitir que o **NetworkManager** possa ser **injetado** dentro da ViewController.

Um maneira de obter isso é realizar as conexões entre os componentes através de protocolos. Por exemplo, a BreedsCollectionViewController, ao invés de ter uma referência para o **NetworkManager**, terá uma referência para o **NetworkManagerProtocol**.

Assim, podemos fazer com que o **NetworkManager** implemente esse protocolo e o nosso código continue funcionando. Mas, o mais importante, é que podemos criar um mock desse protocolo:  o **NetworkManagerMock**. Esse mock implementará o protocolo **NetworkManagerProtocol** também, mas não irá realizar nenhuma request. Ele servirá apenas para testar a interação entre a ViewController e essa dependência.