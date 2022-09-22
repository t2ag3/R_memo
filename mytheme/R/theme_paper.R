#' @name theme_paper
#' @aliases theme_paper
#' @title Theme of ggplot2 for scientific paper usage
#' @description Theme of ggplot2 for scientific paper usage.
#' No background panel.
#' No grid of plot area.
#' The color of all texts are "black".
#'
#' @author Ken Takasawa
#'
#' @importFrom ggplot2
#'    theme
#'    element_line
#'    element_text
#'    element_blank
#'
#' @export
#' @examples
#' theme_paper()

theme_paper <- function(){
  theme(line = element_line(colour = 'black', lineend = 'square'),
        text = element_text(color = 'black', size = 12),
        panel.background = element_blank(),
        plot.background = element_blank(),
        strip.background = element_blank(),
        legend.background = element_blank(),
        legend.box.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'square'),
        axis.text = element_text(color = 'black', size = 9),
        panel.grid = element_blank(),
        complete = TRUE)
}
