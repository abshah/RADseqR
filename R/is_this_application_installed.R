#' Is this application installed on this system ?
#' @param the_command application name
#' @return returns OK or NOT FOUND!
#' @export
##### Are all packages installed ? #####
is_the_application_installed <- function(the_command)
{
    state <- system(paste("which ",the_command,sep = ""), intern = TRUE, ignore.stderr = TRUE)
    if (length(state) == 0 ) { return(paste(the_command," NOT FOUND!",sep = ""))}
    return(paste(the_command," OK",sep = ""))
}
