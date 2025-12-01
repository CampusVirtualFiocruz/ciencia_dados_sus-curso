# ==============================================================================
# GUIA COMPLETO DE R E TIDYVERSE
# Conhecimento Consolidado e Incrementado
# ==============================================================================

# ÍNDICE:
# 1. CÁLCULOS BÁSICOS E OPERADORES
# 2. ESTRUTURAS DE DADOS
#    2.1 Vetores
#    2.2 Matrizes
#    2.3 Arrays
#    2.4 Fatores
#    2.5 Listas
#    2.6 Data Frames e Tibbles
# 3. IMPORTAÇÃO E EXPORTAÇÃO DE DADOS
# 4. MANIPULAÇÃO DE DADOS COM TIDYVERSE
#    4.1 dplyr - Transformação de dados
#    4.2 tidyr - Reorganização de dados
#    4.3 Joins - Combinação de tabelas
# 5. VISUALIZAÇÃO DE DADOS
#    5.1 Gráficos base R
#    5.2 ggplot2
#    5.3 plotly (interativo)
# 6. FUNÇÕES E ESTRUTURAS DE CONTROLE
# 7. BOAS PRÁTICAS E DICAS

# ==============================================================================
# 0. CONFIGURAÇÃO INICIAL
# ==============================================================================

# Pacotes essenciais do tidyverse
library(tidyverse)    # Meta-pacote: dplyr, ggplot2, tidyr, readr, purrr, tibble, stringr, forcats
library(lubridate)    # Manipulação de datas
library(magrittr)     # Pipe operators adicionais
library(readxl)       # Leitura de Excel
library(plotly)       # Gráficos interativos
library(RColorBrewer) # Paletas de cores

# ==============================================================================
# 1. CÁLCULOS BÁSICOS E OPERADORES
# ==============================================================================

# Operadores aritméticos
4 + 5           # Adição
5 * 9           # Multiplicação
9 %% 3          # Módulo (resto da divisão)
9 %/% 6         # Divisão inteira
10^10           # Potência

# Funções matemáticas básicas
log(10)         # Logaritmo natural
log10(10)       # Logaritmo base 10
sqrt(10)        # Raiz quadrada
abs(-10)        # Valor absoluto
round(3.14159, 2)  # Arredondamento

# Precedência de operadores
3 + 4 * 5 - 76/2
(3 + 4) * 5 - 76/2

# ==============================================================================
# 2. ESTRUTURAS DE DADOS
# ==============================================================================

# ------------------------------------------------------------------------------
# 2.1 VETORES - Base do R
# ------------------------------------------------------------------------------

# Criação de vetores
meses <- c(1, 2, 3, 4, 5, 6, 7)
alunos <- c("Vanessa", "Pilar", "Mariana", "Clarissa")

# Sequências
seq(1, 10)                    # 1 a 10
seq(1, 10, by = 2)           # Incremento de 2
1:10                          # Atalho para seq(1, 10)
rep(5, times = 3)            # Repetir 5 três vezes
rep(c(1, 2), times = 3)      # Repetir vetor

# Acessando elementos
meses[1]                      # Primeiro elemento
meses[2:6]                    # Elementos 2 até 6
meses[c(1, 3, 5)]            # Elementos específicos
meses[-4]                     # Todos exceto o 4º

# Modificando vetores
meses[4] <- 10
meses[c(2, 4)] <- c(36, 90)
meses[1:3] <- c(12, 45, 70)

# Operações vetoriais (element-wise)
meses + 2
meses * 2
meses / 2
meses ^ 2

# Funções estatísticas básicas
length(meses)                 # Comprimento
mean(meses)                   # Média
median(meses)                 # Mediana
sd(meses)                     # Desvio padrão
var(meses)                    # Variância
max(meses)                    # Máximo
min(meses)                    # Mínimo
sum(meses)                    # Soma
range(meses)                  # Mínimo e máximo
quantile(meses)               # Quartis

# Ordenação
sort(meses)                   # Crescente
sort(meses, decreasing = TRUE) # Decrescente
order(meses)                  # Índices de ordenação

# Operações com dois vetores
vendas_v1 <- c(2, 4, 6, 8, 10)
vendas_v2 <- c(3, 5, 7, 8, 11)
vendas_v1 + vendas_v2
vendas_v1 * vendas_v2

# Operações de conjunto
intersect(vendas_v1, vendas_v2)  # Interseção
union(vendas_v1, vendas_v2)      # União
setdiff(vendas_v1, vendas_v2)    # Diferença

# Vetores lógicos
idade <- c(15, 25, 35, 45, 55)
idade > 30                    # Retorna vetor lógico
idade[idade > 30]            # Filtragem
any(idade > 50)              # Algum TRUE?
all(idade > 10)              # Todos TRUE?

# ------------------------------------------------------------------------------
# 2.2 MATRIZES - Dados bidimensionais homogêneos
# ------------------------------------------------------------------------------

# Criação de matrizes
matrix(1:20, nrow = 4, ncol = 5)
matrix(1:20, nrow = 4, ncol = 5, byrow = TRUE)

# Combinar vetores em matriz
condicoes <- c("pedra", "riacho", "lago", "mar")
colonias <- c(15, 25, 35, 45)
contagem <- cbind(condicoes, colonias)  # Por coluna
contagem_rb <- rbind(condicoes, colonias)  # Por linha

