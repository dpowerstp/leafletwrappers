#' Percentile palette
#' Function to generate a palette function to color percentile data
#'
#' @param colors Colors argument to leaflet::colorBin() function
#'
#' @return
#' @export
#'
#' @examples
pal_pctile <- function(colors = "Blues"){
  colorBin(palette = colors, domain = c(0, 100), bins = seq(0, 100, 10))
}
