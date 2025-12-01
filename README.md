# README - SCRIPTS DO CURSO
## Formação Breve em Ciência de Dados e Informações para o SUS

---

## 📋 VISÃO GERAL

Este conjunto contém **4 scripts progressivos de R** para ensinar análise de dados de saúde pública utilizando dados do **SIM (Sistema de Informações de Mortalidade)** de Salvador, 2023.

### Progressão Pedagógica:
1. 🎯 Fundamentos básicos de R
2. 🔧 Manipulação de dados com Tidyverse
3. 📝 Atividades práticas e análise
4. 📊 Visualização de dados

---

## 📚 SCRIPT 1: abrasco_script_1.R

### Iniciando no R - Conceitos Fundamentais

**OBJETIVO:** Apresentar os conceitos básicos da linguagem R para iniciantes que nunca programaram antes.

### CONTEÚDO DETALHADO

#### SEÇÃO 1: Operações Básicas em R
- Operações aritméticas (+, -, *, /)
- Criação de variáveis com operador `<-`
- Visualização de valores com `print()`
- Case sensitivity (diferenciação entre maiúsculas e minúsculas)
- Exercícios práticos

#### SEÇÃO 2: Tipos de Dados
**Tipos primitivos:**
- `integer`: números inteiros
- `numeric`: números reais (com decimais)
- `character`: texto/strings
- `logical`: valores booleanos (TRUE/FALSE)

**Verificação e conversão:**
- `class()`: verificar tipos
- `as.integer()`: converter para inteiro
- `as.numeric()`: converter para numérico

**Estruturas de dados:**
- Vetores: `c()` para criar sequências
- Fatores: `factor()` para variáveis categóricas
- Matrizes: `matrix()` para dados bidimensionais

#### SEÇÃO 3: Funções Básicas
- `sum()`: somar valores
- `sqrt()`: raiz quadrada
- `is.numeric()`: verificar se valor é numérico
- Introdução à sintaxe de funções

### RESULTADOS DE APRENDIZAGEM
✓ Realizar operações aritméticas básicas  
✓ Criar e manipular variáveis  
✓ Identificar diferentes tipos de dados  
✓ Usar funções básicas do R

**PRÉ-REQUISITOS:** R e RStudio instalados  
**DURAÇÃO:** 30-45 minutos  
**PÚBLICO:** Iniciantes absolutos em programação

---

## 🔧 SCRIPT 2: abrasco_script_2.R

### Manipulação de Dados - Parte 1 (Tidyverse)

**OBJETIVO:** Ensinar manipulação e transformação de dados reais de mortalidade usando o ecossistema Tidyverse.

### CONTEÚDO DETALHADO

#### INSTALAÇÃO E CONFIGURAÇÃO
- Instalação do Tidyverse (opção recomendada)
- Pacotes incluídos: dplyr, stringr, lubridate, readr, ggplot2, tidyr
- Pacotes adicionais: readxl, arrow
- Configuração do diretório de trabalho

#### SEÇÃO 4: Importação de Dados
- `read_csv()`: arquivos CSV
- `read_excel()`: arquivos Excel (.xlsx, .xls)
- `read_parquet()`: arquivos Parquet (formato eficiente)
- `rm()`: gerenciamento de memória

#### SEÇÃO 5: Exploração Inicial dos Dados
- `glimpse()`: estrutura e tipos de variáveis
- `head()` e `tail()`: visualizar início/fim
- `summary()`: estatísticas descritivas

#### SEÇÃO 6: Análise de Frequências
- `table()`: contagem do R base
- `count()`: contagem moderna com tidyverse
- Uso do pipe `%>%` para encadear operações

#### SEÇÃO 7: Criação e Modificação de Variáveis
- `mutate()`: criar/modificar variáveis
- `if_else()`: condições simples
- `case_when()`: múltiplas condições
- Padronização de variáveis categóricas (SEXO)

#### SEÇÃO 8: Manipulação de Datas
- Pacote lubridate para trabalhar com datas
- `dmy()`: converter texto para data (dia-mês-ano)
- `year()`, `month()`, `day()`: extrair componentes
- Análise temporal de óbitos

