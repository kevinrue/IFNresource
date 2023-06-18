# library ----

library(iSEE)

# initial ----

# set up layout and defaults
initial <- list(
  ColumnDataTable(PanelWidth = 4L,
    PanelHeight = 800L),
  ColumnDataPlot(
    XAxis = "Column data",
    YAxis = "nFeature_RNA",
    XAxisColumnData = "stim",
    FacetRowByColData = "stim",
    FacetColumnByColData = "stim",
    ColorByColumnData = "stim",
    ColorByFeatureNameAssay = "logcounts",
    ShapeByColumnData = "celltype",
    ColorBy = "Column data",
    VisualChoices = "Color",
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 460L,
    PanelWidth = 3L
  ),
  ColumnDataPlot(
    XAxis = "Column data",
    YAxis = "nFeature_RNA",
    XAxisColumnData = "celltype",
    FacetRowByColData = "stim",
    FacetColumnByColData = "stim",
    ColorByColumnData = "celltype",
    ColorByFeatureNameAssay = "logcounts",
    ShapeByColumnData = "stim",
    ColorBy = "Column data",
    VisualChoices = c("Color", "Facet"),
    FacetRowBy = "Column data",
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 600L,
    PanelWidth = 5L,
    HoverInfo = FALSE
  ),
  ReducedDimensionPlot(
    Type = "WNN.UMAP",
    ColorBy = "Column data",
    ColorByColumnData = "celltype",
    ShapeByColumnData = "stim",
    FacetRowByColData = "stim",
    FacetColumnByColData = "stim",
    ColorByFeatureNameAssay = "logcounts",
    VisualChoices = c("Color", "Text"),
    ColorByFeatureName = "MS4A1",
    PointSize = 1.5,
    PointAlpha = 1,
    LegendPointSize = 2,
    LegendPosition = "Bottom",
    LabelCenters = TRUE,
    LabelCentersBy = "celltype",
    ColumnSelectionSource = "---",
    SelectionAlpha = 0.07,
    CustomLabels = FALSE,
    CustomLabelsText = "1",
    FontSize = 1.5,
    RowSelectionDynamicSource = FALSE,
    ColumnSelectionDynamicSource = TRUE,
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelWidth = 6L,
    PanelHeight = 800L,
    HoverInfo = FALSE
  ),
  ColumnDataPlot(
    XAxis = "Column data",
    YAxis = "celltype",
    XAxisColumnData = "stim",
    FacetRowByColData = "stim",
    FacetColumnByColData = "stim",
    ColorBy = "Column data",
    ColorByColumnData = "celltype",
    ColorByFeatureNameAssay = "logcounts",
    ShapeByColumnData = "stim",
    PointSize = 1,
    PointAlpha = 1,
    Downsample = TRUE,
    DownsampleResolution = 250,
    LegendPointSize = 1,
    HoverInfo = FALSE,
    PanelHeight = 800L,
    PanelWidth = 6L
  ),
  ReducedDimensionPlot(
    Type = "WNN.UMAP",
    FacetRowByColData = "stim",
    FacetColumnByColData = "stim",
    ColorByColumnData = "celltype",
    ColorByFeatureNameAssay = "logcounts",
    ShapeByColumnData = "stim",
    FacetColumnBy = "Column data",
    ColorBy = "Column data",
    ColorByFeatureName = "IFI44L",
    SelectionAlpha = 0.07,
    VisualChoices = c("Color", "Facet"),
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 500L,
    PanelWidth = 12L,
    ColumnSelectionSource = "ReducedDimensionPlot1",
    ColumnSelectionDynamicSource = TRUE,
    LegendPointSize = 1,
    LegendPosition = "Bottom",
    HoverInfo = TRUE,
    LabelCenters = FALSE,
    LabelCentersBy = "stim"
  ),
  FeatureAssayPlot(
    XAxis = "Column data",
    XAxisColumnData = "stim",
    YAxisFeatureName = "IFI44L",
    FacetRowByColData = "None",
    FacetColumnByColData = "None",
    ColorByColumnData = "stim",
    ShapeByColumnData = "stim",
    ColorByFeatureNameAssay = "logcounts",
    FacetRowBy = "None",
    ColorBy = "Column data",
    Downsample = TRUE,
    DownsampleResolution = 250,
    PanelHeight = 800L,
    PanelWidth = 6L,
    VisualChoices = c("Color", "Facet"),
    ColumnSelectionSource = "ColumnDataTable1",
    ColumnSelectionDynamicSource = TRUE
  ),
  ComplexHeatmapPlot(
    Assay = "logcounts",
    CustomRows = TRUE,
    CustomRowsText = "IFI44L\nISG15\nIFIT3\nXAF1\nMX1\nIFI6\nIFIT1\nTRIM22\nMX2\nRSAD2",
    ClusterRows = FALSE,
    ClusterRowsDistance = "spearman",
    ClusterRowsMethod = "ward.D2",
    DataBoxOpen = FALSE,
    VisualChoices = "Annotations",
    ColumnData = c("stim"),
    RowData = character(0),
    CustomBounds = FALSE,
    LowerBound = NA_real_,
    UpperBound = NA_real_,
    AssayCenterRows = FALSE,
    AssayScaleRows = FALSE,
    DivergentColormap = "purple < black < yellow",
    ShowDimNames = "Rows",
    LegendPosition = "Bottom",
    LegendDirection = "Horizontal",
    VisualBoxOpen = FALSE,
    NamesRowFontSize = 20,
    NamesColumnFontSize = 10,
    ShowColumnSelection = FALSE,
    OrderColumnSelection = FALSE,
    PanelHeight = 800L,
    PanelWidth = 6L,
    SelectionBoxOpen = FALSE,
    RowSelectionSource = "---",
    ColumnSelectionSource = "ColumnDataTable1",
    RowSelectionDynamicSource = FALSE,
    ColumnSelectionDynamicSource = TRUE,
    RowSelectionRestrict = FALSE,
    ColumnSelectionRestrict = TRUE,
    SelectionHistory = list()
  )
)

