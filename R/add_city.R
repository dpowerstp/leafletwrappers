#' Add Takoma Park city boundaries
#' Function to add Takoma Park city boundaries to a leaflet map
#'
#' @param basemap A leaflet map.
#'
#' @return
#' @export
#'
#' @examples
add_city <- function(basemap){
  basemap %>%
    leaflet::addPolygons(data = leafletwrappers::city %>%
                           sf::st_transform(4326),
                fill = FALSE,
                smoothFactor = 0.5,
                weight = 1,
                opacity = 1,
                color = "#646464",
                label = "Takoma Park",
                # options = pathOptions(pane = "borders"),
                labelOptions = leaflet::labelOptions(noHide = TRUE,
                                            direction = 'top',
                                            textOnly = TRUE,
                                            style = list("font-weight" = "bold", padding = "1px 1px"),
                                            textsize = "10.25px"))
}
