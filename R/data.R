#' Ward boundaries for 2013-2022
#'
#' A shapefile containing polygons for Ward boundaries from 2013-2022
#'
#' @format A data frame with 6 rows and 8 variables
#' \describe{
#'   \item{OBJECTID}{Unique identifier for Ward}
#'   \item{ID}{ID for Ward}
#'   \item{WARD}{Ward}
#'   \item{Area}{Area of Ward}
#'   \item{Area_acre}{Area of Ward in acres}
#'   \item{Shape_Leng}{Length of polygon}
#'   \item{Shape_Area}{Area of Polygon}
#'   \item{geometry}{Geometry of Ward}
#' }
#' @source {City staff}
"wards"

#' Ward boundaries for 2022-2030
#'
#' A shapefile containing Ward boundaries from 2022-2030 after the 2020 redistricting
#'
#' @format A data frame with 6 rows and 8 variables
#' \describe{
#'   \item{DISTRICT}{Ward}
#'   \item{DISTNUM}{Ward number}
#'   \item{WARD}{Ward}
#'   \item{Shape_Length}{Length of polygon}
#'   \item{Shape_Area}{Area of Polygon}
#'   \item{geometry}{Geometry of Ward}
#' }
#' @source {Redistricting contractor}
"wards_new"

#' City Boundaries
#'
#' A shapefile containing the City of Takoma Park's boundaries
#'
#' @format A data frame with 6 rows and 8 variables
#' \describe{
#'   \item{PERIMETER}{Of City}
#'   \item{AREA_NAME}{Name of City}
#'   \item{INCORPORAT}{Whether incorporated}
#'   \item{ACRES}{Acres of City}
#'   \item{OFFICIAL_N}{Official name of City}
#'   \item{ADDRESS}{Address of City offices}
#'   \item{CITY}{City name}
#'   \item{ZIP_CODE}{Zip-code associated with City (note; Takoma Park covers part of the 20912 and 20911 zip codes)}
#'   \item{WEBSITE}{City website address}
#'   \item{MML_MEMBER}{Whether City is part of Maryland Municipal League}
#'   \item{CODE}{Code for City}
#'   \item{SHAPE_Length}{Length of polygon}
#'   \item{SHAPE}{Geometry}
#' }
"city"

