# ==============================================================================
# Curso: Formação Breve em Ciência de Dados e Informações para o SUS
# Script: Visualização de Dados
# ==============================================================================
# ==============================================================================
# GUIA DE BOAS PRÁTICAS EM VISUALIZAÇÃO DE DADOS
# ==============================================================================

# ------------------------------------------------------------------------------
# PRINCÍPIOS FUNDAMENTAIS DE VISUALIZAÇÃO
# ------------------------------------------------------------------------------

# 1. CLAREZA E SIMPLICIDADE
#    - Menos é mais: evite poluição visual
#    - Uma mensagem por gráfico
#    - Títulos e rótulos devem ser autoexplicativos
#    - Use cores com propósito, não apenas por estética

# 2. ACESSIBILIDADE
#    - Use paletas de cores amigáveis para daltônicos
#    - Evite depender apenas de cor para transmitir informação
#    - Tamanhos de fonte legíveis (mínimo 10-12pt)
#    - Alto contraste entre texto e fundo

# 3. HONESTIDADE
#    - Não distorça escalas para exagerar diferenças
#    - Sempre comece eixo Y em zero para gráficos de barras
#    - Mostre a incerteza quando relevante (intervalos de confiança)
#    - Cite as fontes dos dados

# 4. ESCOLHA DO TIPO DE GRÁFICO ADEQUADO
#    - Barras: comparar categorias
#    - Linhas: mostrar tendências temporais
#    - Dispersão: relação entre duas variáveis contínuas
#    - Boxplot: distribuição e outliers
#    - Mapas de calor: padrões em matrizes de dados

# 5. CONTEXTO E INTERPRETAÇÃO
#    - Adicione linhas de referência quando útil
#    - Destaque pontos importantes
#    - Forneça contexto numérico quando necessário
#    - Considere o público-alvo

# Carregar pacotes necessários
library(tidyverse)
library(lubridate)
library(plotly)      # Gráficos interativos
library(scales)      # Formatação de escalas e eixos


# Assumindo que você já importou o dataframe df_csv conforme a aula
setwd("/Users/pilarveras/Desktop/Curso Abrascão/repositório/dados")


df_csv <- read_csv("sim_salvador_2023_visualizacao.csv")


# ------------------------------------------------------------------------------
# PALETAS DE CORES RECOMENDADAS
# ------------------------------------------------------------------------------

# Paletas amigáveis para daltônicos:
cores_categoricas <- c("#0173B2", "#DE8F05", "#029E73", "#CC78BC", "#CA9161")
cores_sequenciais <- c("#F0F9E8", "#BAE4BC", "#7BCCC4", "#43A2CA", "#0868AC")
cores_divergentes <- c("#D73027", "#FC8D59", "#FEE090", "#E0F3F8", "#91BFDB", "#4575B4")

# Paleta do ColorBrewer (segura para daltônicos)
# Instale se necessário: install.packages("RColorBrewer")
# library(RColorBrewer)
# display.brewer.all(colorblindFriendly = TRUE)


# ==============================================================================
# VISUALIZAÇÕES COM ggplot2 (ESTÁTICO)
# ==============================================================================


# ------------------------------------------------------------------------------
# GRÁFICO 1: Óbitos por mês (Barras - MELHORADO)
# ------------------------------------------------------------------------------

p1 <- df_csv %>%
  mutate(mes = month(DTOBITO_dt, label = TRUE, abbr = FALSE, locale = "pt_BR" )) %>%
  count(mes) %>%
  ggplot(aes(x = mes, y = n)) +
  geom_col(fill = "#0173B2", alpha = 0.8) +
  geom_text(aes(label = scales::comma(n)), vjust = -0.5, size = 3.5) +
  labs(
    title = "Distribuição de Óbitos por Mês",
    subtitle = "Salvador, 2023",
    x = NULL,  # Remove rótulo do eixo X (é autoexplicativo)
    y = "Número de Óbitos",
    caption = "Fonte: SIM - Sistema de Informações de Mortalidade"
  ) +
  scale_y_continuous(labels = scales::comma, expand = expansion(mult = c(0, 0.1))) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray40"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank()
  )

print(p1)


# ------------------------------------------------------------------------------
# GRÁFICO 2: Distribuição de idade por sexo (Histograma - MELHORADO)
# ------------------------------------------------------------------------------

