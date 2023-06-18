library(iSEE)

# set up layout and defaults
initial <- list(
  RowDataTable(PanelWidth = 3L,
    PanelHeight = 800L),
  ColumnDataTable(PanelWidth = 3L,
    PanelHeight = 800L),
  ReducedDimensionPlot(
    Type = "UMAP",
    ColorBy = "Column data",
    ColorByColumnData = "Cluster",
    ShapeByColumnData = "sample_id",
    VisualChoices = c("Color", "Text"),
    PointSize = 1.5,
    PointAlpha = 1,
    LegendPointSize = 2,
    LegendPosition = "Bottom",
    LabelCenters = TRUE,
    LabelCentersBy = "Cluster",
    ColumnSelectionSource = "ColumnDataTable1",
    SelectionAlpha = 0.07,
    CustomLabels = FALSE,
    CustomLabelsText = "1",
    FontSize = 1.5,
    RowSelectionDynamicSource = FALSE,
    ColumnSelectionDynamicSource = TRUE,
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelWidth = 6L,
    PanelHeight = 800L
  ),
  ReducedDimensionPlot(
    Type = "UMAP",
    FacetRowByColData = "sample_id",
    FacetColumnByColData = "sample_id",
    ColorByColumnData = "Cluster",
    ColorByFeatureNameAssay = "exprs",
    ShapeByColumnData = "sample_id",
    FacetColumnBy = "Column data",
    ColorBy = "Column data",
    SelectionAlpha = 0.07,
    VisualChoices = c("Color", "Facet"),
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 500L,
    PanelWidth = 12L,
    ColumnSelectionSource = "ColumnDataTable1",
    ColumnSelectionDynamicSource = TRUE
  ),
  ColumnDataPlot(
    XAxis = "Column data",
    YAxis = "sample_id",
    XAxisColumnData = "Cluster",
    FacetRowByColData = "sample_id",
    FacetColumnByColData = "sample_id",
    ColorByColumnData = "Cluster",
    ShapeByColumnData = "sample_id",
    ColorBy = "Column data",
    VisualChoices = "Color",
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 500L,
    PanelWidth = 4L
  ),
  FeatureAssayPlot(
    XAxis = "Feature name",
    XAxisColumnData = "sample_id",
    XAxisFeatureName = "CD8",
    YAxisFeatureName = "CD4",
    FacetRowByColData = "sample_id",
    FacetColumnByColData = "sample_id",
    ColorByColumnData = "sample_id",
    ShapeByColumnData = "sample_id",
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 500L,
    PanelWidth = 4L,
    ColumnSelectionSource = "ColumnDataTable1",
    ColumnSelectionDynamicSource = TRUE
  ),
  FeatureAssayPlot(
    XAxis = "Column data",
    XAxisColumnData = "sample_id",
    YAxisFeatureName = "pSTAT1",
    FacetRowByColData = "sample_id",
    FacetColumnByColData = "sample_id",
    ColorByColumnData = "Cluster",
    ShapeByColumnData = "sample_id",
    ColorBy = "Column data",
    VisualBoxOpen = TRUE,
    VisualChoices = "Color",
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 500L,
    PanelWidth = 4L,
    RowSelectionSource = "---",
    ColumnSelectionSource = "ReducedDimensionPlot3",
    DataBoxOpen = FALSE,
    RowSelectionDynamicSource = FALSE,
    ColumnSelectionDynamicSource = TRUE,
    RowSelectionRestrict = FALSE,
    ColumnSelectionRestrict = TRUE,
    SelectionHistory = list()
  )
)

# setting up tour
element <- intro <- character(0)

element <- c(element, "#Welcome")
intro <-
  c(
    intro,
    "Welcome to the interactive tour of the data used in <strong>Figure 1</strong> of <strong>'Single-cell analysis of signalling and transcriptional responses to type I interferons'</strong>.<br/><br/>You will be shown around the different components of the app and learn the basic usage mechanisms by doing. Highlighted elements will respond to the user's actions, while the rest of the user interface will be shaded. You will be prompted at particular spots to perform some actions, which will be marked with \"<strong>Action:</strong>\" text. Please take care to follow these instructions, since later parts of the tour may assume that all the actions from previous steps have been performed.<br/><br/>If you leave the tour at any point and want to return, please click on the '?' in the right hand corner at the top of the page<br/><br/><strong>Action:</strong> click on the 'Next' button to proceed"
  )

