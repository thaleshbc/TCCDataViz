

grafico03 <- data |>
  dplyr::select(
    average,
    playingtime
  ) |>
  dplyr::filter(
    playingtime != 0
  ) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = playingtime,
    y = average
  ) +
  ggplot2::geom_smooth(
    colour = "darkgreen",
    size = 1.5
  ) +
  ggplot2::theme_minimal() +
  ggplot2::labs(
    title = "Mais tempo de jogo, maior a diversão?",
    subtitle = "Quanto tempo de jogo é necessário para se ter uma boa <span style='font-size:22pt; color:darkgreen'>**média**</span> de avaliação",
    caption = "Visualização de Thales Henrique | Dados: Board Games Geek - Kaggle",
    x = "Tempo de jogo",
    y = "Média"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 1,
    y = 6.6,
    hjust = 0,
    size = 4,
    color = "white",
    label = "Jogos rápidos não tem \nnotas tão ruins...",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 50,
    y = 7.3,
    hjust = 0,
    size = 4,
    color = "white",
    label = "... já jogos com tempo razoável \nparece empolgar os jogadores...",
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 6000,
    y = 8.3,
    hjust = 0,
    size = 4,
    color = "white",
    label = "... porém jogos muito longos \nparecem se tornar chatos.",
    fontface = "bold"
  ) +
  ggplot2::scale_x_log10(
    breaks = c(0, 6, 60, 600, 6000, 60000),
    labels = c("0", "6", "60", "600", "6.000", "60.000")
  ) +
  ggplot2::scale_y_continuous(
    limits = c(5, 9),
    breaks = seq(5, 9, 2),
    labels = c("5", "7", "9")
  ) +
  ggplot2::theme(
    panel.background = ggplot2::element_rect(
      fill = "black",
      color = "black"
    ),
    panel.grid = ggplot2::element_blank(),
    plot.background = ggplot2::element_rect(
      fill = "black",
      color = "black"
    ),
    plot.margin = ggplot2::margin(10, 20, 10, 20),
    axis.text.x = ggplot2::element_text(
      color = "white",
      size = 12,
      margin = ggplot2::margin(10)
    ),
    axis.text.y = ggplot2::element_text(
      color = "white",
      size = 12,
      margin = ggplot2::margin(10)
    ),
    axis.title.x = ggplot2::element_text(
      color = "white",
      face = "bold",
      size = 12,
      margin = ggplot2::margin(10)
    ),
    axis.title.y = ggplot2::element_text(
      color = "white",
      face = "bold",
      size = 12,
      margin = ggplot2::margin(t = 10, r = 10)
    ),
    plot.title = ggtext::element_textbox(
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
  )

ggplot2::ggsave("img/Grafico03.png", grafico03, width = 40, height = 25, units = "cm", dpi = 300)
