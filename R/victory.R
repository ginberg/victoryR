#' victory
#'
#' Create Victory Chart.
#'
#' @import htmlwidgets
#'
#' @export
victory <- function(data, x, y, type = "Bar", ..., width = NULL, height = NULL, elementId = NULL) {

  data <- mapply(
    function(label, value) {
      out <- list()
      out[[x]] <- label
      out[[y]] <- value
      out
    },
    data[[x]],
    data[[y]],
    SIMPLIFY = FALSE
  )

  # describe a React component to send to the browser for rendering.
  widget_markup <- reactR::reactMarkup(reactR::component(
    paste0("Victory", type),
    list(data = data,
         x    = x,
         y    = y,
         ...)
  ))

  # create widget
  htmlwidgets::createWidget(
    name      = 'victory',
    x         = widget_markup,
    width     = width,
    height    = height,
    package   = 'victoryR',
    elementId = elementId
  )
}

#' Shiny bindings for victory
#'
#' Output and render functions for using victory within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a victory
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name victory-shiny
#'
#' @export
victoryOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'victory', width, height, package = 'victoryR')
}

#' @rdname victory-shiny
#' @export
renderVictory <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, victoryOutput, env, quoted = TRUE)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @rdname victory-shiny
victory_html <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}
