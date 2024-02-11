# .........................................................................
# datafunctions.R
# started 11.2.2024
# .........................................................................

# .........................................................................
#' Convert Email Data to JSON
#'
#' This function converts email data stored in a list to JSON format.
#'
#' @param emails A list containing email data.
#' @param addmainbrackets addmainbrackets
#' @param savejson savejson
#' @param file_path file_path
#' @param info info
#' @return A JSON string representing the email data without brackets around single elements.
#' @importFrom jsonlite toJSON fromJSON
#' @export
#' @rdname create_email_as_json
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
#'  create_email_as_json(emails)
#' }
# .........................................................................
create_email_as_json <- function(emails = NULL, addmainbrackets = TRUE, savejson = TRUE, file_path = NULL, info = FALSE) {

  json_all <- ""

  # Function to remove brackets if length is 1
  remove_brackets <- function(x) {
    if (length(x) == 1) {
      return(x[[1]])
    } else {
      return(x)
    }
  }

  if (addmainbrackets) {
    json_part <- "[\n"
    cat(json_part)
    json_all <- paste0(json_all, json_part)
  }

  for (email in emails) {
    # Trim leading and trailing whitespace
    trimmed_string <- trimws(email$content)

    # Fix string to make it valid JSON field
    valid_json_string <- trimmed_string # jsonlite::toJSON(trimmed_string)

    # Print the original string, trimmed string, and valid JSON string
    if (info) {
      cat("Trimmed String:", trimmed_string, "\n")
    }
    email$content <- valid_json_string

    # Convert the list to JSON format
    json_string <- jsonlite::toJSON(email, pretty = TRUE)

    # Apply function to each element of the JSON object
    json_string_no_brackets <- lapply(jsonlite::fromJSON(json_string), remove_brackets)

    # Convert back to JSON format
    json_string_final <- jsonlite::toJSON(json_string_no_brackets, auto_unbox = TRUE, pretty = TRUE)

    json_part <- json_string_final
    cat(json_part)
    json_all <- paste0(json_all, json_part)

    if (email$date != emails[[length(emails)]]$date) {
      json_part <- ",\n"
      cat(json_part)
      json_all <- paste0(json_all, json_part)
    }
  }
  if (addmainbrackets) {
    json_part <- "\n]\n"
    cat(json_part)
    json_all <- paste0(json_all, json_part)
  }
  if (savejson) {
    print("SAVE")
    # Define the file path
    if (is.null(file_path)) {
      print("file_path is missing")
    } else {
      print(paste("Saved to:", file_path))
      # Save JSON to file
      base::writeLines(json_all, file_path)
    }
  }
}
# .........................................................................
#' @rdname create_email_as_json
#' @section Changes in version 0.02.11:
#' - Initial release
# .........................................................................
