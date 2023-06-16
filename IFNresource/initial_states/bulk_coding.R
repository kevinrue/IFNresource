# library ----

library(iSEE)
library(iSEEde)

# initial ----

# set up layout and defaults
initial <- list(
  FeatureAssayPlot(
    Assay = "counts",
    XAxis = "Column data",
    XAxisColumnData = "treatment",
    YAxisFeatureName = "IFI44L",
    YAxisFeatureSource = "---",
    YAxisFeatureDynamicSource = FALSE,
    FacetRowByColData = "WTCHG_Sample",
    FacetColumnByColData = "WTCHG_Sample",
    ColorByColumnData = "donor",
    ColorByFeatureNameAssay = "counts",
    ColorBySampleNameColor = "#FF0000",
    ShapeByColumnData = "WTCHG_Sample",
    SizeByColumnData = NA_character_,
    TooltipColumnData = character(0),
    FacetRowBy = "None",
    FacetColumnBy = "None",
    ColorBy = "Column data",
    ColorByDefaultColor = "#000000",
    ColorByFeatureName = "ENSG00000000003",
    ColorByFeatureSource = "---",
    ColorByFeatureDynamicSource = FALSE,
    ColorBySampleName = "A_unstim",
    ColorBySampleSource = "---",
    ColorBySampleDynamicSource = FALSE,
    ShapeBy = "None",
    SizeBy = "None",
    SelectionAlpha = 0.1,
    VisualBoxOpen = FALSE,
    VisualChoices = c("Color", "Shape", "Size", "Text"),
    ContourAdd = FALSE,
    ContourColor = "#0000FF",
    PointSize = 3,
    PointAlpha = 1,
    Downsample = FALSE,
    DownsampleResolution = 200,
    CustomLabels = FALSE,
    CustomLabelsText = "A_unstim",
    FontSize = 1,
    LegendPointSize = 3,
    LegendPosition = "Right",
    HoverInfo = TRUE,
    LabelCenters = FALSE,
    LabelCentersBy = "WTCHG_Sample",
    LabelCentersColor = "#000000",
    PanelHeight = 500L,
    PanelWidth = 5L
  ),
  ComplexHeatmapPlot(
    Assay = "counts",
    CustomRows = TRUE,
    CustomRowsText = "MX1\nIFI44L",
    ClusterRows = FALSE,
    ClusterRowsDistance = "spearman",
    ClusterRowsMethod = "ward.D2",
    DataBoxOpen = FALSE,
    VisualChoices = "Annotations",
    ColumnData = c("treatment",
      "donor"),
    RowData = character(0),
    CustomBounds = FALSE,
    LowerBound = NA_real_,
    UpperBound = NA_real_,
    AssayCenterRows = FALSE,
    AssayScaleRows = FALSE,
    DivergentColormap = "purple < black < yellow",
    ShowDimNames = c("Rows",
      "Columns"),
    LegendPosition = "Bottom",
    LegendDirection = "Horizontal",
    VisualBoxOpen = FALSE,
    NamesRowFontSize = 14,
    NamesColumnFontSize = 14,
    PanelHeight = 500L,
    PanelWidth = 7L
  )
)

# tour ----

# setting up tour
element <- intro <- character(0)

element <- c(element, "#Welcome")
intro <-
  c(
    intro,
    "Welcome to the interactive tour of the data used in <strong>Figure 3 (coding)</strong> of <strong>'Single-cell analysis of signalling and transcriptional responses to type I interferons'</strong>.<br/><br/>You will be shown around the different components of the app and learn the basic usage mechanisms by doing. Highlighted elements will respond to the user's actions, while the rest of the user interface will be shaded. You will be prompted at particular spots to perform some actions, which will be marked with \"<strong>Action:</strong>\" text. Please take care to follow these instructions, since later parts of the tour may assume that all the actions from previous steps have been performed.<br/><br/>If you leave the tour at any point and want to return, please click on the '?' in the right hand corner at the top of the page<br/><br/><strong>Action:</strong> click on the 'Next' button to proceed"
  )

element <- c(element, "#allpanels")
intro <-
  c(
    intro,
    "This app provides a Shiny interface that allows you to generate a series of panel types for exploring the data. These are described in more detail in the following steps. Please wait for the panels to finish loading before beginning your tour."
  )

# Feature Assay Plot 1
element <- c(element, "#FeatureAssayPlot1")
intro <-
  c(
    intro,
    "This panel can be used to view the counts for an individual gene across different samples, for each donor A, B and C."
  )

# Feature Assay Plot 1
element <- c(element, "#FeatureAssayPlot1_DataBoxOpen")
intro <-
  c(
    intro,
    "Select the gene you would like to view from the dropdown list under Y-axis feature in the <font color=\"#402ee8\">Data parameters</font> menu<br/><br/>"
  )

# Complex Heatmap plot
element <- c(element, "#ComplexHeatmapPlot1")
intro <-
  c(
    intro,
    "This panel depicts the expression of a selection of genes in a heatmap, for example, here we are looking at the expression of the two ISGs, <em>MX1</em> and <em>IFI44L</em>. <br/><br/>Each column represents a sample and each row a gene. Samples are ordered by treatment and donor."
  )

element <-
  c(element, "#ComplexHeatmapPlot1_DataBoxOpen")
intro <-
  c(intro,
    "Rows can be clustered by checking the box under the <font color=\"#402ee8\">Data parameters</font> header.<br/><br/> Genes of interest are entered by clicking the 'Edit feature names' box.")

element <- c(element, "#Figures")
intro <- c(intro, "To download any of the figure panels, click on the Download sign in the top right hand corner at the top of the page")

element <- c(element, "#Thanks")
intro <- c(intro, "Thank you for taking the tour and enjoy exploring the data!<br/><br/>To repeat the tour, please click on the '?' in the right hand corner at the top of the page")

tour <- data.frame(element = element,
  intro = intro,
  stringsAsFactors = FALSE)