# tour ----

# setting up tour
element <- intro <- character(0)

element <- c(element, "#Welcome")
intro <-
  c(
    intro,
    "Welcome to the interactive tour of the data used in <strong>Figure 4</strong> of <strong>'Single-cell analysis of signalling and transcriptional responses to type I interferons'</strong>.<br/><br/>You will be shown around the different components of the app and learn the basic usage mechanisms by doing. Highlighted elements will respond to the user's actions, while the rest of the user interface will be shaded. You will be prompted at particular spots to perform some actions, which will be marked with \"<strong>Action:</strong>\" text. Please take care to follow these instructions, since later parts of the tour may assume that all the actions from previous steps have been performed.<br/><br/>If you leave the tour at any point and want to return, please click on the '?' in the right hand corner at the top of the page<br/><br/><strong>Action:</strong> click on the 'Next' button to proceed"
  )

element <- c(element, "#allpanels")
intro <-
  c(
    intro,
    "This app provides a Shiny interface that allows you to generate a series of panel types for exploring the data. These are described in more detail in the following steps. Please wait for the panels to finish loading before beginning your tour."
  )

# Column data table
element <- c(element, "#ColumnDataTable1")
intro <-
  c(
    intro,
    "We begin with a table which shows the information contained within this dataset. Each row represents an individual cell and the columns provide the metadata, which is explained in more detail below:<br/><br/><strong>stim:</strong> which sample the cell belongs to<br/><br/><strong>celltype:</strong> assigned celltype<br/><br/><strong>cluster_id:</strong> cluster number as shown in Figure S13a<br/><br/><strong>percent.ribo:</strong> percentage of reads from genes encoding ribosomal proteins<br/><br/><strong>percent.mt:</strong> percentage of reads from mitochondrial genes"
  )

