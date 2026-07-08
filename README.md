# 📊 [PT-BR] E-Commerce Analytics: Análise Avançada com SQL (Window Functions)

## 📌 Contexto do Negócio
No ambiente dinâmico do e-commerce, compreender o comportamento do cliente e a performance de vendas ao longo do tempo é essencial para a tomada de decisão estratégica. Este projeto utiliza um conjunto de dados transacionais para resolver problemas complexos de negócios através de **Window Functions** avançadas em SQL (focado em PostgreSQL/BigQuery). 

O objetivo é rastrear o comportamento do consumidor, analisar a evolução das vendas e classificar os produtos com melhor desempenho, convertendo dados brutos em inteligência de negócios acionável.

## 🗄️ Esquema do Banco de Dados
A análise foi construída sobre uma tabela transacional central:
* `sales_orders`: Contém os registros de pedidos, incluindo IDs de pedidos e clientes, datas, categorias de produtos e valores transacionados.

> **Nota:** O script completo de DDL e DML para recriar este banco de dados localmente está disponível no arquivo `schema.sql`.

## 📈 Marcos Analíticos e Lógica de Negócios

Este projeto é dividido em quatro marcos analíticos principais, documentados em detalhes no arquivo `window_functions.sql`:

1. **Rastreamento de Receita Acumulada (Running Totals):** Utilização de `SUM() OVER(ORDER BY)` para monitorar o crescimento diário do negócio, fornecendo uma visão macro da saúde financeira.
2. **Comportamento Segmentado do Cliente (Partitioning):** Aplicação de `SUM() OVER(PARTITION BY)` para calcular o *Lifetime Value* (LTV) de clientes específicos e sua curva de gastos ao longo do tempo.
3. **Performance de Produtos e Concorrentes (Ranking):** Uso de `ROW_NUMBER()` e `DENSE_RANK()` para identificar quais categorias de produtos impulsionam o maior volume de vendas.
4. **Análise de Delta em Séries Temporais (Value Offsets):** Implementação da função `LAG()` para comparar o valor do pedido atual de um cliente com o seu pedido anterior, identificando variações e padrões de consumo.

## 💡 Principais Insights
A partir da execução das queries, algumas descobertas de negócios se destacam:
* **Crescimento Acelerado:** A categoria *Electronics* apresenta a taxa mais rápida de crescimento na receita acumulada.
* **Intervalos de Compra:** A categoria *Home* possui as maiores lacunas (gaps) de valores entre pedidos sequenciais de um mesmo cliente.

## 📂 Estrutura do Repositório
* `README.md`: Visão geral do projeto e contexto de negócios.
* `schema.sql`: Scripts para criação de tabelas e inserção de dados mockados.
* `window_functions.sql`: Queries SQL separadas por marcos, com comentários detalhando a lógica aplicada.

# 📊 [EN] E-Commerce Analytics: Window Functions

## 📌 Business Context
In a dynamic e-commerce environment, understanding customer behavior and sales performance over time is essential for strategic decision-making. This project leverages a transactional dataset to solve complex business problems using advanced **SQL Window Functions** (optimized for PostgreSQL/BigQuery). 

The goal is to track consumer behavior, analyze sales momentum, and rank top-performing products, ultimately transforming raw data into actionable business intelligence.

## 🗄️ Database Schema
The analysis is built upon a core transactional table:
* `sales_orders`: Contains order records, including order and customer IDs, dates, product categories, and transaction amounts.

> **Note:** The complete DDL and DML scripts to recreate this database locally are available in the `schema.sql` file.

## 📈 Analytical Milestones & Business Logic

This project is structured around four core analytical milestones, documented in detail within `window_functions.sql`:

1. **Cumulative Revenue Tracking (Running Totals):** Using `SUM() OVER(ORDER BY)` to monitor daily business growth and provide a macro view of financial health.
2. **Segmented Customer Behavior (Partitioning):** Applying `SUM() OVER(PARTITION BY)` to calculate the Lifetime Spend of specific customers and track their spending curves over time.
3. **Product & Competitor Performance (Ranking):** Utilizing `ROW_NUMBER()` and `DENSE_RANK()` to identify which product categories drive the highest sales volume.
4. **Time-Series Delta Analysis (Value Offsets):** Implementing the `LAG()` function to compare a customer's current order amount against their previous order, identifying spending variance and consumption patterns.

## 💡 Key Insights
Based on the query results, several business discoveries stand out:
* **Accelerated Growth:** The *Electronics* category yields the fastest cumulative revenue growth rate.
* **Purchase Gaps:** The *Home* category exhibits the highest variance (gaps) in order amounts between sequential purchases from the same customer.

## 📂 Repository Structure
* `README.md`: Project overview and business context.
* `schema.sql`: Raw DDL and DML scripts for easy reproduction.
* `window_functions.sql`: SQL queries broken down by milestones, with comments explaining the applied business logic.
