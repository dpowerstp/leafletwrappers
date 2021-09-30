#' Create Leaflet Label
#' Creates a label-vector for Leaflet map from a supplied dataframe and character string supplied to a glue function
#'
#' @param df A spatial dataframe that will be supplied to a leaflet() function
#' @param label_text A data-masked text string fed to a glue function and later read as HTML, so HTML elements should be incorporated (e.g., <p></p>)
#' @importFrom magrittr %>%
#'
#' @return A character vector of labels that will be supplied in a leaflet map
#' @export
#'
#' @examples
#' label_standardize(leafletwrappers::wards, "Ward name: {WARD}<p></p> Area: {Area}")
label_standardize <- function(df, label_text){
  df %>%
    dplyr::mutate(label_col = glue::glue(label_text)) %>%
    dplyr::pull(label_col)
}

#' Turn Labels into HTML
#' A function to convert a character vector of labels for a leaflet map into a list with HTML applied to each element
#'
#' @param label_vec A character vector of labels corresponding to the length of the mapped dataframe
#'
#' @return A list with HTML applied to each element of the character vector
#' @export
#'
#' @examples
#' labs <- label_standardize(leafletwrappers::wards, "Ward name: {WARD}<p></p> Area: {Area}")
#'
#' map <- leaflet::leaflet(leafletwrappers::wards)
#' leaflet::addPolygons(map, label = label_html(labs))
label_html <- function(label_vec){
  purrr::map(label_vec, ~ htmltools::HTML(.x))
}

#' Label Output
#' Wrapper for label_standardize and label_html, to create labels for a leaflet map in one step
#'
#' @param df Dataframe to create labels from
#' @param label_text Text fed to glue function to create labels using columns in dataframe
#'
#' @return List of strings corresponding to length of dataframe, supplied to leaflet function
#' @export
#'
#' @examples
#' labs <- "Ward name: {WARD}<p></p> Area: {Area}"
#'
#' map <- leaflet::leaflet(leafletwrappers::wards)
#' leaflet::addPolygons(map, label = label_output(leafletwrappers::wards, labs))
label_output <- function(df, label_text){
  leafletwrappers::label_standardize(df, label_text) %>%
    leafletwrappers::label_html(.)
}