element <- c(element, "#ColumnDataTable1")
intro <-
  c(
    intro,
    "<strong>S.Score, G2M.Score, Phase:</strong> cell cycle score calculated using the Seurat package<br/><br/><strong>nCount_HTO:</strong> number of UMI counts from hashing oligos<br/><br/><strong>nFeature_HTO:</strong> number of unique hashing oligos detected<br/><br/><strong>nCount_ADT:</strong> number of UMI counts from antibody derived tags<br/><br/><strong>nFeature_ADT:</strong> number of unique antibody derived tags detected<br/><br/><strong>nCount_RNA:</strong> number of UMI counts from RNA molecules <br/><br/><strong>nFeature_RNA:</strong> number of genes detected<br/><br/><strong>nCount_SCT:</strong> number of UMI counts from RNA molecules when transformed using sctransform<br/><br/><strong>nFeature_SCT:</strong> number of genes detected when transformed using sctransform"
  )

element <- c(element, "#ColumnDataTable1")
intro <-
  c(
    intro,
    "The information in this table can be visualised in the following two panels"
  )

element <- c(element, "#ColumnDataPlot1")
intro <-
  c(
    intro,
    "Here, the number of genes detected in each cell is shown as a violin plot. Each dot represents an individual cell and cells are grouped by sample. This allows us to check that the number of genes detected in cells from each sample is comparable."
  )

element <-
  c(element, "#ColumnDataPlot1_DataBoxOpen")
intro <-
  c(
    intro,
    "The data to be plotted on the Y and X axes is selected from the drop down boxes in the <font color=\"#402ee8\">Data parameters</font> menu<br/><br/><strong>Action:</strong> Click on the <font color=\"#402ee8\">Data parameters</font> header and change the options to now visualise the percent.mt in different celltypes. Click on 'Next' to view the updated plot."
  )

element <-
  c(element, "#ColumnDataPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "The <font color=\"#402ee8\">Visual parameters</font> menu contains additional options for visualisation. By default, cells are coloured by stim but this can be changed to colouring by any of the metadata columns"
  )


element <- c(element, "#ColumnDataPlot2")
intro <-
  c(
    intro,
    "We can also look at metadata in more detail, for example, in this plot we are looking at the number of genes detected in each celltype, separating the cells by sample. Again, the data to be plotted on the Y and X axes from the drop down boxes in the <font color=\"#402ee8\">Data parameters</font> menu. "
  )

element <- c(element, "#ReducedDimensionPlot1")
intro <-
  c(intro,
    "This panel provides a <font color=\"#402ee8\">Reduced dimension plot</font> to allow a low-dimensional representation of the dataset (as shown in Figure 4a). Each point represents a cell, coloured according to the assigned cell type. The plot contains cells from all samples pooled together. <br/><br/>You can select a cluster by drawing a rectangular or polygon box directly on this plot. This selection will transmit to the panels below. Click on the plot anywhere outside of the selection to clear.<br/><br/><strong>Action:</strong> Draw a gate around the B cell cluster. Scroll down to see this cluster highlighted in the panels below. Deselect by clicking outside of the selection"
  )

element <-
  c(element, "#ReducedDimensionPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "There are a number of <font color=\"#402ee8\">Visual parameters</font> that can be changed in this plot. <br/><br/><strong>Action:</strong> Click on the header of this collapsible box to see the available options.<br/><br/><strong>Size:</strong> checking this box brings up an option to increase or decrease the point size on the plot (default is 1.5)<br/><br/><strong>Point</strong>: checking this box brings up an option to remove or alter the resolution of data downsampling used to construct the plot (default is 250). As the dataset is large, we downsample points in a density-dependent manner (removing points that are covered by other points) which reduces the number of points and speeds up plot rendering. Higher resolutions retain more points at the cost of rendering time<br/><br/><strong>Color by:</strong> default is to colour by celltype but cells can also be coloured by cluster_id (as shown in Figure S13a), or sample_id when Column data is selected by selecting this from the dropdown menu. Selecting Feature Name gives the option to visualise a marker of choice on the plot by selecting it from the dropdown menu or typing the marker name"
  )

