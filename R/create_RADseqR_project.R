#' create RADseqR project
#' @param path to directory for creating a RADseqR project
#' @param project_prefix prefix name for this RADseqR project
#' @return directories created for the project. It follows the general format of assembled, paired, samples and stacks.
#' @export
###### Create required directories to store, input, intermediate files and output #####

create_RADseqR_project <- function(this_directory, project_prefix)
{

    default_dirs<-c("assembled","paired","raw","samples","stacks","snp_calling")
    which_dirs<-dir.exists(default_dirs)
    dir.create(default_dirs[which(which_dirs==FALSE)])


    return(cat("created ",as.character(default_dirs[dir.exists(default_dirs)])," directories !", sep=""))
}

