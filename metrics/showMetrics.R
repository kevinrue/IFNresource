library(ggplot2)

## Example (https://docs.posit.co/shinyapps.io/guide/metrics/index.html)
# metrics_df <- rsconnect::showMetrics(
#   metricSeries = "docker_container_cpu",
#   metricNames = c("usage_in_usermode"),
#   appName = "ifnresource",
#   account = "rehwinkellab",
#   server="shinyapps.io"
# )
# metrics_df <- rsconnect::showMetrics(
#   metricSeries = "container_status",
#   metricNames = c("connect_count"),
#   appName = "ifnresource",
#   account = "rehwinkellab",
#   server="shinyapps.io",
#   from = "360d",
#   until = "1d",
#   interval = "1d"
# )
# metrics_df <- rsconnect::showMetrics(
#   metricSeries = "container_status",
#   metricNames = c("connect_count"),
#   appName = "ifnresource",
#   account = "rehwinkellab",
#   server="shinyapps.io",
#   from = "30d",
#   until = "1d",
#   interval = "60s"
# )
# metrics_df <- rsconnect::showMetrics(
#   metricSeries = "container_status",
#   metricNames = c("connect_count"),
#   appName = "ifnresource",
#   account = "rehwinkellab",
#   server="shinyapps.io",
#   from = as.numeric(as.POSIXct("2024-05-01 00:00:00 UTC")),
#   until = as.numeric(as.POSIXct("2024-05-31 23:59:59 UTC")),
#   interval = "60s"
# )

# head(metrics_df); tail(metrics_df)
# sort(unique(metrics_df$connect_count))
# subset(metrics_df, connect_count > 0 & connect_count < 1)

# highlight <- data.frame(
#   from = c(
#     as.POSIXct("2024-05-06 00:00:00 UTC"),
#     as.POSIXct("2024-05-20 00:00:00 UTC")
#   ),
#   until = c(
#     as.POSIXct("2024-05-06 23:59:59 UTC"),
#     as.POSIXct("2024-05-20 23:59:59 UTC")
#   )
# )

# ggplot() +
#   geom_line(aes(time, connect_count), metrics_df) +
#   geom_rect(
#     aes(xmin = from, xmax = until), ymin = -Inf, ymax = Inf,
#     highlight,
#     color = "red",
#     fill = "red",
#     alpha = 0.1
#   ) +
#   theme_minimal() +
#   theme(
#     axis.text.x = element_text(angle = 90)
#   ) +
#   labs(
#     y = "Number of connections",
#     x = "Date-time"
#   )