element <-
  c(element, "#ReducedDimensionPlot1_DataBoxOpen")
intro <-
  c(
    intro,
    "By default, we are showing the weighted nearest neighbour UMAP, constructed using input from both the ADT (protein) data and transformed RNA data (SCT). The UMAPs for the SCT and ADT (as shown in Figure S13), as well as PCA plots can be selected from the <strong>Type:</strong> dropdown menu under <font color=\"#402ee8\">Data parameters</font>"
  )

element <-
  c(element, "#ReducedDimensionPlot1_SelectionBoxOpen")
intro <-
  c(
    intro,
    "The <font color=\"#402ee8\">Selection parameters</font> box contains parameters to handle sharing of multiple point selections across panels. Points selected in a 'transmitting' panel can be visualised in a 'receiving' panel.<br/><br/><strong>Action:</strong> Click on the header of this collapsible box to see the available options. This plot is currently transmitting the selection to <font color=\"#402ee8\">Reduced Dimension Plot 2</font>"
  )


element <- c(element, "#ReducedDimensionPlot2")
intro <-
  c(
    intro,
    "This panel shows the <font color=\"#402ee8\">Reduced dimension plot</font> from the previous panel, separating the cells into the individual samples (unstim, IFN-a1, IFN-a2a, IFN-a10, IFN-b, IFN-o).<br/><br/>This plot receives the selection made in <font color=\"#402ee8\">Reduced Dimension Plot 1</font>"
  )

element <- c(element, "#ColumnDataPlot3")
intro <-
  c(intro,
    "This panel can be used to further explore the data, for example, here we are comparing the number of cells in each different cell type across the six samples.")

element <- c(element, "#FeatureAssayPlot1")
intro <-
  c(
    intro,
    "This panel allows you to explore the expression of a gene in response to stimulation with the five type I IFNs we tested. We can initially look at gene expression in 'bulk' PBMCs, as shown here for <em>IFI44L</em>."
  )

element <-
  c(element, "#FeatureAssayPlot1_DataBoxOpen")
intro <-
  c(
    intro,
    "We can also look at the expression of a gene in response to different type I IFNs in different cell types.<br/><br/><strong>Action:</strong> Click on the <font color=\"#402ee8\">Data parameters</font> header and select cell type for the X-axis. Click on the 'Next' button to proceed"
  )

element <-
  c(element, "#FeatureAssayPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "<strong>Action:</strong> Next, under the <font color=\"#402ee8\">Visual parameters</font> header, select <strong>Facet as row:</strong> Column data: stim. The plot will now show the expression of <em>IFI44L</em> in each cell type for each sample."
  )

element <-
  c(element, "#FeatureAssayPlot1_VisualBoxOpen")
intro <-
  c(
    intro,
    "We can also change the colouring of the data to match the UMAP by selecting <strong>Colour by:</strong> Column data:  celltype"
  )

element <- c(element, "#FeatureAssayPlot1")
intro <-
  c(
    intro,
    "If required, you can select groups of cells on this plot by drawing a box anywhere on the plot, in the same way as on the Reduced Dimension Plots. The plot to the right updates with this selection. Clear the selection by clicking on the plot anywhere outside of the box."
  )

element <- c(element, "#ComplexHeatmapPlot1")
intro <-
  c(
    intro,
    "This panel depicts the expression of a selection of genes in a heatmap, for example, here we are looking at the expression of the 10 Core ISGs.<br/><br/>Each column represents an individual cell and each row a gene. Cells are grouped by sample. "
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