p2 <- df_csv %>%
  filter(sexo_p %in% c("Masculino", "Feminino")) %>%
  ggplot(aes(x = idade_anos, fill = sexo_p)) +
  geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
  scale_fill_manual(values = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2")) +
  labs(
    title = "Distribuição Etária dos Óbitos por Sexo",
    subtitle = "Salvador, 2023",
    x = "Idade (anos)",
    y = "Frequência",
    fill = "Sexo",
    caption = "Fonte: SIM - Sistema de Informações de Mortalidade"
  ) +
  scale_x_continuous(breaks = seq(0, 120, 20)) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray40"),
    legend.position = "top",
    panel.grid.minor = element_blank()
  )

print(p2)


# ------------------------------------------------------------------------------
# GRÁFICO 3: Óbitos por faixa etária e sexo (Barras agrupadas - MELHORADO)
# ------------------------------------------------------------------------------

p3 <- df_csv %>%
  filter(sexo_p %in% c("Masculino", "Feminino")) %>%
  count(faixa_etaria, sexo_p) %>%
  ggplot(aes(x = faixa_etaria, y = n, fill = sexo_p)) +
  geom_col(position = "dodge", alpha = 0.8) +
  geom_text(
    aes(label = scales::comma(n)),
    position = position_dodge(width = 0.9),
    vjust = -0.5,
    size = 3.5
  ) +
  scale_fill_manual(values = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2")) +
  labs(
    title = "Óbitos por Faixa Etária e Sexo",
    subtitle = "Salvador, 2023",
    x = "Faixa Etária",
    y = "Número de Óbitos",
    fill = "Sexo",
    caption = "Fonte: SIM - Sistema de Informações de Mortalidade"
  ) +
  scale_y_continuous(labels = scales::comma, expand = expansion(mult = c(0, 0.1))) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray40"),
    legend.position = "top",
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank()
  )

print(p3)


# ------------------------------------------------------------------------------
# GRÁFICO 4: Pirâmide etária por sexo (AVANÇADO)
# ------------------------------------------------------------------------------

