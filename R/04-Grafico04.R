


hist <- data |>
  dplyr::select(average) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = average,
  ) +
  ggplot2::geom_histogram(
    ggplot2::aes(y = ..density..),
    color = "white",
    fill = "lightgreen",
    alpha = .8
  ) +
  ggplot2::theme_minimal() +
  ggplot2::scale_x_continuous(
    limits = c(0, 10),
    breaks = seq(0, 10, 2)
  ) +
  ggplot2::labs(
    title = "Comportamento do atributo <span style='font-size:32pt; color:lightgreen'>**média**</span>",
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


box <- data |>
  dplyr::select(average) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = average,
  ) +
  ggplot2::geom_boxplot(
    color = "white",
    fill = "lightgreen",
    alpha = .8
  ) +
  ggplot2::theme_minimal() +
  ggplot2::scale_x_continuous(
    limits = c(0, 10),
    breaks = seq(0, 10, 2)
  ) +
  ggplot2::labs(
    caption = "Visualização de Thales Henrique | Dados: Board Games Geek - Kaggle"
  ) +
  ggplot2::theme(
    axis.text.y = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank(),
    panel.background = ggplot2::element_rect(
      fill = "black",
      color = "black"
    ),
    plot.background = ggplot2::element_rect(
      fill = "black",
      color = "black"
    ),
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
  )


library(patchwork)

graph <- hist / box

graph
