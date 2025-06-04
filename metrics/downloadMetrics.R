date_ranges <- rbind(
  # data.frame(from = "2023-06-01 00:00:00 UTC", until = "2023-06-30 23:59:59 UTC")
  # data.frame(from = "2023-07-01 00:00:00 UTC", until = "2023-07-30 23:59:59 UTC"),
  # data.frame(from = "2023-08-01 00:00:00 UTC", until = "2023-08-31 23:59:59 UTC"),
  # data.frame(from = "2023-09-01 00:00:00 UTC", until = "2023-09-30 23:59:59 UTC"),
  # data.frame(from = "2023-10-01 00:00:00 UTC", until = "2023-10-31 23:59:59 UTC"),
  # data.frame(from = "2023-11-01 00:00:00 UTC", until = "2023-11-30 23:59:59 UTC"),
  # data.frame(from = "2023-12-01 00:00:00 UTC", until = "2023-12-31 23:59:59 UTC"),
  # data.frame(from = "2024-01-01 00:00:00 UTC", until = "2024-01-31 23:59:59 UTC"),
  # data.frame(from = "2024-02-01 00:00:00 UTC", until = "2024-02-29 23:59:59 UTC"),
  # data.frame(from = "2024-03-01 00:00:00 UTC", until = "2024-03-31 23:59:59 UTC"),
  # data.frame(from = "2024-04-01 00:00:00 UTC", until = "2024-04-30 23:59:59 UTC"),
  # data.frame(from = "2024-05-01 00:00:00 UTC", until = "2024-05-31 23:59:59 UTC")
  # data.frame(from = "2025-05-01 00:00:00 UTC", until = "2025-05-31 23:59:59 UTC")
)

start_date <- as.Date("2025-01-01")

while (start_date < Sys.Date()) {
  next_start_date <- as.Date(gsub("([[:digit:]]{4}-[[:digit:]]{2})-[[:digit:]]{2}", "\\1-01", as.character(start_date + 31)))
  if (next_start_date > Sys.Date()) {
    break
  }
  end_date <- next_start_date - 1
  date_from <- paste(start_date, "00:00:00 UTC")
  date_to <- paste(end_date, "00:00:00 UTC")
  message(sprintf("{%s} - {%s}", date_from, date_to))
  year_month <- gsub(pattern = "([[:digit:]]{4}-[[:digit:]]{2}).+", replacement = "\\1", x = date_from)
  # connection counts
  file_out <- paste0(year_month, "-connect_count.rds")
  if (!file.exists(file_out)) {
    try({
      metrics_df <- rsconnect::showMetrics(
        metricSeries = "container_status",
        metricNames = c("connect_count"),
        appName = "ifnresource",
        account = "rehwinkellab",
        server="shinyapps.io",
        from = as.numeric(as.POSIXct(date_from)),
        until = as.numeric(as.POSIXct(date_to)),
        interval = "60s"
      )
      saveRDS(metrics_df, file_out)
    })
  }
  # memory usage
  file_out <- paste0(year_month, "-total_rss")
  if (!file.exists(file_out)) {
    try({
      metrics_df <- rsconnect::showMetrics(
        metricSeries = "docker_container_mem",
        metricNames = c("total_rss"),
        appName = "ifnresource",
        account = "rehwinkellab",
        server="shinyapps.io",
        from = as.numeric(as.POSIXct(date_from)),
        until = as.numeric(as.POSIXct(date_to)),
        interval = "60s"
      )
      saveRDS(metrics_df, file_out)
    })
  }
  start_date <- next_start_date
}
