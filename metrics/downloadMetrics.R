date_ranges <- rbind(
  # data.frame(from = "2023-06-01 00:00:00 UTC", until = "2023-06-30 23:59:59 UTC")
  # data.frame(from = "2023-07-01 00:00:00 UTC", until = "2023-07-30 23:59:59 UTC"),
  # data.frame(from = "2023-08-01 00:00:00 UTC", until = "2023-08-31 23:59:59 UTC"),
  # data.frame(from = "2023-09-01 00:00:00 UTC", until = "2023-09-30 23:59:59 UTC"),
  # data.frame(from = "2023-10-01 00:00:00 UTC", until = "2023-10-31 23:59:59 UTC"),
  # data.frame(from = "2023-11-01 00:00:00 UTC", until = "2023-11-30 23:59:59 UTC"),
  # data.frame(from = "2023-12-01 00:00:00 UTC", until = "2023-12-31 23:59:59 UTC"),
  data.frame(from = "2024-01-01 00:00:00 UTC", until = "2024-01-31 23:59:59 UTC"),
  data.frame(from = "2024-02-01 00:00:00 UTC", until = "2024-02-29 23:59:59 UTC"),
  data.frame(from = "2024-03-01 00:00:00 UTC", until = "2024-03-31 23:59:59 UTC"),
  data.frame(from = "2024-04-01 00:00:00 UTC", until = "2024-04-30 23:59:59 UTC"),
  data.frame(from = "2024-05-01 00:00:00 UTC", until = "2024-05-31 23:59:59 UTC")
)

for (i in seq_len(nrow(date_ranges))) {
  date_from <- date_ranges[i, "from"]
  date_to <- date_ranges[i, "until"]
  message(sprintf("{%s} - {%s}", date_from, date_to))
  year_month <- gsub(pattern = "([[:digit:]]{4}-[[:digit:]]{2}).+", replacement = "\\1", x = date_from)
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
    file_out <- paste0(year_month, "-connect_count.rds")
    saveRDS(metrics_df, file_out)
  })
}
