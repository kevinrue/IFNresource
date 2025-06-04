library(ggplot2)

rds_files <- list.files(path = ".", pattern = ".rds$")
rds_data <- lapply(rds_files, readRDS)
all_data <- do.call("rbind", rds_data)

highlight_ranges <- data.frame(
    from = c(
      as.POSIXct("2024-05-06 00:00:00 UTC"),
      as.POSIXct("2024-05-20 00:00:00 UTC")
    ),
    until = c(
      as.POSIXct("2024-05-06 23:59:59 UTC"),
      as.POSIXct("2024-05-20 23:59:59 UTC")
    )
  )

all_data %>% head()
all_data <- all_data %>%
  tidyr::separate(time, c("year", "month", "day"), "-", remove = FALSE)

ggplot() +
  geom_line(aes(time, connect_count), all_data) +
  # geom_rect(
  #   aes(xmin = from, xmax = until), ymin = -Inf, ymax = -Inf,
  #   highlight_ranges,
  #   color = "red",
  #   fill = "red",
  #   alpha = 0.1
  # ) +
  facet_wrap(~year, scales = "free_x", ncol = 1) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90)
  ) +
  labs(
    y = "Number of connections",
    x = "Date-time"
  )