# Acessando elementos
contagem[3, 2]                # Linha 3, coluna 2
contagem[3, ]                 # Toda linha 3
contagem[, 2]                 # Toda coluna 2
contagem[2:4, ]              # Linhas 2 a 4

# Modificando elementos
contagem[1, 1] <- "pedra1"
contagem[2, ] <- c("riacho", 36)
contagem[2:4, 2] <- c(37, 189, 180)

# Conversão de tipo
contagem2 <- as.numeric(contagem[, 2])

# Dimensões e informações
dim(contagem)                 # Linhas e colunas
nrow(contagem)               # Número de linhas
ncol(contagem)               # Número de colunas

# Operações matriciais
vendas_reais <- cbind(
  fulano = c(130, 90, 80, 49),
  beltrano = c(158, 190, 78, 56),
  cicrano = c(59, 189, 69, 53)
)

vendas_reais + 4
vendas_reais * 0.3
sum(vendas_reais[, 1])       # Soma de uma coluna
mean(vendas_reais[, 2])      # Média de uma coluna
colMeans(vendas_reais)       # Médias de todas as colunas
rowMeans(vendas_reais)       # Médias de todas as linhas
colSums(vendas_reais)        # Somas de todas as colunas
rowSums(vendas_reais)        # Somas de todas as linhas

# Álgebra linear
A <- matrix(1:50, nrow = 5, ncol = 10)
B <- vendas_reais * 2

# Produto matricial (requer dimensões compatíveis)
# A %*% B

# Transposta
t(A)

# Determinante (apenas matrizes quadradas)
C <- matrix(c(3, 2, 1, 1), nrow = 2)
det(C)

# Matriz inversa
solve(C)

# Nomes de linhas e colunas
colnames(vendas_reais) <- c("Vendedor1", "Vendedor2", "Vendedor3")
rownames(vendas_reais) <- c("Jan", "Fev", "Mar", "Abr")

# ------------------------------------------------------------------------------
# 2.3 ARRAYS - Dados multidimensionais
# ------------------------------------------------------------------------------

# Criação de arrays
A <- array(0, dim = c(4, 5, 3))
A <- array(1:60, dim = c(3, 4, 5))

# Nomeando dimensões
linha <- c("L1", "L2", "L3")
coluna <- c("C1", "C2", "C3", "C4")
matrizes <- c("M1", "M2", "M3", "M4", "M5")

A <- array(1:60,
           dim = c(3, 4, 5),
           dimnames = list(linha, coluna, matrizes))

# Acessando elementos
A[, , 1]                     # Primeira matriz
A[1, , ]                     # Primeira linha de todas as matrizes
A[, 1, ]                     # Primeira coluna de todas as matrizes

# ------------------------------------------------------------------------------
# 2.4 FATORES - Variáveis categóricas
# ------------------------------------------------------------------------------

# Criação de fatores
genero <- c("1", "3", "2", "1", "2", "3", "1", "1")
genero_ft <- as.factor(genero)
genero_ft <- factor(c("1", "3", "2", "1", "2", "3", "1", "1"))

# Estrutura
str(genero_ft)
levels(genero_ft)            # Níveis do fator
nlevels(genero_ft)           # Número de níveis

# Acessando e modificando
genero_ft[2]
genero_ft[2:4]
genero_ft[2] <- 2

# Manipulação com forcats (tidyverse)
library(forcats)

# Concatenar fatores
covid_neg <- factor(c("branco", "pardo", "pardo", "branco", "preto"))
covid_pos <- factor(c("pardo", "pardo", "preto", "preto", "branco"))
pacientes <- fct_c(covid_neg, covid_pos)

# Recodificar níveis
genero_ft_labels <- fct_recode(genero_ft,
                               Masculino = "1",
                               Feminino = "2",
                               Outros = "3")

# Agrupar níveis
doencas_cron <- factor(c("cardiopatia", "asma", "diabetes", "artrite"))
doencas_agrupadas <- fct_collapse(doencas_cron,
                                  Grupo_risco = c("cardiopatia", "diabetes", "asma"),
                                  Grupo_nao_risco = c("artrite")
)

# Reordenar níveis manualmente
escolaridade <- factor(c("ens_med", "fund", "pos-grad", "grad"))
escolaridade_ord <- fct_relevel(escolaridade,
                                c("fund", "ens_med", "grad", "pos-grad"))

# Reordenar por variável externa
salario <- c(300, 500, 3800, 2000)
escolaridade2 <- factor(c("ens_med", "fund", "pos-grad", "grad"))
escolaridade_sal <- fct_reorder(escolaridade2, salario, mean)

# Contar níveis
fct_count(genero_ft_labels)

# Visualização rápida
plot(genero_ft_labels)

# ------------------------------------------------------------------------------
# 2.5 LISTAS - Estruturas heterogêneas
# ------------------------------------------------------------------------------

# Criação de listas
paciente_id <- seq(1, 6)
paciente_nome <- c("Maria", "José", "João", "Martha", "Pedro", "Paulo")
paciente_idade <- c(59, 67, 37, 69, 45, 89)
paciente_sintomatico <- c(TRUE, FALSE, FALSE, TRUE, TRUE, TRUE)

# Lista sem nomes
paciente_perfil <- list(paciente_id, paciente_nome, paciente_idade,
                        paciente_sintomatico, matrix(0, 4, 5), mean)