#### SEÇÃO 9: Manipulação de Strings (Texto)
- `str_sub()`: extrair partes de texto
- Processamento da variável IDADE do SIM
- Decodificação do formato especial do DATASUS

#### SEÇÃO 10: Múltiplas Transformações
- Pipeline de transformações encadeadas
- Conversão de idade para anos
- Uso de `case_when()` para lógica complexa

#### SEÇÃO 11: Filtragem de Dados com filter()
- Filtros simples (uma condição)
- Filtros numéricos (>=, <=, ==, !=)
- Múltiplas condições: E lógico (&), OU lógico (|)
- Tratamento de valores ausentes: `is.na()`, `!is.na()`
- Operador `%in%`: filtrar múltiplos valores
- Filtros complexos combinados
- **12 exemplos progressivos**

#### SEÇÃO 12: Combinando filter() com Outras Funções
- `filter()` + `select()`: filtrar linhas e colunas
- `filter()` + `mutate()`: filtrar e criar variáveis
- `filter()` + `group_by()` + `summarise()`: análise por grupos
- `filter()` + `arrange()`: filtrar e ordenar

#### SEÇÃO 13: Agrupamento e Agregação de Dados
- `group_by()`: agrupar dados por categorias
- `summarise()`: calcular estatísticas agregadas
- Funções de agregação: `n()`, `mean()`, `median()`, `min()`, `max()`

#### SEÇÃO 14: Joins (Junções de Tabelas)
- `left_join()`, `inner_join()`, `right_join()`, `full_join()`
- Sintaxe e parâmetro `by`

#### SEÇÃO 15: Exercícios Práticos
- 5 exercícios para consolidar aprendizado

### RESULTADOS DE APRENDIZAGEM
✓ Importar dados de diferentes formatos  
✓ Explorar e entender estrutura de dados  
✓ Criar e transformar variáveis  
✓ Filtrar dados com condições complexas  
✓ Agrupar e agregar dados  
✓ Trabalhar com datas e strings  
✓ Combinar múltiplas operações em pipelines

**PRÉ-REQUISITOS:** Completar Script 1 ou ter conhecimentos básicos de R  
**DURAÇÃO:** 2-3 horas  
**PÚBLICO:** Pessoas com conhecimentos básicos de R

---

## 📝 SCRIPT 3: abrasco_script_3.R

### Manipulação de Dados - Gabarito Atividade Prática

**OBJETIVO:** Consolidar conhecimentos através de exercícios práticos resolvidos.

### CONTEÚDO DETALHADO

#### ATIVIDADE 1: Exploração e Transformação de Dados
- Criar variável faixa_etaria com `case_when()`
  - Criança: 0-12 anos
  - Adolescente: 13-17 anos
  - Adulto: 18-59 anos
  - Idoso: 60+ anos
- Contar óbitos por faixa etária
- Duas abordagens: `count()` e `group_by()` + `summarise()`

#### ATIVIDADE 2: Manipulação de Datas e Agrupamento
- Criar variável trimestre
- Calcular total e idade média por trimestre e sexo
- Uso de `pivot_wider()` para visualização alternativa

#### ATIVIDADE 3: Análise Integrada
- Identificar mês com maior número de óbitos
- Calcular diferença percentual entre sexos
- Determinar faixa etária mais afetada
- Cálculos de proporções e percentuais

#### ANÁLISES COMPLEMENTARES (BÔNUS)
- Óbitos por faixa etária e sexo
- Distribuição ao longo do ano
- Top 5 faixas etárias detalhadas

### RESULTADOS DE APRENDIZAGEM
✓ Criar variáveis categóricas complexas  
✓ Realizar análises temporais  
✓ Calcular e interpretar percentuais  
✓ Identificar padrões em dados de saúde  
✓ Interpretar resultados epidemiológicos

**PRÉ-REQUISITOS:** Completar Script 2  
**DURAÇÃO:** 1-2 horas (estudo do gabarito)  
**USO RECOMENDADO:** Tentar resolver antes de ver o gabarito

