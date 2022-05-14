ratings <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-25/ratings.csv")


details <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-25/details.csv")


ratings |>
  dplyr::glimpse()


details |>
  dplyr::glimpse()


data <- dplyr::inner_join(ratings, details, by = "id")


data |>
  dplyr::glimpse()


rm(list = c("details", "ratings"))


data <- data |>
  dplyr::mutate(
    category = stringr::str_replace_all(boardgamecategory, pattern = "\\[|\\]", replacement = ""),
    mechanic = stringr::str_replace_all(boardgamemechanic, pattern = "\\[|\\]", replacement = ""),
    designer = stringr::str_replace_all(boardgamedesigner, pattern = "\\[|\\]", replacement = ""),
    artist = stringr::str_replace_all(boardgameartist, pattern = "\\[|\\]", replacement = ""),
  ) |>
  tidyr::separate(
    category,
    into = "category",
    sep = ","
  ) |>
  tidyr::separate(
    mechanic,
    into = "mechanic",
    sep = ","
  ) |>
  tidyr::separate(
    designer,
    into = "designer",
    sep = ","
  ) |>
  tidyr::separate(
    artist,
    into = "artist",
    sep = ","
  ) |>
  dplyr::mutate(
    category = stringr::str_replace_all(category, pattern = "\\'", replacement = ""),
    mechanic = stringr::str_replace_all(mechanic, pattern = "\\'", replacement = ""),
    designer = stringr::str_replace_all(designer, pattern = "\\'", replacement = ""),
    artist = stringr::str_replace_all(artist, pattern = "\\'", replacement = ""),
  )




data |>
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
  ggplot2::geom_line()



data |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = users_rated,
    y = average
  ) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth(colour = "red", se = FALSE) +
  ggplot2::scale_x_log10()



data |>
  dplyr::select(
    average,
    playingtime
  ) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = playingtime,
    y = average
  ) +
  #ggplot2::geom_point() +
  ggplot2::geom_smooth(colour = "red") +
  ggplot2::scale_x_log10()


data |>
  dplyr::select(
    average,
    minage
  ) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = minage,
    y = average
  ) +
  #ggplot2::geom_point() +
  ggplot2::geom_smooth(colour = "red") #+
  #ggplot2::scale_x_log10()





data |>
  dplyr::select(name, yearpublished, playingtime) |>
  dplyr::arrange(playingtime) |>
  dplyr::filter(playingtime > 500) |>
  View()



data |>
  dplyr::count(boardgamecategory) |>
  dplyr::arrange(desc(n)) |>
  na.omit() |>
  head(10) |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = forcats::fct_reorder(boardgamecategory, n),
    y = n
  ) +
  ggplot2::geom_col() +
  ggplot2::coord_flip()



data |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = forcats::as_factor(minplayers),
    y = average
  ) +
  ggplot2::geom_boxplot()



data |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = forcats::as_factor(maxplayers),
    y = average
  ) +
  ggplot2::geom_boxplot()



data |>
  ggplot2::ggplot() +
  ggplot2::aes(
    x = minplayers,
    y = maxplayers
  ) +
  ggplot2::geom_point()



a <- data |>
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
  )


b <- data |>
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
  )


library(patchwork)

a / b

packHV::hist_boxplot(data$average, freq = TRUE)