# Lista com nomes
paciente_perfil2 <- list(
  ID = paciente_id,
  Nome = paciente_nome,
  Idade = paciente_idade,
  Sintomatico = paciente_sintomatico,
  Historico = matrix(0, 4, 5),
  Media_Idade = mean(paciente_idade)
)

# Adicionar nomes depois
names(paciente_perfil) <- c("ID", "Nomes", "Idade", "Sintomatico",
                            "Historico", "Media_Idade")

# Acessando elementos
paciente_perfil$Historico
paciente_perfil$Nomes[2]
paciente_perfil$Nomes[2:4]
paciente_perfil[[1]]         # Acessa o objeto completo

# Modificando elementos
paciente_perfil$Nomes[2] <- "Josias"
paciente_perfil$Idade[c(2, 4)] <- c(39, 78)
paciente_perfil$Sintomatico[4] <- FALSE

# Adicionar elementos
paciente_perfil$Estado <- c("Bahia", "SP", "RJ", "MG", "PE", "CE")

# Unir listas
pacientes_dados <- list(
  Estado = c("Bahia", "Tocantins", "São Paulo", "Minas Gerais"),
  Data = c("12-09-2020", "21-09-2020", "11-07-2020", "09-05-2020")
)
Dados_finais <- c(paciente_perfil, pacientes_dados)

# Converter lista em vetor
dados_vetor <- unlist(Dados_finais)

# ------------------------------------------------------------------------------
# 2.6 DATA FRAMES E TIBBLES - Tabelas de dados
# ------------------------------------------------------------------------------

# Criação de data frames
alunos <- c("A", "B", "C", "D", "E")
prova1 <- c(9, 7.5, 8, 8, 5.5)
prova2 <- c(3.5, 7.2, 6, 6.8, 10)
prova3 <- c(9.3, 5.4, 5, 7, 2.5)

# Método 1: Converter matriz
boletim <- cbind(alunos, prova1, prova2, prova3)
boletim_df <- as.data.frame(boletim)

# Método 2: Criar diretamente
boletim2 <- data.frame(
  alunos = c("A", "B", "C", "D", "E"),
  prova1 = c(9, 7.5, 8, 8, 5.5),
  prova2 = c(3.5, 7.2, 6, 6.8, 10),
  prova3 = c(9.3, 5.4, 5, 7, 2.5),
  stringsAsFactors = FALSE
)

# Método 3: Usando vetores existentes
boletim3 <- data.frame(alunos, prova1, prova2, prova3)

# TIBBLES - Versão moderna do data frame
library(tibble)

# Criar tibble diretamente
df_tbl <- tibble(
  Dia = c("1", "2", "3"),
  Vendas = c(2900, 3870, 4500),
  Faturamento = c(200, 380, 450)
)

# Usando tribble (transposed tibble)
df <- tribble(
  ~Dia, ~Vendas, ~Faturamento,
  "1", 2900, 200,
  "2", 3870, 380,
  "3", 4500, 450
)

# Converter para tibble
boletim_tbl <- as_tibble(boletim2)

# Converter de volta para data frame
boletim_df2 <- as.data.frame(boletim_tbl)

# Acessando elementos
boletim2[1, ]                # Primeira linha
boletim2[1:3, ]             # Linhas 1 a 3
boletim2$alunos             # Coluna alunos
boletim2$alunos[1]          # Primeiro elemento da coluna
boletim2[1, 1]              # Linha 1, coluna 1

# Modificando elementos
boletim2$prova1[2] <- 2.5
boletim2$prova2[2:4] <- c(7.5, 6.5, 7.3)
boletim2$alunos <- c("Livia", "Mariana", "Marina", "Maria", "Pilar")

# Adicionando colunas
boletim2$prova4 <- c(3, 9, 8, 3, 5)

# Adicionando linhas
boletim2[6, ] <- c("Renata", 9.7, 5.6, 8.0, 7.5)

# Removendo colunas
boletim2 <- boletim2[, -5]   # Remove 5ª coluna

# Removendo linhas
boletim2 <- boletim2[-2, ]   # Remove 2ª linha

# Informações sobre o data frame
nrow(boletim2)               # Número de linhas
ncol(boletim2)               # Número de colunas
dim(boletim2)                # Dimensões
names(boletim2)              # Nomes das colunas
colnames(boletim2)           # Nomes das colunas (alternativa)
rownames(boletim2)           # Nomes das linhas
str(boletim2)                # Estrutura
summary(boletim2)            # Resumo estatístico
head(boletim2)               # Primeiras linhas
tail(boletim2)               # Últimas linhas
glimpse(boletim2)            # Visão geral (tidyverse)
View(boletim2)               # Visualizar tabela

# ==============================================================================
# 3. IMPORTAÇÃO E EXPORTAÇÃO DE DADOS
# ==============================================================================

# ------------------------------------------------------------------------------
# 3.1 Arquivos TXT
# ------------------------------------------------------------------------------

# Separado por espaços
dados_txt <- read.table("arquivo.txt", header = TRUE)

# Separado por TAB
dados_tab <- read.table("arquivo.txt", header = TRUE, sep = "\t")

# Separado por ponto e vírgula
dados_pv <- read.table("arquivo.txt", header = TRUE, sep = ";")

# Pulando linhas de texto
dados_skip <- read.table("arquivo.txt", header = TRUE, sep = "\t", skip = 6)

# Lendo apenas texto
texto <- readLines("texto.txt")

# Usando readr (tidyverse) - mais rápido e retorna tibble
dados_readr <- read_table("arquivo.txt")
dados_tab2 <- read_delim("arquivo.txt", delim = "\t")

