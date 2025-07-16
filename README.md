## IFNresource

Repository for the Shiny application [Single-cell analysis of signalling and transcriptional responses to type I interferons](https://rehwinkellab.shinyapps.io/ifnresource/)

### Developer notes

- Place RDS files containing SummarizedExperiment objects under `IFNresource/datasets`.
- Place R scripts containing initial app states under `IFNresource/initial_states`.
- Place PNG files of screenshots of manuscript figures under `IFNresource/www/images`.
- Edit `IFNresource/config.yaml` as needed
  - In the `datasets:` section
    - Add an entry for each RDS object, with fields `id`, `title`, `uri`, and `description`.
    - Add an entry for each initial state, with fields `id`, `datasets`, `uri`, and `description`.
