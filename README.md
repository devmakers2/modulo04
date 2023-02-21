# Banco de Dados (MySQL)
## 4º módulo do curso #dev_makers da Ada em parceria com a Sinqia
### Projeto Carloca - modelagem do banco da dados do sistema de uma locadora de carros

regras de negócio:
- Um carro possui modelo, montadora, cor, e versão.
- As cores de carro disponíveis são apenas branco, preto, e prata.
- Existem várias categorias de carro (hatch, sedan compacto, sedan médio, SUV, etc...).
- Um cliente pode alugar um carro somente na modalidade "diária".
- Um cliente não pode alugar mais de um carro<!-- ao mesmo tempo ?-->. 
- Enquanto um carro estiver locado por um cliente, tal carro não pode ser ofertado.
- O sistema deve manter o histórico dos clientes que locaram determinado carro.
- O sistema deve manter o histórico da distância que o cliente percorreu com o carro, bem como a distância total percorrida com cada um dos carros.
- Existem várias unidades da fraquia CARLOCA; o sistema deve saber onde cada carro foi locado e onde foi devolvido.
