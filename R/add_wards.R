#' Add Takoma Park ward boundaries
#'
#' @param basemap A leaflet map.
#'
#' @return
#' @export
#'
#' @examples
add_wards <- function(basemap){
  basemap %>%
    addPolygons(data = wards,
                fill = FALSE,
                smoothFactor = 0.5,
                weight = 1,
                opacity = 1,
                color = "#646464",
                label = ~ str_to_title(WARD),
                # options = pathOptions(pane = "borders"),
                labelOptions = labelOptions(noHide = TRUE,
                                            direction = 'center',
                                            textOnly = TRUE,
                                            style = list("font-weight" = "bold", padding = "1px 1px"),
                                            textsize = "10.25px"))
}
