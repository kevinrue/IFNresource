library(ggplot2)

first_of_this_month <- as.Date(gsub("([[:digit:]]{4}-[[:digit:]]{2})-[[:digit:]]{2}", "\\1-01", as.character(Sys.Date())))
last_of_last_month <- first_of_this_month-1
first_of_last_month <- as.Date(gsub("([[:digit:]]{4}-[[:digit:]]{2})-[[:digit:]]{2}", "\\1-01", as.character(last_of_last_month)))

highlight_last_month <- data.frame(
    from = c(
      as.POSIXct(paste(first_of_last_month, "00:00:00 UTC"))
    ),
    until = c(
      as.POSIXct(paste(last_of_last_month, "00:00:00 UTC"))
    )
  )

plot_connect_counts()
plot_memory_usage()

# function definitions below ----

plot_connect_counts <- function() {
  rds_files <- list.files(path = ".", pattern = "connect_count.rds$")
  rds_data <- lapply(rds_files, readRDS)
  all_data <- do.call("rbind", rds_data)
  all_data <- all_data %>%
    tidyr::separate(time, c("year", "month", "day"), "-", remove = FALSE)
  ggplot() +
    geom_line(aes(time, connect_count), all_data) +
    geom_rect(
      aes(xmin = from, xmax = until), ymin = -Inf, ymax = -Inf,
      highlight_ranges,
      color = "red",
      fill = "red",
      alpha = 0.1
    ) +
    facet_wrap(~year, scales = "free_x", ncol = 1) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 90)
    ) +
    labs(
      y = "Number of connections",
      x = "Date-time"
    )
}

plot_memory_usage <- function() {
  rds_files <- list.files(path = ".", pattern = "total_rss.rds$")
  rds_data <- lapply(rds_files, readRDS)
  all_data <- do.call("rbind", rds_data)
  all_data <- all_data %>%
    # filter(total_rss > 0) %>%
    tidyr::separate(time, c("year", "month", "day"), "-", remove = FALSE)
  ggplot() +
    geom_line(aes(time, total_rss / 1024^3), all_data) +
    geom_rect(
      aes(xmin = from, xmax = until), ymin = -Inf, ymax = -Inf,
      highlight_ranges,
      color = "red",
      fill = "red",
      alpha = 0.1
    ) +
    facet_wrap(~year, scales = "free_x", ncol = 1) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 90)
    ) +
    labs(
      y = "Memory usage (GB)",
      x = "Date-time"
    )
}
plot_memory_usage()
