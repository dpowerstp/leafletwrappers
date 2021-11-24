#' Add Polygons
#' A function to add a filled-in polygon layer coloring the polygon by the provided variable
#'
#' @param basemap A leaflet basemap
#' @param df A spatial dataframe with the geography stripped that provides data visualized in the polygon
#' @param pal_funct A color function; e.g. leafletwrappers::color_numeric will often be approriate for numeric functions
#' @param variable The variable to visualize in the polygon from the provided dataframe
#' @param group The group-name of the polygon; a string
#' @param labels A list of labels corresponding to the length of the dataframe to appear as pop-ups
#' @param .weight The weight of the polygon lines. Default value of 1
#' @param .color The opacity of the polygon lines. Default value of 1
#' @param .opacity The opacity of the colors inside the polygons. Default value of 0.4
#' @param .fillopacity The color of the polygon lines. Default value of transparent
#' @param .data A spatial dataframe. Defaults to the basemap dataframe; if the data being visualized is different from the dataframe used in the basemap, supply the other dataframe here
#'
#' @return A polygon layer in a leaflet map
#' @export
#'
#' @examples
addpoly_standard <- function(basemap,
                             df,
                             pal_funct,
                             variable,
                             group,
                             labels,
                             .weight = 1,
                             .color = "transparent",
                             .opacity = 1,
                             .fillopacity = 0.4,
                             .data = leaflet::getMapData(basemap)){

  basemap %>%
    leaflet::addPolygons(color = .color,
                weight = .weight,
                fill = T,
                opacity = .opacity,
                fillOpacity = .fillopacity,
                fillColor = ~ pal_funct(df[[variable]]),
                group = group,
                highlight = leaflet::highlightOptions(stroke = TRUE,
                                             weight = 3.5,
                                             fillOpacity = 0.6,
                                             color = "#555EE7",
                                             opacity = 1,
                                             bringToFront = TRUE),
                label = purrr::map(labels, htmltools::HTML),
                labelOptions = leaflet::labelOptions(
                  style = list("font-weight" = "normal",
                               "padding" = "0.2px 0.2px",
                               "line-height" = 0.8),
                  textsize = "10px",
                  direction = "auto",
                  opacity = 0.8),
                data = .data)
}
