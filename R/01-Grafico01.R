

grafico01 <- data |>
  dplyr::select(
    yearpublished
  ) |>
  dplyr::count(
    yearpublished
  ) |>
  dplyr::arrange(
    desc(yearpublished)
  ) |>
  dplyr::filter(
    yearpublished >= 1900
  ) |>
  na.omit() |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = yearpublished,
    y = n
  ) +
  ggplot2::geom_area(
    fill = "yellow",
    color = "white",
    alpha = .5
  ) +
  ggplot2::labs(
    title = "O crescimento dos jogos de tabuleiro",
    subtitle = "Mais de <span style='font-size:22pt; color:yellow'>**20.000**</span> jogos diferentes ao fim de 2021",
    caption = "Visualização de Thales Henrique | Dados: Board Games Geek - Kaggle"
  ) +
  ggplot2::annotate(
    geom = "segment",
    x = 1933,
    xend = 1933,
    y = 0,
    yend = 250,
    size = .5,
    color = "white"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 1933,
    y = 270,
    hjust = 0,
    size = 5,
    color = "white",
    label = "Monopoly",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "segment",
    x = 1948,
    xend = 1948,
    y = 0,
    yend = 250,
    size = .5,
    color = "white"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 1948,
    y = 270,
    hjust = 0,
    size = 5,
    color = "white",
    label = "Scrabble",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "segment",
    x = 1971,
    xend = 1971,
    y = 0,
    yend = 170,
    size = .5,
    color = "white"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 1971,
    y = 190,
    hjust = 1,
    size = 5,
    color = "white",
    label = "Uno",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "segment",
    x = 1972,
    xend = 1972,
    y = 0,
    yend = 250,
    size = .5,
    color = "white"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 1972,
    y = 270,
    hjust = 1,
    size = 5,
    color = "white",
    label = "War",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "segment",
    x = 1983,
    xend = 1983,
    y = 0,
    yend = 250,
    size = .5,
    color = "white"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 1983,
    y = 270,
    hjust = 1,
    size = 5,
    color = "white",
    label = "Jenga",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "segment",
    x = 2008,
    xend = 2008,
    y = 0,
    yend = 800,
    size = .5,
    color = "white"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 2008,
    y = 820,
    hjust = 1,
    size = 5,
    color = "white",
    label = "Pandemic",
    fontface = "bold"
  ) +
  ggplot2::theme(
    panel.grid = ggplot2::element_blank(),
    panel.background = ggplot2::element_rect(
      fill = "black",
      color = "black"
    ),
    plot.background = ggplot2::element_rect(
      fill = "black",
      color = "black"
    ),
    plot.margin = ggplot2::margin(10, 10, 10, 10),
    axis.text.y = ggplot2::element_blank(),
    axis.ticks.y = ggplot2::element_blank(),
    axis.text.x = ggplot2::element_text(
      color = "white",
      size = 12,
      margin = ggplot2::margin(10)
    ),
    axis.ticks.x = ggplot2::element_blank(),
    plot.title = ggplot2::element_text(
      color = "white",
      face = "bold",
      size = 32,
      margin = ggplot2::margin(40)
    ),
    plot.subtitle = ggtext::element_textbox(
      color = "white",
      size = 22,
      margin = ggplot2::margin(10)
    ),
    plot.caption = ggplot2::element_text(
      color = "white",
      size = 8,
      hjust = .5,
      margin = ggplot2::margin(t = 40, b = 10)
    )
  ) +
  ggplot2::scale_x_continuous(
    limits = c(1900, 2022),
    breaks = seq(1900, 2022, 20)
  )


ggplot2::ggsave("img/Grafico01.png", grafico01, width = 40, height = 25, units = "cm", dpi = 300)
