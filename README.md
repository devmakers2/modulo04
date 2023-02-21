# Banco de Dados (MySQL)
## 4º módulo do curso #dev_makers da Ada em parceria com a Sinqia
### Projeto Carloca - modelagem do banco da dados do sistema de uma locadora de carros.

regras de negócio:
- Um carro possui modelo, montadora, cor, e versão.
- As cores de carro disponiveis são apenas branco, preto, e prata.
- Existem várias categorias de veiculos (hatch, sedam compacto, sedam médio, SUV, etc...).
- Um cliente pode alugar um carro somente na modalidade "diária".
- Um cliente não pode alugar mais de um carro<!--ao mesmo tempo?-->. 
- Enquanto um carro estiver locado por um cliente, tal carro não pode ser ofertado para outro.
- O sistema deve manter o histórico dos clientes que locaram determinado carro.
- O sistema deve manter o histórico de quantos quilômetros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros.
- Existem várias unidades da fraquia CARLOCA; o sistema deve saber onde cada veículo foi locado e onde foi devolvido.
