#' @name theme_paper
#' @aliases theme_paper
#' @title Theme of ggplot2 for scientific paper usage
#'
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
#' @inheritParams theme_paper
#' @export
#' @examples
#' theme_paper()
theme_paper <- function(){
  theme(line = element_line(colour = 'black', lineend = 'square'),
        text = element_text(color = 'black', size = 10),
        panel.background = element_blank(),
        plot.background = element_blank(),
        strip.background = element_blank(),
        legend.background = element_blank(),
        legend.box.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'square'),
        axis.text = element_text(color = 'black', size = 9),
        panel.grid = element_blank(),
        axis.ticks = element_line(color = 'black'),
        complete = TRUE)
}


#' Theme of ggplot2 barplot for scientific paper usage.
#'
#' Theme of ggplot2 barplot for scientific paper usage.
#' No background panel.
#' No grid of plot area.
#' The color of all texts are "black".
#'
#' @import ggplot2 scale_y_continuous
#' @export
#' @examples
#' theme_paper_bar()
theme_paper_bar <- function(){
  theme_paper() +
    ggplot2::scale_y_continuous(expand = c(0, 0))
}