p4 <- df_csv %>%
  filter(sexo_p %in% c("Masculino", "Feminino")) %>%
  mutate(
    faixa_5anos = cut(
      idade_anos,
      breaks = seq(0, 120, by = 5),
      include.lowest = TRUE,
      right = FALSE,
      labels = paste0(seq(0, 115, by = 5), "-", seq(4, 119, by = 5))
    )
  ) %>%
  count(faixa_5anos, sexo_p) %>%
  mutate(
    n = ifelse(sexo_p == "Masculino", -n, n)  # Masculino negativo para pirâmide
  ) %>%
  ggplot(aes(x = faixa_5anos, y = n, fill = sexo_p)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2")) +
  scale_y_continuous(
    labels = function(x) scales::comma(abs(x)),
    breaks = seq(-1000, 1000, 250)
  ) +
  labs(
    title = "Pirâmide Etária dos Óbitos",
    subtitle = "Salvador, 2023",
    x = "Faixa Etária (anos)",
    y = "Número de Óbitos",
    fill = "Sexo",
    caption = "Fonte: SIM - Sistema de Informações de Mortalidade"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray40"),
    legend.position = "top",
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank()
  )

print(p4)


# ==============================================================================
# VISUALIZAÇÕES COM plotly (INTERATIVO)
# ==============================================================================
# O plotly permite criar gráficos interativos com:
# - Zoom e pan
# - Tooltips informativos ao passar o mouse
# - Exportação de imagens
# - Filtros dinâmicos

# ------------------------------------------------------------------------------
# PLOTLY 1: Óbitos por mês (Interativo)
# ------------------------------------------------------------------------------

# Preparar dados
dados_mes <- df_csv %>%
  mutate(mes = month(DTOBITO_dt, label = TRUE, abbr = FALSE, locale = "pt_BR")) %>%
  count(mes)

# Criar gráfico plotly
plot1 <- plot_ly(
  data = dados_mes,
  x = ~mes,
  y = ~n,
  type = "bar",
  marker = list(color = "#0173B2"),
  text = ~paste0("Mês: ", mes, "<br>Óbitos: ", scales::comma(n)),
  hovertemplate = "%{text}<extra></extra>"
) %>%
  layout(
    title = list(
      text = "Distribuição de Óbitos por Mês<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    xaxis = list(title = ""),
    yaxis = list(title = "Número de Óbitos"),
    hovermode = "x unified",
    showlegend = FALSE,
    margin = list(t = 80)
  )

plot1


# ------------------------------------------------------------------------------
# PLOTLY 2: Óbitos por faixa etária e sexo (Barras agrupadas interativas)
# ------------------------------------------------------------------------------

# Preparar dados
dados_faixa_sexo <- df_csv %>%
  filter(sexo_p %in% c("Masculino", "Feminino")) %>%
  count(faixa_etaria, sexo_p)

# Criar gráfico plotly
plot2 <- plot_ly(
  data = dados_faixa_sexo,
  x = ~faixa_etaria,
  y = ~n,
  color = ~sexo_p,
  colors = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2"),
  type = "bar",
  text = ~paste0(sexo_p, "<br>", faixa_etaria, "<br>Óbitos: ", scales::comma(n)),
  hovertemplate = "%{text}<extra></extra>"
) %>%
  layout(
    title = list(
      text = "Óbitos por Faixa Etária e Sexo<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    xaxis = list(title = "Faixa Etária"),
    yaxis = list(title = "Número de Óbitos"),
    barmode = "group",
    hovermode = "x unified",
    legend = list(title = list(text = "Sexo")),
    margin = list(t = 80)
  )

plot2


# ------------------------------------------------------------------------------
# PLOTLY 3: Distribuição etária (Histograma interativo)
# ------------------------------------------------------------------------------

# Preparar dados
dados_idade_sexo <- df_csv %>%
  filter(sexo_p %in% c("Masculino", "Feminino"))

# Criar gráfico plotly
plot3 <- plot_ly(alpha = 0.6) %>%
  add_histogram(
    data = dados_idade_sexo %>% filter(sexo_p == "Masculino"),
    x = ~idade_anos,
    name = "Masculino",
    marker = list(color = "#0173B2"),
    nbinsx = 30
  ) %>%
  add_histogram(
    data = dados_idade_sexo %>% filter(sexo_p == "Feminino"),
    x = ~idade_anos,
    name = "Feminino",
    marker = list(color = "#DE8F05"),
    nbinsx = 30
  ) %>%
  layout(
    title = list(
      text = "Distribuição Etária dos Óbitos por Sexo<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    xaxis = list(title = "Idade (anos)"),
    yaxis = list(title = "Frequência"),
    barmode = "overlay",
    hovermode = "x unified",
    legend = list(title = list(text = "Sexo")),
    margin = list(t = 80)
  )

plot3


# ------------------------------------------------------------------------------
# PLOTLY 4: Série temporal de óbitos (Linha interativa)
# ------------------------------------------------------------------------------

# Preparar dados
dados_serie <- df_csv %>%
  filter(!is.na(DTOBITO_dt)) %>%
  mutate(mes_ano = floor_date(DTOBITO_dt, "month")) %>%
  count(mes_ano, sexo_p) %>%
  filter(sexo_p %in% c("Masculino", "Feminino"))

# Criar gráfico plotly
plot4 <- plot_ly(
  data = dados_serie,
  x = ~mes_ano,
  y = ~n,
  color = ~sexo_p,
  colors = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2"),
  type = "scatter",
  mode = "lines+markers",
  text = ~paste0(sexo_p, "<br>", format(mes_ano, "%b/%Y"), "<br>Óbitos: ", n),
  hovertemplate = "%{text}<extra></extra>"
) %>%
  layout(
    title = list(
      text = "Evolução Temporal dos Óbitos por Sexo<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    xaxis = list(title = "Mês"),
    yaxis = list(title = "Número de Óbitos"),
    hovermode = "x unified",
    legend = list(title = list(text = "Sexo")),
    margin = list(t = 80)
  )

plot4


# ------------------------------------------------------------------------------
# PLOTLY 5: Box plot por faixa etária (Distribuição interativa)
# ------------------------------------------------------------------------------

# Preparar dados

dados_boxplot <- df_csv %>%
  filter(!is.na(faixa_etaria), sexo_p %in% c("Masculino", "Feminino"))

# Criar gráfico plotly
plot5 <- plot_ly(
  data = dados_boxplot,
  x = ~faixa_etaria,
  y = ~idade_anos,
  color = ~sexo_p,
  colors = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2"),
  type = "box"
) %>%
  layout(
    title = list(
      text = "Distribuição de Idade por Faixa Etária e Sexo<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    xaxis = list(title = "Faixa Etária"),
    yaxis = list(title = "Idade (anos)"),
    boxmode = "group",
    legend = list(title = list(text = "Sexo")),
    margin = list(t = 80)
  )

plot5


# ------------------------------------------------------------------------------
# PLOTLY 6: Gráfico de pizza interativo (Proporção por sexo)
# ------------------------------------------------------------------------------

# Preparar dados
dados_pizza <- df_csv %>%
  filter(sexo_p %in% c("Masculino", "Feminino")) %>%
  count(sexo_p) %>%
  mutate(percentual = round((n / sum(n)) * 100, 1))

# Criar gráfico plotly
plot6 <- plot_ly(
  data = dados_pizza,
  labels = ~sexo_p,
  values = ~n,
  type = "pie",
  marker = list(colors = c("Feminino" = "#DE8F05", "Masculino" = "#0173B2")),
  text = ~paste0(sexo_p, "<br>", scales::comma(n), " óbitos<br>", percentual, "%"),
  textposition = "inside",
  textinfo = "label+percent",
  hovertemplate = "%{text}<extra></extra>"
) %>%
  layout(
    title = list(
      text = "Distribuição de Óbitos por Sexo<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    showlegend = TRUE,
    margin = list(t = 80)
  )

plot6


# ------------------------------------------------------------------------------
# PLOTLY 7: Heatmap - Óbitos por mês e faixa etária
# ------------------------------------------------------------------------------

# Preparar dados
dados_heatmap <- df_csv %>%
  filter(!is.na(faixa_etaria)) %>%
  mutate(mes = month(DTOBITO_dt, label = TRUE, abbr = FALSE)) %>%
  count(mes, faixa_etaria) %>%
  pivot_wider(names_from = mes, values_from = n, values_fill = 0)

# Converter para matriz
matriz_heatmap <- as.matrix(dados_heatmap[, -1])
rownames(matriz_heatmap) <- dados_heatmap$faixa_etaria

# Criar gráfico plotly
plot7 <- plot_ly(
  x = colnames(matriz_heatmap),
  y = rownames(matriz_heatmap),
  z = matriz_heatmap,
  type = "heatmap",
  colorscale = "Blues",
  text = matriz_heatmap,
  hovertemplate = "Mês: %{x}<br>Faixa: %{y}<br>Óbitos: %{z}<extra></extra>"
) %>%
  layout(
    title = list(
      text = "Mapa de Calor: Óbitos por Mês e Faixa Etária<br><sub>Salvador, 2023</sub>",
      font = list(size = 16)
    ),
    xaxis = list(title = "Mês"),
    yaxis = list(title = "Faixa Etária"),
    margin = list(t = 80)
  )

plot7


# ==============================================================================
# COMPARAÇÃO: ggplot2 vs plotly
# ==============================================================================

# Converter ggplot para plotly (fácil!)
# Qualquer gráfico ggplot pode ser tornado interativo com ggplotly()

# Exemplo: tornar o gráfico p3 interativo
p3_interativo <- ggplotly(p3)
p3_interativo


# ==============================================================================
# EXPORTAR VISUALIZAÇÕES
# ==============================================================================

# Salvar gráfico ggplot2
ggsave("obitos_por_mes.png", plot = p1, width = 10, height = 6, dpi = 300)
ggsave("obitos_por_mes.pdf", plot = p1, width = 10, height = 6)

# Salvar gráfico plotly como HTML (interativo)
htmlwidgets::saveWidget(plot1, "obitos_por_mes_interativo.html")

# Salvar gráfico plotly como imagem estática (requer o pacote kaleido)
# install.packages("reticulate")
# reticulate::py_install("kaleido")
# plotly::save_image(plot1, "obitos_por_mes_plotly.png", width = 1000, height = 600)


# ==============================================================================
# DICAS FINAIS DE VISUALIZAÇÃO
# ==============================================================================

# 1. ESCOLHA O FORMATO CERTO:
#    - PNG: para apresentações e web (boa qualidade, arquivo menor)
#    - PDF/SVG: para publicações acadêmicas (vetorial, escalável)
#    - HTML: para dashboards interativos

# 2. RESOLUÇÃO (DPI):
#    - Apresentações: 150 dpi
#    - Web: 72-96 dpi
#    - Impressão: 300 dpi ou mais

# 3. TAMANHOS RECOMENDADOS:
#    - Slides: 10x6 polegadas
#    - Artigos: 7x5 polegadas (gráfico simples), 10x6 (complexo)
#    - Posters: 12x8 polegadas ou maior

# 4. TESTES DE QUALIDADE:
#    - Imprima em preto e branco para verificar contraste
#    - Teste em diferentes tamanhos
#    - Peça feedback de colegas
#    - Verifique acessibilidade (cores, fontes)

# 5. RECURSOS ADICIONAIS:
#    - Livro: "Fundamentals of Data Visualization" (Claus Wilke)
#    - Site: https://www.data-to-viz.com/
#    - Galeria ggplot2: https://r-graph-gallery.com/
#    - Galeria plotly: https://plotly.com/r/
