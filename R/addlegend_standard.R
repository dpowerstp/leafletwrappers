#' Add leaflet legend
#' A function to add a legend in standard format to a leaflet map
#'
#' @param basemap A leaflet basemap
#' @param df A spatial dataframe with the geography stripped that provides data visualized in the polygon
#' @param pal_funct A color function; e.g. leafletwrappers::color_numeric will often be approriate for numeric functions
#' @param variable The variable to create a legend for from the provided dataframe
#' @param group The group of the legend
#' @param title The title of the legend
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
                               title){
  basemap %>%
    leaflet::addLegend("topright",
              pal = pal_funct,
              values = ~ df[[variable]],
              opacity = 0.7,
              group = group,
              title = title)
}
