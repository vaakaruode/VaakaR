# .........................................................................
# datafunctions.R
# started 11.2.2024
# .........................................................................

# .........................................................................
#' Convert Email Data to JSON
#'
#' This function converts email data stored in a list to JSON format.
#'
#' @param data A list containing email or any kind of list data in R that you want to convert into json-format.
#' @param sort.by.decreasing.datetime sort.by.decreasing.datetime default NULL, TRUE = desc i.e. decreasing, FALSE = asc i.e. incresing.
#' @param rename_duplicate_id rename_duplicate_id if duplicate id values, these are corrected automatically. Note, it is recommend not to have duplicate id values, otherwise linking between objects may not work.
#' @param addmainbrackets Add start and end brackets to the output. Default is TRUE.
#' @param savejson Do you want to save json, default is TRUE.
#' @param catdata print output in the R Console. Default FALSE.
#' @param file_path The full path to the file. Remember to include *.json*.
#' @param writewith writewith defines encoding, default is "file_conn" using UTF-8.
#' @param info show informative output on Console. Default: TRUE
#' @param debug_info show debug output on Console. Default: FALSE
#' @return A JSON string representing the email data without brackets around single elements.
#' @importFrom jsonlite toJSON fromJSON
#' @export
#' @rdname create_email_as_json
#' @section Changes in version 0.02.14:
#' - json output comma bug fixed, it was missing between objects in the generated array.
#' - sort by datetime and process creates *posixct* key to each object. If not NULL: *sort.by.decreasing.datetime*.
#' - duplicate rename process, see argument: *rename_duplicate_id*.
#' - input argument *emails* changed to more general *data*.
#' @section Changes in version 0.02.12:
#' - UTF-8 encoding
#' @section Changes in version 0.02.11:
#' - Initial release
#' @examples
#' emails <- list(
#'   date = "2024-02-11T09:30:00",
#'   sender = "john.doe@example.com",
#'   receiver = "jane.smith@example.com",
#'   subject = "Re: Follow-up",
#'   content = "Hi Jane,\n\nJust following up on our meeting yesterday.
#'    Let me know if you need anything.\n\nBest regards,\nJohn",
#'   notes = "",
#'   keywords = c("follow-up", "meeting", "thanks")
#' )
#' \dontrun{
#'  create_email_as_json(data = emails)
#' }
# .........................................................................
create_email_as_json <- function(data = NULL,
                                 sort.by.decreasing.datetime = FALSE,
                                 rename_duplicate_id = TRUE,
                                 addmainbrackets = TRUE,
                                 savejson = TRUE,
                                 file_path = NULL,
                                 catdata = FALSE,
                                 writewith = "file_conn",
                                 info = TRUE,
                                 debug_info = FALSE) {



  # ......................................
  t0 <- Sys.time()
  json_all <- ""
  # ......................................
  # Function to remove brackets if length is 1
  remove_brackets <- function(x) {
    if (length(x) == 1) {
      return(x[[1]])
    } else {
      return(x)
    }
  }
  # ......................................

  # ......................................
  if (addmainbrackets) {
    json_part <- "[\n"
    if (catdata) cat(json_part)
    json_all <- paste0(json_all, json_part)
  }
  # ......................................

  # ......................................
  # ORDER
  # ......................................
  if (!is.null(sort.by.decreasing.datetime)) {
    if (info) print(paste("sort by datetime, decreasing:", sort.by.decreasing.datetime))

    # Convert datetime strings to POSIXct
    data <- lapply(data, function(x) {
      x$posixct <- as.POSIXct(x$datetime, format = "%Y-%m-%d %H:%M")
      return(x)
    })

    # Arrange list by datetime
    data <- data[order(sapply(data, function(x) x$posixct), decreasing = sort.by.decreasing.datetime)]
  }
  # ......................................


  # ......................................
  # Check duplicate ID
  # ......................................
  if (rename_duplicate_id) {
    if (info) print("Duplicate id values are corrected as -vXX")
    # Function to correct duplicate ids
    correct_ids <- function(lst) {
      id_counts <- table(sapply(lst, function(x) x$id))
      for (id in names(id_counts)) {
        if (id_counts[id] > 1) {
          count <- 1
          for (i in seq_along(lst)) {
            if (lst[[i]]$id == id) {
              lst[[i]]$id <- paste0(id, sprintf("-v%02d", count))
              count <- count + 1
            }
          }
        }
      }
      return(lst)
    }

    # Corrected list
    data <- correct_ids(data)
  }
  # ......................................




  # ......................................
  # Loop all data
  # ......................................
  ii <- 0
  for (data_i in data) {
    # Trim leading and trailing whitespace
    ii <- ii + 1
    trimmed_string <- base::trimws(data_i$content)

    # Fix string to make it valid JSON field
    valid_json_string <- trimmed_string # jsonlite::toJSON(trimmed_string)

    # Print the original string, trimmed string, and valid JSON string
    if (debug_info) {
      if (catdata) cat("Trimmed String:", trimmed_string, "\n")
    }
    data_i$content <- valid_json_string

    # Convert the list to JSON format
    json_string <- jsonlite::toJSON(data_i, pretty = TRUE)

    # Apply function to each element of the JSON object
    json_string_no_brackets <- lapply(jsonlite::fromJSON(json_string), remove_brackets)

    # Convert back to JSON format
    json_string_final <- jsonlite::toJSON(json_string_no_brackets, auto_unbox = TRUE, pretty = TRUE)

    json_part <- json_string_final
    if (catdata) cat(json_part)
    json_all <- paste0(json_all, json_part)

    if (ii < length(data)) {
      json_part <- ",\n"
      if (catdata) cat(json_part)
      json_all <- paste0(json_all, json_part)
    }
  }
  # ......................................
  # <--- Loop
  # ......................................

  # ......................................
  if (addmainbrackets) {
    json_part <- "\n]\n"
    if (catdata) cat(json_part)
    json_all <- paste0(json_all, json_part)
  }
  # ......................................


  # ......................................
  # save:
  # ......................................
  if (savejson) {
    if (debug_info) print("SAVE")
    # Define the file path
    if (is.null(file_path)) {
      if (info) print("file_path is missing")
    } else {
      if (info) print(paste("Saved to:", file_path))
      # Save JSON to file
      if (writewith == "file_conn") {
        # Open the file with UTF-8 encoding
        file_conn <- file(file_path, "w", encoding = "UTF-8")

        # Write text to file
        writeLines(json_all, file_conn)

        # Close the file connection
        close(file_conn)
      } else {
        base::writeLines(json_all, file_path)
      }
    }
  }
  # ......................................
  t1 <- Sys.time()

  if (info) print(paste("create_email_as_json() ready:", round(difftime(t1, t0, units = "sec"),2), "seconds."))

}
# .........................................................................

# .........................................................................