# ------------------------------------------------------------------------------
# 3.2 Arquivos CSV
# ------------------------------------------------------------------------------

# Base R
dados_csv <- read.csv("dados.csv", header = TRUE, sep = ",")
dados_csv2 <- read.csv2("dados.csv", header = TRUE, sep = ";", dec = ",")

# Tidyverse (readr) - Mais rápido
dados_csv_tidy <- read_csv("dados.csv")      # Separado por vírgula
dados_csv2_tidy <- read_csv2("dados.csv")    # Separado por ponto e vírgula

# Especificar colunas
dados_csv3 <- read_csv("dados.csv",
                       col_names = TRUE,
                       col_types = cols(
                         idade = col_integer(),
                         nome = col_character(),
                         data = col_date(format = "%d/%m/%Y")
                       ))

# Pular linhas
dados_csv4 <- read_csv("dados.csv", skip = 1, col_names = FALSE)

# URL
dados_url <- read_csv("https://exemplo.com/dados.csv")

# ------------------------------------------------------------------------------
# 3.3 Arquivos Excel
# ------------------------------------------------------------------------------

# Pacote readxl (tidyverse)
library(readxl)

# Ler planilha
dados_excel <- read_xlsx("dados.xlsx", sheet = 1)
dados_excel2 <- read_xlsx("dados.xlsx", sheet = "Planilha1")

# Especificar intervalo
dados_excel3 <- read_xlsx("dados.xlsx",
                          sheet = 1,
                          range = "A1:D10")
dados_excel4 <- read_xlsx("dados.xlsx",
                          sheet = 1,
                          range = cell_rows(2:7))

# Listar planilhas
excel_sheets("dados.xlsx")

# ------------------------------------------------------------------------------
# 3.4 Outros formatos
# ------------------------------------------------------------------------------

# SPSS
library(haven)
dados_spss <- read_sav("dados.sav")

# Stata
dados_stata <- read_dta("dados.dta")

# SAS
dados_sas <- read_sas("dados.sas7bdat")

# Parquet
library(arrow)
dados_parquet <- read_parquet("dados.parquet")

# JSON
library(jsonlite)
dados_json <- fromJSON("dados.json")

# ------------------------------------------------------------------------------
# 3.5 Exportação de dados
# ------------------------------------------------------------------------------

# CSV
write.csv(dados, "saida.csv", row.names = FALSE)
write_csv(dados, "saida.csv")  # tidyverse

# Excel
library(writexl)
write_xlsx(dados, "saida.xlsx")

# RDS (formato R)
saveRDS(dados, "dados.rds")
dados <- readRDS("dados.rds")

# ==============================================================================
# 4. MANIPULAÇÃO DE DADOS COM TIDYVERSE
# ==============================================================================

# ------------------------------------------------------------------------------
# 4.1 dplyr - Gramática da manipulação de dados
# ------------------------------------------------------------------------------

# Operador pipe: %>% (magrittr) ou |> (R 4.1+)
# Leia como "então" ou "em seguida"

# SELECT - Selecionar colunas
dados %>% select(nome, idade, salario)
dados %>% select(-coluna_indesejada)
dados %>% select(starts_with("pre"))
dados %>% select(ends_with("pos"))
dados %>% select(contains("idade"))
dados %>% select(matches("^[A-Z]"))
dados %>% select(where(is.numeric))

# FILTER - Filtrar linhas
dados %>% filter(idade > 30)
dados %>% filter(idade > 30 & salario < 5000)
dados %>% filter(idade > 30 | cidade == "SP")
dados %>% filter(nome %in% c("Ana", "João", "Maria"))
dados %>% filter(between(idade, 20, 40))
dados %>% filter(!is.na(idade))

# ARRANGE - Ordenar linhas
dados %>% arrange(idade)
dados %>% arrange(desc(idade))
dados %>% arrange(cidade, desc(salario))

# MUTATE - Criar/modificar colunas
dados %>% mutate(
  salario_anual = salario * 12,
  faixa_etaria = case_when(
    idade < 18 ~ "Menor",
    idade >= 18 & idade < 60 ~ "Adulto",
    idade >= 60 ~ "Idoso",
    TRUE ~ NA_character_
  )
)

# TRANSMUTE - Criar colunas e manter apenas elas
dados %>% transmute(
  nome,
  salario_mensal = salario,
  salario_anual = salario * 12
)

# SUMMARISE/SUMMARIZE - Resumir dados
dados %>% summarise(
  n = n(),
  media_idade = mean(idade, na.rm = TRUE),
  mediana_salario = median(salario, na.rm = TRUE),
  min_idade = min(idade, na.rm = TRUE),
  max_idade = max(idade, na.rm = TRUE),
  sd_idade = sd(idade, na.rm = TRUE)
)

# GROUP_BY - Agrupar dados
dados %>%
  group_by(cidade) %>%
  summarise(
    n = n(),
    media_salario = mean(salario, na.rm = TRUE),
    total_salario = sum(salario, na.rm = TRUE)
  )

# Múltiplos agrupamentos
dados %>%
  group_by(cidade, genero) %>%
  summarise(
    n = n(),
    media_idade = mean(idade, na.rm = TRUE)
  ) %>%
  ungroup()  # Sempre desagrupar quando terminar

# COUNT - Contar observações
dados %>% count(cidade)
dados %>% count(cidade, genero, sort = TRUE)