element <- c(element, "#allpanels")
intro <-
  c(
    intro,
    "This app provides a Shiny interface that allows you to generate a series of panel types for exploring the data. These are described in more detail in the following steps. Please wait for the panels to finish loading before beginning your tour."
  )

# Row Data Table
element <- c(element, "#RowDataTable1")
intro <-
  c(
    intro,
    "We begin with a table describing the 39 antibodies used in this experiment. The columns show:<br/><br/><strong>channel_name:</strong> channel of the mass cytometer used to acquire this marker<br/><br/><strong>marker_class:</strong> category of this marker:<br/><br/><font color=\"#402ee8\">type:</font> markers used to identify different cell types<br/><br/><font color=\"#402ee8\">state:</font> intracellular markers including phosphoproteins<br/><br/><font color=\"#402ee8\">none:</font> antibodies against the type I interferon receptor<br/><br/><strong>used_for_clustering:</strong> whether or not this marker was used for clustering the cells"
  )

# Column data table
enc_cdt <- "ColumnDataTable1"

element <- c(element, "#ColumnDataTable1")
intro <-
  c(
    intro,
    "In the next table, each row represents an individual cell in the dataset. The columns show which sample and which cell type cluster the cells belong to. Samples and clusters can be filtered using the dropdown menus. The number of cells selected is shown at the bottom of the table.<br/><br/><strong>Action:</strong> Select only B cells using the dropdown menu in the Cluster column<br/><br/>The following plots are updated with the selection made in this table, with unselected cells appearing as shaded."
  )

element <- c(element, "#ColumnDataTable1")
intro <-
  c(intro,
    "<strong>Action:</strong> Remove the selection of B cells by clicking the x and wait for the plot on the right to update")

element <- c(element, "#ReducedDimensionPlot1")
intro <-
  c(intro,
    "This panel provides a <font color=\"#402ee8\">Reduced dimension plot</font> to allow a low-dimensional representation of the dataset (as shown in Figure S1a). Each point represents a cell, coloured according to the assigned cell type. The plot contains cells from all samples pooled together. <br/><br/>This plot receives any selection made in <font color=\"#402ee8\">Column data table 1</font>, unselected clusters are shaded.<br/><br/>You can also select a cluster by drawing a rectangular or polygon box directly on this plot. This selection will transmit to the panels below. Click on the plot anywhere outside of the selection to clear.<br/><br/><strong>Action:</strong> Draw a gate around the B cell cluster. Scroll down to see this cluster highlighted in the panels below. Deselect by clicking outside of the selection"
  )

element <-
  c(element, "#ReducedDimensionPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "There are a number of <font color=\"#402ee8\">Visual parameters</font> that can be changed in this plot. <br/><br/><strong>Action:</strong> Click on the header of this collapsible box to see the available options.<br/><br/><strong>Size:</strong> checking this box brings up an option to increase or decrease the point size on the plot (default is 1.5)<br/><br/><strong>Point</strong>: checking this box brings up an option to remove or alter the resolution of data downsampling used to construct the plot (default is 250). As the dataset is large, we downsample points in a density-dependent manner (removing points that are covered by other points) which reduces the number of points and speeds up plot rendering. Higher resolutions retain more points at the cost of rendering time<br/><br/><strong>Color by:</strong> default is to colour by Cluster but cells can also be coloured by sample_id when Column data is selected by selecting this from the dropdown menu. Selecting Feature Name gives the option to visualise a marker of choice on the plot by selecting it from the dropdown menu or typing the marker name"
  )

element <-
  c(element, "#ReducedDimensionPlot1_SelectionBoxOpen")
intro <-
  c(
    intro,
    "The <font color=\"#402ee8\">Selection parameters</font> box contains parameters to handle sharing of multiple point selections across panels. Points selected in a 'transmitting' panel can be visualised in a 'receiving' panel.<br/><br/><strong>Action:</strong> Click on the header of this collapsible box to see the available options. This plot is currently receiving the selection from <font color=\"#402ee8\">Column data table 1</font> but this can be changed to receive input from other panels, for example, a population gated in <font color=\"#402ee8\">Feature Assay Plot 1</font>"
  )

