Nic Ateliê — Dashboard de Vendas (SQL + Power BI)

Projeto de análise de dados end-to-end: modelagem de banco relacional em MySQL, queries analíticas em SQL, e dashboard interativo em Power BI, simulando uma loja fictícia de roupa feminina.

Sobre o projeto

Esse projeto foi criado para entendermos, na prática, o fluxo completo de um analista de BI: desde o design do banco de dados até a entrega de um dashboard interativo. Mais do que produzir gráficos bonitos, o objetivo foi entender o que acontece por trás de cada tela, como os dados se relacionam, por que cada decisão de modelagem foi tomada, e como uma pergunta de negócio se transforma em uma query e depois em uma visualização.

Foi também um espaço para treinar fórmulas (SQL e DAX) e aprender fazendo, construindo cada peça do zero em vez de usar um dataset pronto.

Stack utilizada:
MySQL — banco de dados relacional
MySQL Workbench — modelagem e queries SQL
Power BI Desktop — modelagem de dados, medidas DAX e visualização
Modelo de dados

O banco conta com 4 tabelas relacionadas:

clientes — dados dos clientes da loja
produtos — catálogo de produtos
pedidos — compras realizadas, uma linha por pedido
itens_pedido — tabela associativa que conecta pedidos a produtos (um pedido pode conter vários produtos)

clientes (1) ──< (*) pedidos (1) ──< (*) itens_pedido (*) ──> (1) produtos

Volume de dados: 40 clientes, 25 produtos, 95 pedidos e 100 itens de pedido, distribuídos entre agosto/2024 e julho/2025.

Principais queries SQL
Produtos mais vendidos (agregação com JOIN + GROUP BY)
Faturamento total por cliente (múltiplos JOINs conectando itens_pedido → pedidos → clientes)
Faturamento por mês (DATE_FORMAT + agregação temporal)
Dashboard Power BI

O dashboard conta com 8 elementos visuais:

Cartões de KPI: Faturamento Total, Total de Pedidos, Ticket Médio
Gráfico de linha: evolução do faturamento mês a mês
Gráfico de barras: ranking de produtos mais vendidos
Gráfico de barras: faturamento por estado
Gráfico de pizza: distribuição de status dos pedidos (Entregue / Cancelado / Em processamento)
Segmentação de dados (slicer): filtro interativo por estado
Medidas DAX criadas
dax
Faturamento Total = SUMX(itens_pedido, itens_pedido[quantidade] * itens_pedido[preco_unitario])
Total de Pedidos = COUNTROWS(pedidos)
Ticket Medio = DIVIDE([Faturamento Total], [Total de Pedidos])
Principais insights
O estado do Paraná (PR) concentra a maior parte do faturamento, seguido por São Paulo (SP) — indicando uma base de clientes fortemente regional.
A taxa de cancelamento é baixa (cerca de 8%), com a grande maioria dos pedidos entregues com sucesso.
O faturamento mensal apresenta tendência de crescimento ao longo do período analisado, com pico em julho/2025.
O que esse projeto demonstra
Modelagem de banco de dados relacional (chaves primárias, estrangeiras, tabela associativa)
Escrita de queries SQL analíticas (JOIN, GROUP BY, funções de agregação e data)
Criação de medidas DAX no Power BI (SUMX, COUNTROWS, DIVIDE, colunas calculadas)
Construção de dashboard interativo com storytelling visual

Screenshots
<img width="767" height="434" alt="image" src="https://github.com/user-attachments/assets/b436be1e-ff4f-4d36-8292-47145f288f27" />
