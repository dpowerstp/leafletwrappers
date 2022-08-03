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
#' @param .label_padding Label padding of label; default
#' @param .label_lineheight Label line-height; default 0.8
#' @param .label_textsize Label textsize; default "10px"
#' @param .label_opacity Label opacity; default 0.8
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
                             .data = leaflet::getMapData(basemap),
                             .label_padding = "0.2px 0.2px",
                             .label_lineheight = 0.8,
                             .label_textsize = "10px",
                             .label_opacity = 0.8){

  basemap %>%
    leaflet::addPolygons(color = .color,
                         weight = .weight,
                         fill = T,
                         opacity = .opacity,
                         fillOpacity = .fillopacity,
                         fillColor = ~ pal_funct(df[[variable]]),
                         group = group,
                         highlight = leaflet::highlightOptions(
                           stroke = TRUE,
                           weight = 3.5,
                           fillOpacity = 0.6,
                           color = "#555EE7",
                           opacity = 1,
                           bringToFront = TRUE),
                         label = purrr::map(labels, htmltools::HTML),
                         labelOptions = leaflet::labelOptions(
                           style = list("font-weight" = "normal",
                                        "padding" = .label_padding,
                                        "line-height" = .label_lineheight),
                           textsize = .label_textsize,
                           direction = "auto",
                           opacity = .label_opacity),
                         data = .data)
}

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




#' Add standard polygon/legend
#'
#' A function to add a standardized legend/polygon to a leaflet map
#'
#' @param basemap_select A leaflet basemap
#' @param df_select A spatial dataframe with the geography stripped
#' @param pal_funct_select A color function; e.g. leafletwrappers::color_numeric will often be approriate for numeric functions
#' @param variable_select A variable to color in the polygon from the spatial dataframe, supplied as a string
#' @param group_select A group for the legend/polygon
#' @param title_select The title of the legend/polygon
#' @param labels_select A list of labels corresponding to the length of the dataframe to appear as pop-ups
#' @param .legopacity The opacity of the polygon legend. Default value of 0.7
#' @param .polopacity The opacity of the polygon lines. Default value of 1
#' @param .polfillopacity The opacity of the colors inside the polygons. Default value of 0.4
#' @param .polweight The weight of the polygon lines. Default value of 1
#' @param .pollinecolor The color of the polygon lines. Default value of transparent
#' @param .data A spatial dataframe. Defaults to the basemap dataframe; if the data being visualized is different from the dataframe used in the basemap, supply the other dataframe here
#' @param ... Extra label arguments to supply to addpoly_standard
#'
#' @return
#' @export
#'
#' @examples
addpoly_legend <- function(basemap_select,
                           df_select,
                           pal_funct_select,
                           variable_select,
                           group_select,
                           title_select,
                           labels_select,
                           .legopacity = 0.7,
                           .polopacity = 1,
                           .polfillopacity= 0.4,
                           .polweight = 1,
                           .pollinecolor = "transparent",
                           .data = leaflet::getMapData(basemap_select),
                           ...){

  basemap_select %>%
    leafletwrappers::addpoly_standard(df = df_select,
                     pal_funct = pal_funct_select,
                     variable = variable_select,
                     group = group_select,
                     labels = labels_select,
                     .weight = .polweight,
                     .color = .pollinecolor,
                     .opacity = .polopacity,
                     .fillopacity = .polfillopacity,
                     .data = .data) %>%
    leafletwrappers::addlegend_standard(df = df_select,
                       pal_funct = pal_funct_select,
                       variable = variable_select,
                       group = group_select,
                       title = title_select)
}

