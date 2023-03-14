#' @title Cat pandoc command to include a figure
#'
#' @description Cat pandoc command to include a figure
#'
#' @param path character. Path to the figure.
#' @param caption character. Caption of the figure.
#' @param label character. Label of the figure.
#' Need not supply `#fig-` prefix (but it
#' will not be repeated if you do).
#' @param args character. Additional arguments to be passed to pandoc.
#' @param force_cross_ref logical.
#' If `TRUE`, then will throw an error if either `caption`
#' or `label` are `NULL` as these are both required for
#' cross-referenceable figures in `quarto`.
#' Default is `TRUE`.
#' @param force_exists logical.
#' Will throw an error if the file at `path` does not exist.
#' Default is `TRUE`.
#'
#' @examples
#' quartorsv_cat_pandoc_fig(
#'   path = "path/to/fig.png",
#'   caption = "Incredible hist() plot",
#'   label = "hist-plot",
#'   args = "width=50%",
#'   force_exists = FALSE
#' )
#'
#' @export
quartorsv_cat_pandoc_fig <- function(path,
                                     caption = NULL,
                                     label = NULL,
                                     args = NULL,
                                     force_cross_ref = TRUE,
                                     force_exists = TRUE) {
  # checks
  # ----------

  # types
  if (!is.character(path)) {
    stop("`path` must be a character vector")
  }
  if (!is.null(caption)) {
    if (!is.character(caption)) {
      stop("`caption` must be a character vector")
    }
  }
  if (!is.null(label)) {
    if (!is.character(label)) {
      stop("`label` must be a character vector")
    }
  }
  if (!is.null(args)) {
    if (!is.character(args)) {
      stop("`args` must be a character vector")
    }
  }

  # existence
  if (!invisible(file.exists(path)) && force_exists) {
    stop("File does not exist: ", path)
  }

  # cross-referenceable
  if (force_cross_ref) {
    if (is.null(caption)) {
      stop("captiontion cannot be NULL if force_cross_ref is TRUE")
    }
    if (is.null(label)) {
      stop("Label cannot be NULL if force_cross_ref is TRUE")
    }
  }

  # create squiggly bracket text
  # -----------------------------

  # label
  if (!is.null(label)) {
    txt_squiggly_lbl <- paste0(
      "#fig-", gsub("^#fig\\-|^fig\\-", "", label), " "
    )
  } else {
    txt_squiggly_lbl <- ""
  }

  # extra arguments
  if (!is.null(args)) {
    txt_squiggly <- paste0("{", txt_squiggly_lbl, args, "}")
  } else {
    if (!is.null(label)) {
      txt_squiggly <- paste0("{", txt_squiggly_lbl, "}")
    } else {
      txt_squiggly <- ""
    }
  }
  txt_squiggly <- gsub("\\s+\\}$", "}", txt_squiggly)

  # final cat
  # ----------------
  txt_out <- paste0(
    "![", caption, "](", path, ")", txt_squiggly
  )
  if (Sys.getenv("QUARTORSV_TESTING") != "TRUE") {
    cat(paste0(txt_out, "\n"))
  }
  invisible(txt_out)
}
