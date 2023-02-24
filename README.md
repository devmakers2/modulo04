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
- Existem várias categorias de carro (hatch, sedan compacto, sedan médio, SUV, etc...).
- Um cliente pode alugar um carro somente na modalidade "diária".
- Um cliente não pode alugar mais de um carro ao mesmo tempo. 
- Enquanto um carro estiver locado por um cliente, tal carro não pode ser ofertado.
- O sistema deve manter o histórico dos clientes que locaram determinado carro.
- O sistema deve manter o histórico da distância que o cliente percorreu com o carro, bem como a distância total percorrida com cada um dos carros.
- Existem várias unidades da fraquia CARLOCA; o sistema deve saber onde cada carro foi locado e onde foi devolvido.
