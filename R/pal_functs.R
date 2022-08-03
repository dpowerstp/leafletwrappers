#' Percentile palette
#'
#' Function to generate a palette function to color percentile data
#'
#' @param colors Colors argument to leaflet::colorBin() function
#'
#' @return
#' @export
#'
#' @examples
pal_pctile <- function(colors = "Blues"){
  leaflet::colorBin(palette = colors, domain = c(0, 100), bins = seq(0, 100, 10))
}


#' Numeric palette
#'
#' Function to generate a color palette for a variable based on a supplied dataframe
#'
#' @param var A variable in the dataframe, supplied as a string
#' @param colors Colors to supply to the palette argument in a colorNumeric() function
#' @param df A spatial dataframe with a stripped geography
#' @param reverse Whether to reverse the generated color palette
#'
#' @return
#' @export
#'
#' @examples
pal_numeric <- function(var,
                        colors,
                        df,
                        reverse = FALSE) {
  leaflet::colorNumeric(palette = colors,
                        domain = df[[var]],
                        reverse = reverse)
}




