# == EM DESENVOLVIMENTO ATÉ 28/02/2023 ==

# Banco de Dados (MySQL)
## 4º módulo do curso #dev_makers da Ada em parceria com a Sinqia
### Projeto Carloca - modelagem do banco da dados do sistema de uma locadora de carros

> **Note**
> 
> Clicando em "Saiba mais" mais detalhes são apresentados.

## Modelagem e explicação
Há três tabelas principais: uma com os registros dos clientes, uma com os registros de cada locação, e uma com os registros dos veículos.

- tabelas com informações dos clientes

  <details>

  ![client](https://user-images.githubusercontent.com/17331645/221346112-45ff80f7-c234-421c-9ecc-8c12c977ad38.png)

  Nesta modelagem cada cliente tem exatamente um nome, um endereço, e um telefone. Diferentes clientes (por exemplo um pai e seu filho) podem ter os mesmos endereço e telefone; além disso, clientes diferentes podem ter coincidentemente o mesmo nome.
  
  </details>
  
- tabelas com informações das locações

  <details>

  ![rental](https://user-images.githubusercontent.com/17331645/221346477-e5f87ca6-23fa-428e-9622-e5a6d31c49f1.png)

  A tabela Rental guarda os registros das locações. Os campos id_location_of_return, return_date, e car_km_at_return permanecem NULL até o término da locação, que termina quando o carro é efetivamente devolvido.

  A tabela Carloca_Location guarda as informações das unidades da franquia da Carloca, e, de forma semelhante à tabela Client, se liga às tabelas Address e Telephone.
  
  </details>
  
- tabelas com informações dos carros

  <details>
  
  ![car](https://user-images.githubusercontent.com/17331645/221346741-6b81054b-bbe8-4010-9bb2-97564041a008.png)

  A tabela Car presumivelmente guarda as informações dos carros. Cada carro tem um modelo, modelo este que por sua vez, é exclusivo de uma montadora (portanto a informação do modelo carrega para Car a informação da montadora, por exemplo, não existe carro modelo Gol da Fiat, Gol é da volkswagen).
  
  </details>
  
## Análise das regras de normalização nas tabelas
Como ficaria inviável analisar todas as regras de normalização para cada uma das tabelas separadamente, as três tabelas principais (Client, Rental, Car) serão analisadas, sendo que, para cada uma, serão analisadas as regras de uma das três primeiras formas normais.

- análise das regras da primeira forma normal na tabela Client

  <details>
  
  ![client (2)](https://user-images.githubusercontent.com/17331645/221347841-41f74a71-d03f-430e-a8f6-2bc353871b27.png)

  Segundo o Material do Aluno, disponibilizado no Class pela Ada:
  "[...] dizemos que uma tabela está na 1FN quando não há grupo de dados repetidos, e também não há campos que guardam valores compostos".
  
  Podemos ver que não há grupo de dados repetidos, e que os campos que guardariam valores compostos (como endereço e telefone) foram substituídos por chaves extrangeiras de outras tabelas. Sendo assim, a tabela segue as regras da primeira forma normal.

  </details>
  
- análise das regras da segunda forma normal na tabela Rental

  <details>
  
  ![rental (1)](https://user-images.githubusercontent.com/17331645/221347967-f3aa7e75-8505-49ce-8445-cfedb52b020e.png)

  Pressupõe-se que a tabela já esteja na primeira forma normal.
  
  Segundo o Material do Aluno, disponibilizado no Class pela Ada:
  "Dizemos que uma tabela está na segunda forma normal(2FN) se ela estiver na 1FN e todos os atributos que são não chave (PK/FK) forem totalmente dependentes da chave primária da tabela".
  
  Todos os atributos que não são chave (aqueles atributos que, nesta tabela, não começam com id) são características intrínsecas da locação específica, isto é, são  completamente dependentes da chave primária. Portanto a tabela segue as regras da segunda forma normal.

  </details>
  
- análise das regras da terceira forma normal na tabela Car

  <details>
  
  ![car (1)](https://user-images.githubusercontent.com/17331645/221348178-5cf78cd3-fd5d-4d9a-aa1c-cd23f2ede4a4.png)
  
  Pressupõe-se que a tabela já esteja na segunda forma normal.

  Segundo o Material do Aluno, disponibilizado no Class pela Ada:
  "Dizemos que uma tabela está na terceira forma normal (3FN) se ela estiver na 2FN e não tivermos uma coluna não chave dependente de outra coluna não chave".
  
  Todos os atributos que não são chave (manufacture_year, price_per_day, etc) são independentes entre si, portanto as regras da terceira forma normal são seguidas.

  </details>

## Regras de negócio
Abaixo são apresentadas uma a uma as regras de negócio que devem ser seguidas pelo projeto, e uma explicação de como a regra em questão é seguida no projeto.

- Um carro possui modelo, montadora, cor, e versão.

  <details>

  ![2023-02-24 (1)](https://user-images.githubusercontent.com/17331645/221272479-a8c65ef9-fe10-4d05-a40d-aecf1eadc044.png)

  ![2023-02-24 (2)](https://user-images.githubusercontent.com/17331645/221272487-64b81229-919e-4003-b31c-931217a52fa3.png)

  ![model (2)](https://user-images.githubusercontent.com/17331645/221274752-96361671-61fb-47ea-a7c9-bdb48cd364bb.png)

  ![model (1)](https://user-images.githubusercontent.com/17331645/221274778-0532681f-868c-41e3-8023-05a67f1c134c.png)

  podemos ver através das imagens acima que, além de outros atributos, um carro tem modelo, cor, e versão. Como cada modelo tem uma montadora específica, a regra de negócio é respeitada.

  </details>
  
----

- As cores de carro disponíveis são apenas branco, preto, e prata.
 
  <details>

  ![color (1)](https://user-images.githubusercontent.com/17331645/221324245-0aba5712-fe75-43c6-9757-406e02dff086.png)

  ![color](https://user-images.githubusercontent.com/17331645/221324249-de8cd3b7-3217-4ba3-bd02-a5b53c604bf2.png)

  Cada carro tem exatamente uma cor, sendo que as cores estão listadas na tabela Color (para adicionar uma nova cor basta adicionar uma nova linha à tabela Color). Sendo assim, a regra de negócio é obedecida.
  
  </details>

----

- Existem várias categorias de carro (hatch, sedan compacto, sedan médio, SUV, etc...).

  <details>

  ![category (2)](https://user-images.githubusercontent.com/17331645/221324436-2466c714-9371-40b0-bf98-1df46c8f3e04.png)

  ![category (1)](https://user-images.githubusercontent.com/17331645/221324440-9d87a33f-e3f1-47c4-8d58-dd944b26beb1.png)

  Na modelagem seguida, cada carro possui uma categoria. As categorias estão listadas na tabela Category. Para adicionar uma nova categoria basta adicionar um novo registro (uma nova linha) à tabela Category. Assim, esta regra de negócio é obedecida.
  
  </details>

----

- Um cliente pode alugar um carro somente na modalidade "diária".

  <details>

  ![rental (1)](https://user-images.githubusercontent.com/17331645/221328214-20d33808-acbf-4239-93c2-d7276734d7e1.png)

  ![rental (2)](https://user-images.githubusercontent.com/17331645/221328218-aa0a8284-c181-42fa-afce-bd80b4a028f2.png)

  Cada registro de locação de carro (registrados na tabela Rental) possui as datas de início da locação, e de fim da locação (quando o carro é entregado). Assim é possível saber quantos dias o cliente locatário ficou com o carro, para que o cliente seja cobrado de acordo com o número de dias que ficou com o carro. Sendo assim, esta regra de negócio é respeitada.

  </details>
  
----

- Um cliente não pode alugar mais de um carro ao mesmo tempo.

  <details>

  ![2023-02-24 (21)](https://user-images.githubusercontent.com/17331645/221328763-3ab61255-732d-4039-a7f7-967d75b810bd.png)

  ![2023-02-24 (22)](https://user-images.githubusercontent.com/17331645/221328765-c206c36c-f0f1-4c38-a845-1dada39f1ed4.png)

  Os triggers mostrados nas imagens acima impedem que um cliente que já esteja com um carro alugue um segundo carro. Os triggers funcionam da seguinte forma: os triggers verificam se na tabela de locação (Rental) existe algum registro para determinado cliente (identificado pelo campo id_client) em que a data de retorno do carro esteja nula (isto é, ainda não occoreu). Caso haja, isso significa que aquele cliente em questão já iniciou uma locação que ainda não terminou. Os triggers garantem que neste caso uma nova locação não possa ser registrada.
  
  </details>

----

- Enquanto um carro estiver locado por um cliente, tal carro não pode ser ofertado.

  <details>
  
  ![available_cars (1)](https://user-images.githubusercontent.com/17331645/221333356-38614d75-9645-4019-b161-1f7b62643d4a.png)

  ![available_cars (2)](https://user-images.githubusercontent.com/17331645/221333358-f5ac3aa5-9094-4e4e-9cc1-2a54fcdf33c9.png)
  
  Foi criada uma View que mostrade maneira atualizada os carros que não estão locados em determinado momento. Ofertando-se apenas os carros que estão presentes nesta View garante-se o cumprimento da regra de negócio.
  
  </details>

----

- O sistema deve manter o histórico dos clientes que locaram determinado carro.
 
  <details>
  
  ![view clientes que alugaram determinado carro (1)](https://user-images.githubusercontent.com/17331645/221334259-9c44bffe-b006-44f8-9ac0-8c33db44c109.png)

  ![view clientes que alugaram determinado carro (2)](https://user-images.githubusercontent.com/17331645/221334263-18fa487e-d5eb-42a9-87e4-dcfec2e15ddf.png)
  
  Foi criada uma View que mostra quais clientes já alugaram determinado carro, satisfazendo assim a regra de negócio.
  
  É interessante observar que esta mesma View possui ainda outra funcionalidade, semelhante: caso a View seja ordenada pelos ids dos clientes, será possível ter uma visualização fácil de quais carros determinado cliente já alugou (em vez de quais clientes já alugaram determinado carro).
  
  </details>

----

- O sistema deve manter o histórico da distância que o cliente percorreu com o carro, bem como a distância total percorrida por clientes com cada um dos carros.

  <details>
  
  ![view total travelled by clients distance for each car (2)](https://user-images.githubusercontent.com/17331645/221337080-93894dd8-be45-460d-8fb4-5cb48baa49a7.png)

  ![view total travelled by clients distance for each car (1)](https://user-images.githubusercontent.com/17331645/221337097-291c34dd-ea18-4b4d-98cc-52fd0c4154f2.png)

  ![view travelled distance by client and car (1)](https://user-images.githubusercontent.com/17331645/221337102-9cfe6fa8-3054-4c3b-a236-e3109567beff.png)

  ![view travelled distance by client and car (2)](https://user-images.githubusercontent.com/17331645/221337110-1c221b7b-96ec-4cad-b8e5-3aa9d5db9d78.png)

  Foram criadas duas Views para satisfazer as condições da regra de negócio: uma View que mostra a distância em quilômetros que cada cliente percorreu com cada carro, e outra View que mostra quanto cada um dos carros já percorreu em locações. Caso algum carro/cliente não apareça nas Views é porque ainda não há registro de locação para o cliente/carro em questão.

  </details>

----

- Existem várias unidades da fraquia CARLOCA; o sistema deve saber onde cada carro foi locado e onde foi devolvido.

  <details>
  
  ![rental (1)](https://user-images.githubusercontent.com/17331645/221345384-0a5490ab-501f-4dcf-820e-3fe174b0a2a4.png)

  ![rental (2)](https://user-images.githubusercontent.com/17331645/221345385-163baba6-6df1-4226-b270-1af95a7b9eaf.png)

  A tabela Rental guarda informações de em que unidade da Carloca o aluguel foi iniciado, e em que unidade da Carloca o carro foi efetivamente devolvido. Portanto, a regra de negócio é atendida.
  
  </details>
