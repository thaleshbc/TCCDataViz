
data |>
  dplyr::select(
    users_rated,
    average
  ) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = users_rated,
    y = average
  ) +
  ggplot2::geom_point(
    color = "white",
    alpha = .1
  ) +
  ggplot2::geom_smooth(
    colour = "purple",
    size = 2,
    se = FALSE
  ) +
  ggplot2::theme_minimal() +
  ggplot2::labs(
    title = "Comportamento da <span style='font-size:32pt; color:purple'>**média**</span> relacionada a quantidade de reviews",
    subtitle = "Observa-se uma tendência de crescimento da <span style='font-size:22pt; color:purple'>**média**</span> com o aumento da quantidade de reviews realizadas",
    caption = "Visualização de Thales Henrique | Dados: Board Games Geek - Kaggle",
    x = "Reviews",
    y = "Média"
  ) +
  ggplot2::scale_x_log10(
    breaks = c(0, 100, 1000, 10000, 100000),
    labels = c("0", "100", "1.000", "10.000", "100.000")
  ) +
  ggplot2::scale_y_continuous(
    limits = c(0, 10),
    breaks = seq(0, 7.5, 2.5),
    labels = c("0", "2.5", "5.0", "7.5")
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
    plot.margin = ggplot2::margin(10, 10, 10, 10),
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


