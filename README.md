# == EM DESENVOLVIMENTO ATÉ 28/02/2023 ==

# Banco de Dados (MySQL)
## 4º módulo do curso #dev_makers da Ada em parceria com a Sinqia
### Projeto Carloca - modelagem do banco da dados do sistema de uma locadora de carros

regras de negócio:
- Um carro possui modelo, montadora, cor, e versão.

![2023-02-24 (1)](https://user-images.githubusercontent.com/17331645/221272479-a8c65ef9-fe10-4d05-a40d-aecf1eadc044.png)

![2023-02-24 (2)](https://user-images.githubusercontent.com/17331645/221272487-64b81229-919e-4003-b31c-931217a52fa3.png)

![model (2)](https://user-images.githubusercontent.com/17331645/221274752-96361671-61fb-47ea-a7c9-bdb48cd364bb.png)

![model (1)](https://user-images.githubusercontent.com/17331645/221274778-0532681f-868c-41e3-8023-05a67f1c134c.png)

podemos ver através das imagens acima que, além de outros atributos, um carro tem modelo, cor, e versão. Como cada modelo tem uma montadora específica, a regra de negócio é respeitada.

- As cores de carro disponíveis são apenas branco, preto, e prata.

![color (1)](https://user-images.githubusercontent.com/17331645/221324245-0aba5712-fe75-43c6-9757-406e02dff086.png)

![color](https://user-images.githubusercontent.com/17331645/221324249-de8cd3b7-3217-4ba3-bd02-a5b53c604bf2.png)

Cada carro tem exatamente uma cor, sendo que as cores estão listadas na tabela Color (para adicionar uma nova cor basta adicionar uma nova linha à tabela Color). Sendo assim, a regra de negócio é obedecida.

- Existem várias categorias de carro (hatch, sedan compacto, sedan médio, SUV, etc...).

![category (2)](https://user-images.githubusercontent.com/17331645/221324436-2466c714-9371-40b0-bf98-1df46c8f3e04.png)

![category (1)](https://user-images.githubusercontent.com/17331645/221324440-9d87a33f-e3f1-47c4-8d58-dd944b26beb1.png)

Na modelagem seguida, cada carro possui uma categoria. As categorias estão listadas na tabela Category. Para adicionar uma nova categoria basta adicionar um novo registro (uma nova linha) à tabela Category. Assim, esta regra de negócio é obedecida.

- Um cliente pode alugar um carro somente na modalidade "diária".

![rental (1)](https://user-images.githubusercontent.com/17331645/221328214-20d33808-acbf-4239-93c2-d7276734d7e1.png)

![rental (2)](https://user-images.githubusercontent.com/17331645/221328218-aa0a8284-c181-42fa-afce-bd80b4a028f2.png)

Cada registro de locação de carro (registrados na tabela Rental) possui as datas de início da locação, e de fim da locação (quando o carro é entregado). Assim é possível saber quantos dias o cliente locatário ficou com o carro, para que o cliente seja cobrado de acordo com o número de dias que ficou com o carro. Sendo assim, esta regra de negócio é respeitada.

- Um cliente não pode alugar mais de um carro ao mesmo tempo. 

![2023-02-24 (21)](https://user-images.githubusercontent.com/17331645/221328763-3ab61255-732d-4039-a7f7-967d75b810bd.png)

![2023-02-24 (22)](https://user-images.githubusercontent.com/17331645/221328765-c206c36c-f0f1-4c38-a845-1dada39f1ed4.png)

Os triggers mostrados nas imagens acima impedem que um cliente que já esteja com um carro alugue um segundo carro. Os triggers funcionam da seguinte forma: os triggers verificam se na tabela de locação (Rental) existe algum registro para determinado cliente (identificado pelo campo id_client) em que a data de retorno do carro esteja nula (isto é, ainda não occoreu). Caso haja, isso significa que aquele cliente em questão já iniciou uma locação que ainda não terminou. Os triggers garantem que neste caso uma nova locação não possa ser registrada.

- Enquanto um carro estiver locado por um cliente, tal carro não pode ser ofertado.


- O sistema deve manter o histórico dos clientes que locaram determinado carro.


- O sistema deve manter o histórico da distância que o cliente percorreu com o carro, bem como a distância total percorrida com cada um dos carros.


- Existem várias unidades da fraquia CARLOCA; o sistema deve saber onde cada carro foi locado e onde foi devolvido.