---

## 📊 SCRIPT 4: abrasco_script_4.R

### Visualização de Dados - Gráficos Estáticos e Interativos

**OBJETIVO:** Ensinar criação de visualizações profissionais usando ggplot2 e plotly.

### GUIA DE BOAS PRÁTICAS EM VISUALIZAÇÃO

#### Princípios Fundamentais

1. **CLAREZA E SIMPLICIDADE**
   - Menos é mais: evitar poluição visual
   - Uma mensagem principal por gráfico
   - Títulos e rótulos autoexplicativos

2. **ACESSIBILIDADE**
   - Paletas amigáveis para daltônicos
   - Não depender apenas de cor
   - Fontes legíveis (mínimo 10-12pt)

3. **HONESTIDADE**
   - Não distorcer escalas
   - Eixo Y começando em zero (gráficos de barras)
   - Citar fontes de dados

4. **ESCOLHA ADEQUADA DO TIPO DE GRÁFICO**
   - Barras: comparar categorias
   - Linhas: tendências temporais
   - Dispersão: relação entre variáveis
   - Boxplot: distribuição e outliers
   - Heatmap: padrões matriciais

5. **CONTEXTO E INTERPRETAÇÃO**
   - Linhas de referência úteis
   - Destaque de pontos importantes
   - Considerar público-alvo

### VISUALIZAÇÕES COM ggplot2 (ESTÁTICAS)

#### Gráfico 1: Óbitos por Mês (Barras)
- `geom_col()` para barras
- `geom_text()` para rótulos de valores
- Tema minimalista

#### Gráfico 2: Distribuição Etária por Sexo (Histograma)
- `geom_histogram()` com transparência
- `position = "identity"` para sobreposição
- Cores distintas por grupo

#### Gráfico 3: Óbitos por Faixa Etária e Sexo (Barras Agrupadas)
- `position = "dodge"` para barras lado a lado
- Comparação visual facilitada

#### Gráfico 4: Pirâmide Etária (Avançado)
- `coord_flip()` para inverter eixos
- Visualização demográfica clássica

### VISUALIZAÇÕES COM plotly (INTERATIVAS)

1. **Barras Interativas** - Óbitos por mês
2. **Barras Agrupadas** - Faixa etária x Sexo
3. **Histograma Sobreposto** - Distribuição etária
4. **Série Temporal** - Evolução mensal
5. **Box Plots** - Distribuição por grupos
6. **Gráfico de Pizza** - Proporção por sexo
7. **Heatmap** - Mês x Faixa etária

### CONVERSÃO ggplot → plotly
- `ggplotly()`: tornar qualquer ggplot interativo
- Mantém formatação original
- Adiciona interatividade automaticamente

### EXPORTAÇÃO DE VISUALIZAÇÕES

**ggsave():** salvar gráficos ggplot2
- Formatos: PNG, PDF, SVG
- Controle de resolução (DPI)

**htmlwidgets::saveWidget():** gráficos plotly
- Formato HTML interativo

### RESULTADOS DE APRENDIZAGEM
✓ Aplicar princípios de boas práticas visuais  
✓ Escolher tipo de gráfico adequado  
✓ Criar gráficos estáticos com ggplot2  
✓ Criar gráficos interativos com plotly  
✓ Usar paletas de cores acessíveis  
✓ Exportar visualizações em diferentes formatos  
✓ Comunicar resultados efetivamente

**PRÉ-REQUISITOS:** Completar Scripts 2 e 3  
**DURAÇÃO:** 2-3 horas  
**PÚBLICO:** Pessoas que dominam manipulação de dados

---

## 📊 DADOS NECESSÁRIOS

### ARQUIVOS PRINCIPAIS
- `sim_salvador_2023.csv` (dados brutos do SIM)
- `sim_salvador_2023.xlsx` (formato alternativo)
- `sim_salvador_2023.parquet` (formato otimizado)

### ARQUIVO PROCESSADO
- `sim_salvador_2023_processado.csv` (gerado pelo Script 2)
- `sim_salvador_2023_visualizacao.csv` (gerado pelo Script 3)