element <- c(element, "#ReducedDimensionPlot2")
intro <-
  c(
    intro,
    "This panel shows the <font color=\"#402ee8\">Reduced dimension plot</font> from the previous panel, separating the cells into samples (0, 25, 250, 2500, 25000 U/ml IFN-a2a).<br/><br/>This plot receives the selection made in <font color=\"#402ee8\">Reduced Dimension Plot 1</font>"
  )

element <- c(element, "#ColumnDataPlot1")
intro <-
  c(intro,
    "This panel shows the number of cells in each cluster per sample")

element <-
  c(element, "#ColumnDataPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "By clicking on the <font color=\"#402ee8\">Visual parameters</font> header, you can view the options for changing the visualisation of this plot.<br/><br/><strong>Color by:</strong> default is to colour the bars by Cluster. Selecting Feature Name gives the option to visualise a marker of choice on the plot by selecting it from the dropdown menu or typing the marker name.<br/><br/><strong>Action:</strong> View expression of CD4 on this plot then click 'Next"
  )

element <- c(element, "#FeatureAssayPlot1")
intro <-
  c(
    intro,
    "This panel provides biaxial plot for visualising the expression of two markers. The plot receives input from Reduced Dimension Plot 1, so to visualise all cells, you will need to clear the selection in <font color=\"#402ee8\">Reduced Dimension Plot 1</font>."
  )

element <-
  c(element, "#FeatureAssayPlot1_DataBoxOpen")
intro <-
  c(
    intro,
    "Markers for the X and Y axes are selected using the dropdown menus in the <font color=\"#402ee8\">Data parameters</font> box.<br/><br/><strong>Action:</strong> Select CD3 on the Y axis and CD19 on the X axis using the dropdown menus. Click on the 'Next' button to proceed"
  )

element <-
  c(element, "#FeatureAssayPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "To visualise expression of a third marker on the plot, select <strong>Colour by:</strong> Feature name <br/><br/><strong>Action:</strong> Include expression of CD11c on the plot"
  )

element <-
  c(element, "#FeatureAssayPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "Cells can also be coloured by <font color=\"#402ee8\">sample</font> by selecting <strong>Colour by:</strong> Column data sample_id or by <font color=\"#402ee8\">cluster</font> by selecting <strong>Colour by:</strong> Column data Cluster"
  )

element <- c(element, "#FeatureAssayPlot1")
intro <-
  c(
    intro,
    "Populations can be gated directly by drawing a rectangular or polygon gate by clicking on the plot. This selection is transmitted to the <font color=\"#402ee8\">Reduced Dimension Plots</font> and <font color=\"#402ee8\">Feature Assay Plot 2</font>. Clear the gate by clicking anywhere on the plot outside of the selection.<br/><br/><strong>Action:</strong> Draw a gate around the CD3- CD19+ population. Notice that the plot to the right updates with this selection."
  )

element <- c(element, "#FeatureAssayPlot2")
intro <-
  c(
    intro,
    "This panel shows the expression of a marker across the samples as a violin plot, where each dot is a cell. It receives the selection from <font color=\"#402ee8\">Feature Assay Plot 1</font>. This is useful for visualising expression of phosphoproteins, as we show for pSTAT1 in B cells here"
  )

element <-
  c(element, "#FeatureAssayPlot2_DataBoxOpen")
intro <-
  c(intro,
    "The marker of interest is selected from the dropdown menu for the Y-axis feature")

element <-
  c(element, "#FeatureAssayPlot2_DataBoxOpen")
intro <-
  c(
    intro,
    "Alternatively, you can visualise expression of type markers across different clusters in cells from all samples by selecting <strong>X-axis</strong> Column data cluster, first making sure that any selections in <font color=\"#402ee8\">Reduced Dimension Plot1</font> and <font color=\"#402ee8\">Feature Assay Plot 1</font> are cleared so all cells are available"
  )

element <- c(element, "#Figures")
intro <- c(intro, "To download any of the figure panels, click on the Download sign in the top right hand corner at the top of the page")

element <- c(element, "#Thanks")
intro <- c(intro, "Thank you for taking the tour and enjoy exploring the data!<br/><br/>To repeat the tour, please click on the '?' in the right hand corner at the top of the page")

tour <- data.frame(element = element,
  intro = intro,
  stringsAsFactors = FALSE)
