library(ggplot2)

rds_files <- list.files(path = ".", pattern = ".rds$")
rds_data <- lapply(rds_files, readRDS)
all_data <- do.call("rbind", rds_data)

highlight_ranges <-

ggplot() +
  geom_line(aes(time, connect_count), metrics_df) +
  geom_rect(
    aes(xmin = from, xmax = until), ymin = -Inf, ymax = Inf,
    highlight,
    color = "red",
    fill = "red",
    alpha = 0.1
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90)
  ) +
  labs(
    y = "Number of connections",
    x = "Date-time"
  )