#' Add standard clustered-points
#'
#' Standard function for adding clustered points layer to leaflet object, colored by a palette function
#'
#' @param leafletobj Leaflet object
#' @param var Variable layer is being colored by as character string
#' @param pal_funct Palette function to color variable by, created by one of leaflet's color functions
#' @param grp Group layer belongs to
#' @param radius Radius of points; default 0.1
#' @param weight Weight of points; default 20
#' @param df Spatial dataframe behind layer; default leaflet::getMapData(leafletobj)
#' @param .popup_maxheight Maximum height of pop-up window; default 200
#' @param .popup_maxwidth Maximum width of pop-up window; default 200
#' @param .label_padding Label padding of label; default
#' @param .label_lineheight Label line-height; default 0.8
#' @param .label_textsize Label textsize; default "10px"
#' @param .label_opacity Label opacity; default 0.8
#' @param labvar Label to show when hover over a point; can feed either a data-masked variable name, or a set of labels created by leafletwrappers::label_standard function
#' @param popuptext Labels to show in pop-up over point, created by leafletwrappers::label_output function
#'
#' @return
#' @export
#'
#' @examples
addcluster_standard <- function(leafletobj,
                                var,
                                pal_funct,
                                grp,
                                labvar,
                                popuptext,
                                radius = 0.1,
                                weight = 20,
                                df = leaflet::getMapData(leafletobj),
                                .popup_maxheight = 200,
                                .popup_maxwidth = 200,
                                .label_padding = "0.2px 0.2px",
                                .label_lineheight = 0.8,
                                .label_textsize = "10px",
                                .label_opacity = 0.8){
  leafletobj %>%
    leaflet::addCircleMarkers(
      radius = radius,
      color = ~ pal_funct(sf::st_drop_geometry(df)[[var]]),
      group = grp,
      stroke = T,
      weight = weight,
      data = df,
      clusterOptions = leaflet::markerClusterOptions(),
      popupOptions = leaflet::popupOptions(
        maxHeight = .popup_maxheight,
        maxWidth = .popup_maxwidth
      ),
      label = ~ labvar,
      labelOptions = leaflet::labelOptions(
        style = list(`font-weight` = "normal",
                     padding = .label_padding,
                     `line-height` = .label_lineheight),
        textsize = .label_textsize,
        direction = "auto",
        opacity = .label_opacity
      ),
      # highlight = leaflet::highlightOptions(
      #   stroke = TRUE,
      #   weight = 3.5,
      #   fillOpacity = 0.6,
      #   color = "#555EE7",
      #   opacity = 1,
      #   bringToFront = TRUE),
      popup = popuptext
    )

}

#' Add cluster layer and legend
#'
#' Adds cluster layer and legend to leaflet map, with points in cluster layer shaded by palette function
#'
#' @param leafletobj Leaflet object
#' @param var String name of variable colored in cluster layer
#' @param pal_funct Palette function to color cluster layer
#' @param grp Group of cluster layer
#' @param labvar Label to show when hover over a point; can feed either a data-masked variable name, or a set of labels created by leafletwrappers::label_standard function
#' @param popuptext Labels to show in pop-up over point, created by leafletwrappers::label_output function
#' @param title Title of legend; default grp
#' @param radius Radius of points; default 0.1
#' @param weight Weight of points; default 20
#' @param df Spatial dataframe behind layer; default leaflet::getMapData(leafletobj)
#' @param ... Additional .label or .popup arguments for leafletwrappers::addcluster_standard, or opacity argument for leafletwrapper::addlegend_standard
#'
#' @return Leaflet object with cluster layer and legend
#' @export
#'
#' @examples
addcluster_legend <- function(leafletobj,
                              var,
                              pal_funct,
                              grp,
                              labvar,
                              popuptext,
                              title = grp,
                              radius = 0.1,
                              weight = 20,
                              df = leaflet::getMapData(leafletobj),
                              ...){
  leafletobj %>%
    leafletwrappers::addcluster_standard(
      var = var,
      pal_funct = pal_funct,
      grp = grp,
      labvar = labvar,
      popuptext = popuptext,
      radius= radius,
      weight = weight,
      df = df
    ) %>%
    leafletwrappers::addlegend_standard(
      df = sf::st_drop_geometry(df),
      pal_funct = pal_funct,
      variable = var,
      group = grp,
      title = title,
      ...
    )

}

#' Quick layer controls
#'
#' Quick function to add a vector of groups as overlay groups for a leaflet map, and hide groups you don't want displayed in one step
#'
#' @param leafletobj Leaflet object
#' @param groups Character vector of overlay groups to show on Leaflet map
#' @param hide Groups to hide on leaflet map. If NULL (default), hides all groups but first group
#' @param .pos Position of layer controls; default "topleft"
#'
#' @return Leaflet map with overlay groups
#' @export
#'
#' @examples
layercontrolsquick <- function(leafletobj, groups, hide = NULL, .pos = "topleft"){

  if (!is.null(hide)){
    hide <-groups[-1]
  }

  leafletobj %>%
    leaflet::addLayersControl(
      overlayGroups = groups,
      position = .pos,
      options = leaflet::layersControlOptions(collapsed = F),
    ) %>%
    leaflet::hideGroup(group = hide)

}
