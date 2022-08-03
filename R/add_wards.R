#' Add Takoma Park ward boundaries
#'
#' Adds polygons for Takoma Park's ward boundaries to the map, with labels
#'
#' @param basemap A leaflet map.
#'
#' @return
#' @export
#'
#' @examples{
#' add_wards(leaflet::leaflet())
#'
#' }
add_wards <- function(basemap){
  basemap %>%
    leaflet::addPolygons(data = leafletwrappers::wards %>%
                  sf::st_transform(4326),
                fill = FALSE,
                smoothFactor = 0.5,
                weight = 1,
                group = "Ward boundaries",
                opacity = 1,
                color = "#646464",
                label = ~ stringr::str_to_title(WARD),
                # options = pathOptions(pane = "borders"),
                labelOptions = leaflet::labelOptions(noHide = TRUE,
                                            direction = 'center',
                                            textOnly = TRUE,
                                            style = list("font-weight" = "bold", padding = "1px 1px"),
                                            textsize = "10.25px"))
}


#' Add Takoma Park Ward boundaries from 2022 on
#'
#' Adds outlines of Takoma Park's ward boundaries from 2022 on to a leaflet map
#'
#' @param basemap Basemap to add boundaries to
#' @param .inclabs Whether to include Ward labels in center of Ward; default T
#' @param .weight Weight of Ward boundary lines; deafult 1.5
#' @param .color Color of Ward boundary lines; default "black"
#' @param  .opacity Opacity of Ward boundary lines; default 1
#'
#' @return
#' @export
#'
#' @examples{
#' add_wards_new(leaflet::leaflet())
#'
#' }
add_wards_new <- function(basemap, .inclabs = T, .weight = 1.5, .color = "black", .opacity = 1){

  if (.inclabs){
    return(basemap %>%
      leaflet::addPolygons(fill = FALSE,
                  smoothFactor = 0.5,
                  weight = .weight,
                  opacity = .opacity,
                  group = "Ward boundaries",
                  color = .color,
                  label = ~ paste0("Ward ", stringr::str_to_title(DISTRICT)),
                  labelOptions = leaflet::labelOptions(noHide = TRUE,
                                                       direction = "center",
                                                       textOnly = TRUE,
                                                       style = list(`font-weight` = "bold",
                                                                    padding = "1px 1px"),
                                                       textsize = "10.25px"),
      data = leafletwrappers::wards_new))
  }

  else{
    return(basemap %>%
             leaflet::addPolygons(fill = FALSE,
                         smoothFactor = 0.5,
                         weight = .weight,
                         opacity = .opacity,
                         group = "Ward boundaries",
                         color = .color,
                         labelOptions = leaflet::labelOptions(noHide = TRUE,
                                                              direction = "center",
                                                              textOnly = TRUE,
                                                              style = list(`font-weight` = "bold",
                                                                           padding = "1px 1px"),
                                                              textsize = "10.25px"),
           data = leafletwrappers::wards_new))
  }

}