### ESTRUTURA DO DATASET

**Variáveis principais:**
- **SEXO:** categórica (0=Ignorado, 1=Masculino, 2=Feminino)
- **DTOBITO:** data do óbito (formato ddmmyyyy)
- **IDADE:** idade codificada do DATASUS
  - 1º dígito: tipo (0-3: menos de 1 ano, 4: anos, 5: centenários)
  - Demais dígitos: quantidade
- **DTNASC:** data de nascimento
- **CAUSABAS:** causa básica do óbito (CID-10)
- **CODMUNRES:** código IBGE do município de residência

### ONDE OBTER OS DADOS
- [DATASUS](https://datasus.saude.gov.br/)
- TabNet: ferramenta web para consulta
- Download direto: ftp do DATASUS
- Secretarias municipais de saúde

---

## 💻 PACOTES R NECESSÁRIOS

### INSTALAÇÃO COMPLETA

```r
install.packages(c(
  "tidyverse",    # Meta-pacote essencial
  "lubridate",    # Manipulação de datas
  "readxl",       # Leitura de Excel
  "arrow",        # Leitura de Parquet
  "plotly",       # Gráficos interativos
  "scales"        # Formatação de escalas
))
```

### PACOTES INCLUÍDOS NO TIDYVERSE
✓ dplyr - Manipulação de dados  
✓ ggplot2 - Visualização estática  
✓ tidyr - Organização de dados  
✓ readr - Leitura de arquivos CSV  
✓ stringr - Manipulação de strings  
✓ tibble - Dataframes modernos  
✓ purrr - Programação funcional  
✓ forcats - Fatores/categorias

### VERIFICAÇÃO DA INSTALAÇÃO

```r
# Verificar se pacotes estão instalados
installed.packages()

# Verificar versão
packageVersion("tidyverse")

# Carregar e testar
library(tidyverse)
library(plotly)
```

---

## 🎯 OBJETIVOS DE APRENDIZAGEM GERAIS

Ao completar os 4 scripts, o aluno será capaz de:

### 1. FUNDAMENTOS DE R
✓ Compreender e usar tipos de dados  
✓ Criar e manipular variáveis  
✓ Usar operadores e funções básicas  
✓ Entender estruturas de dados

### 2. MANIPULAÇÃO DE DADOS
✓ Importar dados de múltiplos formatos  
✓ Explorar e entender estrutura dos dados  
✓ Limpar e preparar dados para análise  
✓ Criar variáveis derivadas complexas  
✓ Filtrar com condições simples e complexas  
✓ Agrupar e agregar dados  
✓ Trabalhar com datas e strings  
✓ Combinar tabelas (joins)

### 3. ANÁLISE DE DADOS
✓ Calcular frequências e proporções  
✓ Realizar análises descritivas  
✓ Comparar grupos estatisticamente  
✓ Identificar padrões temporais  
✓ Analisar distribuições  
✓ Interpretar resultados epidemiológicos

### 4. VISUALIZAÇÃO DE DADOS
✓ Aplicar princípios de design visual  
✓ Escolher gráfico adequado ao dado  
✓ Criar gráficos estáticos profissionais (ggplot2)  
✓ Criar gráficos interativos (plotly)  
✓ Usar cores de forma acessível  
✓ Exportar em múltiplos formatos  
✓ Comunicar insights efetivamente

### 5. FLUXO DE TRABALHO
✓ Organizar código de forma legível  
✓ Comentar adequadamente  
✓ Usar pipe `%>%` efetivamente  
✓ Gerenciar ambiente de trabalho  
✓ Documentar análises  
✓ Reproduzir análises

---

## 💡 COMPETÊNCIAS DESENVOLVIDAS

### COMPETÊNCIAS TÉCNICAS
- Programação em R
- Análise estatística descritiva
- Manipulação de grandes volumes de dados
- Visualização de dados
- Pensamento computacional

### COMPETÊNCIAS ANALÍTICAS
- Interpretação de dados de saúde
- Identificação de padrões
- Análise crítica de resultados
- Comunicação de insights
- Tomada de decisão baseada em dados

### COMPETÊNCIAS PRÁTICAS
- Uso do RStudio
- Trabalho com dados do DATASUS
- Criação de relatórios
- Compartilhamento de análises
- Reprodutibilidade de pesquisa

---

## 📚 RECURSOS ADICIONAIS

### DOCUMENTAÇÃO OFICIAL
- [R Project](https://www.r-project.org/)
- [RStudio/Posit](https://posit.co/)
- [Tidyverse](https://www.tidyverse.org/)
- [ggplot2](https://ggplot2.tidyverse.org/)
- [plotly R](https://plotly.com/r/)
- [dplyr](https://dplyr.tidyverse.org/)

### LIVROS GRATUITOS
- [R for Data Science (Hadley Wickham)](https://r4ds.hadley.nz/)
- [ggplot2: Elegant Graphics for Data Analysis](https://ggplot2-book.org/)
- [Fundamentals of Data Visualization (Claus Wilke)](https://clauswilke.com/dataviz/)

### TUTORIAIS INTERATIVOS
- [RStudio Primers](https://posit.cloud/learn/primers)
- Swirl (pacote R): aprender R dentro do R
- DataCamp: cursos introdutórios gratuitos

### COMUNIDADES
- [RStudio Community](https://community.rstudio.com/)
- [Stack Overflow - R](https://stackoverflow.com/questions/tagged/r)
- [R-Bloggers](https://www.r-bloggers.com/)
- Twitter: #RStats, #TidyTuesday

### GALERIAS DE VISUALIZAÇÃO
- [R Graph Gallery](https://r-graph-gallery.com/)
- [plotly Gallery](https://plotly.com/r/)
- [From Data to Viz](https://www.data-to-viz.com/)

### DADOS DE SAÚDE PÚBLICA
- [DATASUS](https://datasus.saude.gov.br/)
- TabNet: estatísticas interativas
- [OpenDataSUS](https://opendatasus.saude.gov.br/)
- Observatório COVID-19 Fiocruz

### CHEAT SHEETS
- RStudio IDE Cheat Sheet
- dplyr Data Transformation
- ggplot2 Data Visualization
- lubridate Dates and Times
- stringr String Manipulation

[Disponíveis em posit.co](https://posit.co/resources/cheatsheets/)

---

## 🔧 SOLUÇÃO DE PROBLEMAS COMUNS

### Pacote não instala
```r
# Soluções:
install.packages("nome", dependencies = TRUE)
# Atualizar R e RStudio
# Verificar permissões do sistema
```

### Erro ao importar dados
```r
# Verificar caminho
getwd()
setwd("caminho/correto")
# Verificar separador e encoding
```

### Gráfico não aparece
```r
# Usar print() para objetos ggplot
print(meu_grafico)
# Limpar painel de gráficos
```

### Erro "object not found"
```r
# Verificar nome (case-sensitive)
# Executar linhas anteriores
# Verificar se pacote está carregado
library(dplyr)
```

---

## ✨ BOAS PRÁTICAS DE PROGRAMAÇÃO

### ORGANIZAÇÃO DE CÓDIGO
- Comentar código explicando "por quê", não "o quê"
- Usar nomes descritivos de variáveis
- Dividir código em seções lógicas
- Usar pipe `%>%` para encadear operações
- Limitar linhas a ~80 caracteres

### ESTILO DE CÓDIGO
- Seguir guia de estilo tidyverse
- Usar `snake_case` para nomes
- Espaços ao redor de operadores
- Indentação consistente (2 espaços)
- Uma linha por pipe `%>%`

### REPRODUTIBILIDADE
- Salvar versão dos pacotes usados
- Documentar sessão R (`sessionInfo()`)
- Usar projetos do RStudio (`.Rproj`)
- Controle de versão com Git (avançado)
- Compartilhar código e dados

### GERENCIAMENTO DE DADOS
- Nunca modificar dados originais
- Salvar dados processados separadamente
- Documentar transformações realizadas
- Usar formatos abertos (CSV, não XLS)
- Fazer backup regular

---

## 🚀 PRÓXIMOS PASSOS

### CURTO PRAZO (1-2 meses)
- Aplicar conhecimentos em dados do seu trabalho
- Praticar diariamente (mesmo que 15 minutos)
- Refazer os scripts com novos dados
- Criar portfolio de projetos

### MÉDIO PRAZO (3-6 meses)
- Aprender tópicos avançados:
  - Modelos estatísticos (lm, glm)
  - Machine learning (caret, tidymodels)
  - Relatórios automáticos (R Markdown, Quarto)
  - Dashboards (Shiny, flexdashboard)
- Participar de eventos e conferências
- Contribuir para projetos open source

### LONGO PRAZO (6-12 meses)
- Dominar análise estatística avançada
- Criar pacotes R próprios
- Publicar análises e tutoriais
- Mentoriar outros aprendizes
- Especializar-se em área específica

### ESPECIALIZAÇÕES POSSÍVEIS
- Epidemiologia computacional
- Bioestatística
- Ciência de dados em saúde
- Visualização de dados
- Machine learning para saúde
- Análise espacial (GIS)
- Análise de séries temporais

---

## 📝 AVALIAÇÃO E CERTIFICAÇÃO

### CRITÉRIOS DE AVALIAÇÃO
- Participação nas aulas práticas
- Conclusão dos exercícios
- Projeto final (análise completa)
- Apresentação de resultados

### PROJETO FINAL SUGERIDO
Realizar análise completa dos dados do SIM incluindo:
1. Importação e limpeza dos dados
2. Análise exploratória descritiva
3. Criação de variáveis relevantes
4. Análises por grupos de interesse
5. Visualizações profissionais
6. Relatório com interpretação dos achados

### CERTIFICADO
Emitido mediante:
- Frequência mínima de 75%
- Entrega do projeto final
- Aprovação na avaliação (se houver)

---

## 📧 SUPORTE E FEEDBACK

### DURANTE O CURSO
- Tire dúvidas com instrutores
- Participe de discussões em grupo
- Use material de apoio fornecido
- Pratique os exemplos dos scripts

### APÓS O CURSO
- Consulte a documentação oficial
- Use fóruns e comunidades online
- Revise os scripts comentados
- Pratique com novos datasets
- Compartilhe seu aprendizado

### DICAS PARA APRENDIZADO CONTÍNUO
- Pratique regularmente (30min/dia)
- Trabalhe com dados reais do seu contexto
- Participe de comunidades online
- Ensine o que aprendeu (melhor forma de fixar)
- Faça projetos pessoais
- Acompanhe blogs e newsletters sobre R

---

## 📄 LICENÇA E USO

### TERMOS DE USO
Este material foi desenvolvido para fins educacionais e pode ser usado livremente para:
- Ensino e treinamento
- Pesquisa acadêmica
- Análise de dados de saúde pública
- Prática e aprendizado individual

### REQUISITOS
- Citar a fonte apropriadamente
- Manter os créditos originais
- Não usar para fins comerciais sem autorização
- Compartilhar melhorias com a comunidade

### COMO CITAR
```
[Nome do Curso]. (2025). Formação Breve em Ciência de Dados e Informações
para o SUS - Scripts de R. Rio de Janeiro: Campus Virtual.
```

---

## 🙏 AGRADECIMENTOS E CRÉDITOS

Este material foi desenvolvido para o curso "Formação Breve em Ciência de Dados e Informações para o SUS" com o objetivo de capacitar profissionais de saúde pública em análise de dados usando R.

**INSPIRAÇÕES:**
- R for Data Science (Hadley Wickham & Garrett Grolemund)
- Tidyverse style guide
- Carpentries workshops
- Comunidade R brasileira

**DADOS:**
Sistema de Informações de Mortalidade (SIM) - DATASUS/Ministério da Saúde

---

**Última Atualização:** Novembro 2025  
**Versão:** 2.0 - Atualizado com 4 scripts ABRASCO

---

*Desenvolvido com ❤️ para a comunidade de saúde pública brasileira*
