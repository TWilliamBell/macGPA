#' Convert your grades from the Twelve point system to the Four point system
#'
#' @param gradeVector the input is your grades as calculated on the four point scale.
#'
#' @return
#' The return value is a vector of numbers representing your grades on the four point scale.
#'
#' @export
#'
#' @examples
#' a = c(12, 12, 12, 12, 11)
#'
#' convertTwelveToFourPoint(gradeVector = a)
#'
#' ## [1] 4.0 4.0 4.0 4.0 3.9


convertTwelveToFourPoint <- function(gradeVector) {
  saveOrder <- order(order(gradeVector, decreasing = T))
  dplyr::inner_join(macGPA::gpatable[ , c(2, 4)], data.frame("Points" = gradeVector), by = "Points")$X4.0.Scale[saveOrder]
}
