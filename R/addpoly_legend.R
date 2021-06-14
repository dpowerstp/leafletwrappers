#' Add standard polygon/legend
#' A function to add a standardized legend/polygon to a leaflet map
#'
#' @param basemap_select A leaflet basemap
#' @param df_select A spatial dataframe with the geography stripped
#' @param pal_funct_select A color function
#' @param variable_select A variable to color in the polygon from the spatial datafrmae
#' @param group_select A group for the legend/polygon
#' @param title_select The title of the legend/polygon
#' @param labels_select A list of labels corresponding to the length of the dataframe to appear as pop-ups
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
                           labels_select){

  basemap_select %>%
    leafletwrappers::addpoly_standard(df = df_select,
                     pal_funct = pal_funct_select,
                     variable = variable_select,
                     group = group_select,
                     labels = labels_select) %>%
    leafletwrappers::addlegend_standard(df = df_select,
                       pal_funct = pal_funct_select,
                       variable = variable_select,
                       group = group_select,
                       title = title_select)
}
