#' Add leaflet legend
#'
#' A function to add a legend in standard format to a leaflet map
#'
#' @param basemap A leaflet basemap
#' @param df A spatial dataframe with the geography stripped that provides data visualized in the polygon
#' @param pal_funct A color function; e.g. leafletwrappers::color_numeric will often be approriate for numeric functions
#' @param variable The variable to create a legend for from the provided dataframe, supplied as a string.
#' @param group The group of the legend, supplied as a string.
#' @param title The title of the legend, displayed above the legend.
#' @param .opacity The opacity of the legend; defaults 0.7.
#' @param .data A spatial dataframe. Defaults to the basemap dataframe; if the data being visualized is different from the dataframe used in the basemap, supply the other dataframe here
#'
#' @return A legend in a Leaflet map
#' @export
#'
#' @examples
addlegend_standard <- function(basemap,
                               df,
                               pal_funct,
                               variable,
                               group,
                               title,
                               .opacity = 0.7,
                               .data = leaflet::getMapData(basemap)){
  basemap %>%
    leaflet::addLegend("topright",
              pal = pal_funct,
              values = ~ df[[variable]],
              opacity = .opacity,
              group = group,
              title = title,
              data = .data)
}
