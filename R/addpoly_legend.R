#' Add standard polygon/legend
#' A function to add a standardized legend/polygon to a leaflet map
#'
#' @param basemap_select A leaflet basemap
#' @param df_select A spatial dataframe with the geography stripped
#' @param pal_funct_select A color function; e.g. leafletwrappers::color_numeric will often be approriate for numeric functions
#' @param variable_select A variable to color in the polygon from the spatial dataframe, supplied as a string
#' @param group_select A group for the legend/polygon
#' @param title_select The title of the legend/polygon
#' @param labels_select A list of labels corresponding to the length of the dataframe to appear as pop-ups
#' @param .legopacity The opacity of the polygon legend. Default value of 0.7
#' @param .polopacity The opacity of the polygon lines. Default value of 1
#' @param .polfillopacity The opacity of the colors inside the polygons. Default value of 0.4
#' @param .polweight The weight of the polygon lines. Default value of 1
#' @param .pollinecolor The color of the polygon lines. Default value of transparent
#' @param .data A spatial dataframe. Defaults to the basemap dataframe; if the data being visualized is different from the dataframe used in the basemap, supply the other dataframe here
#'
#' @return
#' @export
#'
#' @examples
addpoly_legend <- function(basemap_select,
                           df_select,
                           pal_funct_select,
                           variable_select,
                           group_select,
                           title_select,
                           labels_select,
                           .legopacity = 0.7,
                           .polopacity = 1,
                           .polfillopacity= 0.4,
                           .polweight = 1,
                           .pollinecolor = "transparent",
                           .data = leaflet::getMapData(basemap_select)){

  basemap_select %>%
    leafletwrappers::addpoly_standard(df = df_select,
                     pal_funct = pal_funct_select,
                     variable = variable_select,
                     group = group_select,
                     labels = labels_select,
                     .weight = .polweight,
                     .color = .pollinecolor,
                     .opacity = .polopacity,
                     .fillopacity = .polfillopacity,
                     .data = .data) %>%
    leafletwrappers::addlegend_standard(df = df_select,
                       pal_funct = pal_funct_select,
                       variable = variable_select,
                       group = group_select,
                       title = title_select)
}