# DISTINCT - Valores únicos
dados %>% distinct(cidade)
dados %>% distinct(cidade, genero, .keep_all = TRUE)

# SLICE - Selecionar linhas por posição
dados %>% slice(1:5)
dados %>% slice_head(n = 10)
dados %>% slice_tail(n = 10)
dados %>% slice_sample(n = 100)
dados %>% slice_max(salario, n = 10)
dados %>% slice_min(idade, n = 5)

# RENAME - Renomear colunas
dados %>% rename(nome_completo = nome, salario_mensal = salario)
dados %>% rename_with(toupper)  # Maiúsculas
dados %>% rename_with(tolower)  # Minúsculas

# RELOCATE - Reordenar colunas
dados %>% relocate(idade, .before = nome)
dados %>% relocate(salario, .after = last_col())

# Encadeamento complexo
resultado <- dados %>%
  filter(idade > 25) %>%
  select(nome, idade, cidade, salario) %>%
  mutate(
    salario_anual = salario * 12,
    faixa_salarial = case_when(
      salario < 3000 ~ "Baixo",
      salario >= 3000 & salario < 8000 ~ "Médio",
      salario >= 8000 ~ "Alto"
    )
  ) %>%
  group_by(cidade, faixa_salarial) %>%
  summarise(
    n = n(),
    media_idade = mean(idade),
    total_salario = sum(salario_anual),
    .groups = "drop"
  ) %>%
  arrange(desc(total_salario))

# ------------------------------------------------------------------------------
# 4.2 tidyr - Reorganização de dados
# ------------------------------------------------------------------------------

# PIVOT_LONGER (gather) - Formato largo para longo
dados_largo <- tibble(
  regiao = c("Norte", "Sul", "Leste"),
  `2020` = c(100, 150, 200),
  `2021` = c(110, 160, 210),
  `2022` = c(120, 170, 220)
)

dados_longo <- dados_largo %>%
  pivot_longer(
    cols = `2020`:`2022`,
    names_to = "ano",
    values_to = "valor"
  )

# PIVOT_WIDER (spread) - Formato longo para largo
dados_largo2 <- dados_longo %>%
  pivot_wider(
    names_from = ano,
    values_from = valor
  )

# SEPARATE - Separar uma coluna em múltiplas
dados %>%
  separate(nome_completo,
           into = c("primeiro_nome", "sobrenome"),
           sep = " ")

dados %>%
  separate(data,
           into = c("ano", "mes", "dia"),
           sep = "-",
           convert = TRUE)

# UNITE - Unir múltiplas colunas
dados %>%
  unite("nome_completo", primeiro_nome, sobrenome, sep = " ")

dados %>%
  unite("data", ano, mes, dia, sep = "-")

# FILL - Preencher valores faltantes
dados %>% fill(coluna, .direction = "down")
dados %>% fill(coluna, .direction = "up")

# DROP_NA - Remover linhas com NA
dados %>% drop_na()              # Remove se qualquer coluna tem NA
dados %>% drop_na(idade, salario)  # Remove se colunas específicas têm NA

# REPLACE_NA - Substituir NA
dados %>% replace_na(list(idade = 0, cidade = "Desconhecido"))

# ------------------------------------------------------------------------------
# 4.3 Joins - Combinação de tabelas
# ------------------------------------------------------------------------------

# Exemplo de dados
x <- tribble(
  ~UF, ~Diabetes,
  "PE", 43,
  "SP", 34,
  "RJ", 57
)

y <- tribble(
  ~UF, ~Hipertensao, ~Idade,
  "PE", 24, 54,
  "SP", 89, 45,
  "BA", 76, 67
)

# INNER_JOIN - Apenas linhas com correspondência
x %>% inner_join(y, by = "UF")  # Perde RJ e BA

# LEFT_JOIN - Todas as linhas de x
x %>% left_join(y, by = "UF")   # Mantém RJ, perde BA

# RIGHT_JOIN - Todas as linhas de y
x %>% right_join(y, by = "UF")  # Mantém BA, perde RJ

# FULL_JOIN - Todas as linhas de ambas
x %>% full_join(y, by = "UF")   # Mantém todos

# SEMI_JOIN - Linhas de x que têm correspondência em y
x %>% semi_join(y, by = "UF")   # Filtra x

# ANTI_JOIN - Linhas de x que NÃO têm correspondência em y
x %>% anti_join(y, by = "UF")   # Apenas RJ

# Join por múltiplas colunas
dados1 %>% left_join(dados2, by = c("col1", "col2"))

# Join com nomes diferentes
dados1 %>% left_join(dados2, by = c("estado" = "UF"))

# ==============================================================================
# 5. VISUALIZAÇÃO DE DADOS
# ==============================================================================

# ------------------------------------------------------------------------------
# 5.1 Gráficos base R
# ------------------------------------------------------------------------------

# Histograma
hist(dados$idade,
     main = "Distribuição de Idade",
     xlab = "Idade",
     ylab = "Frequência",
     col = "steelblue",
     breaks = 10)

# Boxplot simples
boxplot(dados$idade,
        main = "Boxplot - Idade",
        ylab = "Idade",
        col = "lightblue")

# Boxplot por grupos
boxplot(peso ~ faixa_etaria, data = dados,
        main = "Peso por Faixa Etária",
        xlab = "Faixa Etária",
        ylab = "Peso",
        col = c("red", "green", "blue"))

# Scatterplot
plot(x = dados$idade, y = dados$peso,
     main = "Idade vs Peso",
     xlab = "Idade",
     ylab = "Peso",
     pch = 19,
     col = "darkblue")

# Adicionar linha de tendência
abline(lm(peso ~ idade, data = dados), col = "red", lwd = 2)

# Gráfico de barras
barplot(table(dados$categoria),
        main = "Distribuição por Categoria",
        xlab = "Categoria",
        ylab = "Frequência",
        col = rainbow(5))

# Gráfico de pizza
pie(table(dados$categoria),
    main = "Proporção por Categoria",
    col = rainbow(5))

# Múltiplos gráficos
par(mfrow = c(2, 2))  # 2 linhas, 2 colunas
hist(dados$idade)
boxplot(dados$peso)
plot(dados$idade, dados$peso)
barplot(table(dados$categoria))
par(mfrow = c(1, 1))  # Resetar

# ------------------------------------------------------------------------------
# 5.2 ggplot2 - Grammar of Graphics
# ------------------------------------------------------------------------------

library(ggplot2)

# Estrutura básica: ggplot(data, aes(x, y)) + geom_*()

# Histograma
ggplot(dados, aes(x = idade)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "black") +
  labs(title = "Distribuição de Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal()

# Boxplot
ggplot(dados, aes(x = categoria, y = valor)) +
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  labs(title = "Boxplot por Categoria") +
  theme_classic()

# Boxplot com cores por grupo
ggplot(dados, aes(x = faixa_etaria, y = peso, fill = faixa_etaria)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal()

# Scatterplot
ggplot(dados, aes(x = idade, y = peso)) +
  geom_point(size = 3, alpha = 0.6, color = "darkblue") +
  labs(title = "Idade vs Peso",
       x = "Idade",
       y = "Peso") +
  theme_bw()

# Scatterplot com cores
ggplot(dados, aes(x = idade, y = peso, color = sexo)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_manual(values = c("red", "blue")) +
  theme_minimal()

# Scatterplot com linha de tendência
ggplot(dados, aes(x = idade, y = peso)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Idade vs Peso com Linha de Tendência") +
  theme_minimal()

# Múltiplas variáveis
ggplot(dados, aes(x = idade, y = peso, color = glicemia, size = pressao)) +
  geom_point(alpha = 0.6) +
  scale_color_viridis_c() +
  theme_minimal()

# Gráfico de barras
ggplot(dados, aes(x = categoria)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Contagem por Categoria") +
  theme_minimal()

# Gráfico de barras agrupadas
ggplot(dados, aes(x = categoria, fill = sexo)) +
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()

# Facets - Múltiplos painéis
ggplot(dados, aes(x = idade, y = peso)) +
  geom_point() +
  facet_wrap(~categoria) +
  theme_bw()

ggplot(dados, aes(x = idade, y = peso)) +
  geom_point() +
  facet_grid(sexo ~ categoria) +
  theme_minimal()

# Densidade
ggplot(dados, aes(x = idade, fill = sexo)) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = c("pink", "lightblue")) +
  theme_minimal()

# Violin plot
ggplot(dados, aes(x = categoria, y = valor)) +
  geom_violin(fill = "lightblue") +
  geom_boxplot(width = 0.1, fill = "white") +
  theme_minimal()

# Personalização avançada
ggplot(dados, aes(x = idade, y = peso, color = categoria)) +
  geom_point(size = 3, alpha = 0.6) +
  labs(
    title = "Relação entre Idade e Peso",
    subtitle = "Dados de 2023",
    x = "Idade (anos)",
    y = "Peso (kg)",
    color = "Categoria",
    caption = "Fonte: Dados fictícios"
  ) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12, color = "gray40"),
    axis.text = element_text(size = 10),
    legend.position = "bottom"
  )

# ------------------------------------------------------------------------------
# 5.3 plotly - Gráficos interativos
# ------------------------------------------------------------------------------

library(plotly)

# Histograma interativo
plot_ly(x = dados$idade, type = "histogram") %>%
  layout(title = "Distribuição de Idade",
         xaxis = list(title = "Idade"),
         yaxis = list(title = "Frequência"))

# Histograma com densidade
fit <- density(dados$idade)
plot_ly(x = dados$idade, type = "histogram", name = "Histograma") %>%
  add_trace(x = fit$x, y = fit$y, type = "scatter", mode = "lines",
            fill = "tozeroy", yaxis = "y2", name = "Densidade") %>%
  layout(yaxis2 = list(overlaying = "y", side = "right"))

# Boxplot interativo
plot_ly(y = dados$idade, type = "box", name = "Idade")

# Boxplot por grupos
plot_ly(dados, y = ~peso, color = ~faixa_etaria,
        colors = "Set1", type = "box")

# Boxplot com pontos
plot_ly(y = dados$idade, type = "box", name = "Idade",
        boxpoints = "all", jitter = 0.3, pointpos = 0)

# Scatterplot interativo
plot_ly(data = dados, x = ~idade, y = ~peso,
        type = "scatter", mode = "markers",
        marker = list(size = 10, color = "steelblue"))

# Scatterplot com cores
plot_ly(data = dados, x = ~idade, y = ~peso,
        color = ~categoria, colors = "Set1",
        type = "scatter", mode = "markers")

# Scatterplot com escala de cor contínua
plot_ly(data = dados, x = ~idade, y = ~peso,
        mode = "markers", marker = list(size = 8),
        color = ~glicemia, colors = "Viridis") %>%
  layout(title = "Idade vs Peso (cor = Glicemia)")

# Múltiplas linhas
plot_ly(data = dados, x = ~mes) %>%
  add_trace(y = ~vendas_2022, name = "2022", mode = "lines") %>%
  add_trace(y = ~vendas_2023, name = "2023", mode = "lines") %>%
  layout(title = "Vendas por Mês",
         xaxis = list(title = "Mês"),
         yaxis = list(title = "Vendas"))

# Converter ggplot para plotly
p <- ggplot(dados, aes(x = idade, y = peso, color = sexo)) +
  geom_point() +
  theme_minimal()

ggplotly(p)

# ==============================================================================
# 6. FUNÇÕES E ESTRUTURAS DE CONTROLE
# ==============================================================================

# ------------------------------------------------------------------------------
# 6.1 Estruturas Condicionais
# ------------------------------------------------------------------------------

# IF simples
idade <- 25
if (idade >= 18) {
  print("Maior de idade")
}

# IF-ELSE
if (idade >= 18) {
  print("Maior de idade")
} else {
  print("Menor de idade")
}

# IF-ELSE IF
if (idade < 18) {
  print("Menor de idade")
} else if (idade >= 18 & idade < 60) {
  print("Adulto")
} else {
  print("Idoso")
}

# IFELSE vetorizado
idades <- c(15, 25, 35, 45, 55)
ifelse(idades >= 18, "Maior", "Menor")

# CASE_WHEN (tidyverse) - Mais elegante
tibble(idade = idades) %>%
  mutate(
    categoria = case_when(
      idade < 18 ~ "Menor",
      idade >= 18 & idade < 60 ~ "Adulto",
      idade >= 60 ~ "Idoso",
      TRUE ~ "Desconhecido"
    )
  )

# ------------------------------------------------------------------------------
# 6.2 Loops
# ------------------------------------------------------------------------------

# FOR loop
for (i in 1:5) {
  print(paste("Iteração:", i))
}

# FOR com vetor
nomes <- c("Ana", "João", "Maria")
for (nome in nomes) {
  print(paste("Olá,", nome))
}

# WHILE loop
i <- 1
while (i <= 5) {
  print(paste("Iteração:", i))
  i <- i + 1
}

# REPEAT loop (com break)
i <- 1
repeat {
  print(paste("Iteração:", i))
  i <- i + 1
  if (i > 5) break
}

# NEXT (skip iteration)
for (i in 1:10) {
  if (i %% 2 == 0) next  # Pula números pares
  print(i)
}

# Aplicação prática: calcular médias de alunos
for (i in 1:nrow(boletim_df)) {
  media <- mean(c(boletim_df$prova1[i],
                  boletim_df$prova2[i],
                  boletim_df$prova3[i]))
  
  if (media >= 7) {
    print(paste("Aluno", boletim_df$alunos[i], "aprovado"))
  } else {
    print(paste("Aluno", boletim_df$alunos[i], "reprovado"))
  }
}

# ------------------------------------------------------------------------------
# 6.3 Funções
# ------------------------------------------------------------------------------

# Função simples
saudacao <- function(nome) {
  paste("Olá,", nome, "!")
}

saudacao("Maria")

# Função com múltiplos argumentos
calcular_media <- function(prova1, prova2, prova3) {
  media <- (prova1 + prova2 + prova3) / 3
  return(media)
}

calcular_media(7, 8, 9)

# Função com valor padrão
calcular_media_ponderada <- function(prova1, prova2, prova3,
                                     peso1 = 1, peso2 = 1, peso3 = 1) {
  media <- (prova1 * peso1 + prova2 * peso2 + prova3 * peso3) /
    (peso1 + peso2 + peso3)
  return(media)
}

calcular_media_ponderada(7, 8, 9)
calcular_media_ponderada(7, 8, 9, peso1 = 2, peso3 = 3)

# Função com múltiplos retornos
estatisticas <- function(vetor) {
  lista_resultados <- list(
    media = mean(vetor, na.rm = TRUE),
    mediana = median(vetor, na.rm = TRUE),
    desvio = sd(vetor, na.rm = TRUE),
    minimo = min(vetor, na.rm = TRUE),
    maximo = max(vetor, na.rm = TRUE)
  )
  return(lista_resultados)
}

stats <- estatisticas(c(10, 20, 30, 40, 50))
stats$media
stats$desvio

# Função com validação
dividir <- function(a, b) {
  if (b == 0) {
    stop("Divisão por zero não permitida!")
  }
  return(a / b)
}

# Aplicar função a múltiplos valores (purrr)
library(purrr)

# map - aplica função e retorna lista
notas <- list(c(7, 8, 9), c(5, 6, 7), c(9, 10, 8))
map(notas, mean)

# map_dbl - retorna vetor numérico
map_dbl(notas, mean)

# map2 - duas entradas
pesos1 <- c(60, 70, 80)
pesos2 <- c(65, 72, 82)
map2_dbl(pesos1, pesos2, ~ (.x + .y) / 2)

# pmap - múltiplas entradas
provas <- tibble(
  p1 = c(7, 8, 9),
  p2 = c(8, 7, 10),
  p3 = c(9, 9, 8)
)
pmap_dbl(provas, function(p1, p2, p3) (p1 + p2 + p3) / 3)

# ==============================================================================
# 7. BOAS PRÁTICAS E DICAS
# ==============================================================================

# ------------------------------------------------------------------------------
# 7.1 Estilo de código
# ------------------------------------------------------------------------------

# Use nomes descritivos
# BOM
calcular_media_notas <- function(notas) { ... }

# RUIM
cmn <- function(n) { ... }

# Use snake_case para nomes de variáveis e funções
media_idade <- mean(idades)

# Use espaços ao redor de operadores
x <- 5 + 3  # BOM
x<-5+3      # RUIM

# Indentação consistente (2 ou 4 espaços)
if (condicao) {
  fazer_algo()
  fazer_outra_coisa()
}

# Comentários claros
# Calcular a média ponderada das notas
media_ponderada <- (nota1 * 2 + nota2 * 3 + nota3 * 5) / 10

# ------------------------------------------------------------------------------
# 7.2 Manipulação eficiente
# ------------------------------------------------------------------------------

# Use tidyverse ao invés de loops quando possível
# RUIM
resultado <- c()
for (i in 1:nrow(dados)) {
  if (dados$idade[i] > 30) {
    resultado <- c(resultado, dados$nome[i])
  }
}

# BOM
resultado <- dados %>%
  filter(idade > 30) %>%
  pull(nome)

# Use operações vetorizadas
# RUIM
for (i in 1:length(x)) {
  y[i] <- x[i] * 2
}

# BOM
y <- x * 2

# ------------------------------------------------------------------------------
# 7.3 Trabalho com datas
# ------------------------------------------------------------------------------

library(lubridate)

# Criar datas
data1 <- ymd("2023-12-25")
data2 <- dmy("25/12/2023")
data3 <- mdy("12-25-2023")

# Data e hora
datetime <- ymd_hms("2023-12-25 14:30:00")

# Extrair componentes
year(data1)
month(data1)
day(data1)
wday(data1, label = TRUE)
hour(datetime)

# Operações com datas
data1 + days(7)
data1 + months(3)
data1 + years(1)

# Intervalo entre datas
intervalo <- interval(data1, data2)
time_length(intervalo, "days")

# ------------------------------------------------------------------------------
# 7.4 Strings
# ------------------------------------------------------------------------------

library(stringr)

# Manipulação de strings
str_to_upper("texto")
str_to_lower("TEXTO")
str_to_title("texto exemplo")

# Detectar padrões
str_detect("texto exemplo", "exemplo")
str_count("banana", "a")

# Substituir
str_replace("texto exemplo", "exemplo", "teste")
str_replace_all("banana", "a", "o")

# Extrair
str_extract("Idade: 25 anos", "\\d+")
str_sub("texto", 1, 3)

# Dividir
str_split("um,dois,três", ",")

# Remover espaços
str_trim("  texto  ")

# ------------------------------------------------------------------------------
# 7.5 Tratamento de valores faltantes
# ------------------------------------------------------------------------------

# Identificar NAs
is.na(dados$idade)
sum(is.na(dados$idade))
mean(is.na(dados$idade))  # Proporção de NAs

# Remover NAs
na.omit(dados)
dados %>% drop_na()
dados %>% drop_na(idade, peso)

# Substituir NAs
dados$idade[is.na(dados$idade)] <- mean(dados$idade, na.rm = TRUE)
dados %>% replace_na(list(idade = 0))
dados %>% mutate(idade = coalesce(idade, 0))

# Imputação mais sofisticada
dados %>%
  group_by(categoria) %>%
  mutate(idade = ifelse(is.na(idade), median(idade, na.rm = TRUE), idade)) %>%
  ungroup()

# ------------------------------------------------------------------------------
# 7.6 Depuração e troubleshooting
# ------------------------------------------------------------------------------

# Ver estrutura dos dados
str(dados)
glimpse(dados)

# Verificar tipos
class(dados)
typeof(x)

# Inspecionar objeto
head(dados, 10)
tail(dados, 5)
summary(dados)

# Debug de funções
debugonce(minha_funcao)
browser()  # Dentro de uma função

# Mensagens úteis
print("Debug: chegou aqui")
cat("Valor de x:", x, "\n")

# ------------------------------------------------------------------------------
# 7.7 Performance
# ------------------------------------------------------------------------------

# Medir tempo de execução
system.time({
  # código aqui
})

# microbenchmark para comparações detalhadas
library(microbenchmark)
microbenchmark(
  metodo1 = { ... },
  metodo2 = { ... },
  times = 100
)

# Use data.table para grandes volumes
library(data.table)
dt <- as.data.table(dados)

# Pré-alocar vetores
# RUIM
resultado <- c()
for (i in 1:10000) {
  resultado <- c(resultado, i^2)
}

# BOM
resultado <- numeric(10000)
for (i in 1:10000) {
  resultado[i] <- i^2
}

# ==============================================================================
# FIM DO GUIA
# ==============================================================================

# RECURSOS ADICIONAIS:
# - R for Data Science: https://r4ds.had.co.nz/
# - Tidyverse: https://www.tidyverse.org/
# - RStudio Cheatsheets: https://www.rstudio.com/resources/cheatsheets/
# - ggplot2 book: https://ggplot2-book.org/
# - Advanced R: https://adv-r.hadley.nz/

# COMUNIDADE:
# - Stack Overflow: https://stackoverflow.com/questions/tagged/r
# - RStudio Community: https://community.rstudio.com/
# - R-bloggers: https://www.r-bloggers.com/