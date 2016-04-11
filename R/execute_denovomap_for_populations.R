#' Execute DeNovomap pipeline from Stacks for populations
#' @param min_stack_depth minimum depth of all stacks
#' @param number_of_Mismatches maximum number of mismatches
#' @param Threads maximum number of simulataneous operations on server
#' @param batch_id batch name of run
#' @param output_files name of output directory as a character vector
#' @param parent_files name of directory with parent files
#' @param population_map full path and filename of the population map file
#' @param extra_params extra parameters to be passed on individual Stacks components (e.g ustacks, sstacks, populations)
#' @return DONE
#' @export

execute_denovomap_from_stacks_for_populations<-function(min_stack_depth,number_of_Mismatches,Threads,batch_id,output_files,pop_files, population_map, extra_params=NULL)
{

    settings <- c("-m ",min_stack_depth," -M ",number_of_Mismatches," -T ",Threads, " -S -b ",batch_id, " -O ", population_map,
                  " -t -o ",output_files, paste(" -s ",pop_files,sep=""), extra_params )


    denovo_map_path<-Sys.which("denovo_map.pl")
    system2(command="/usr/local/bin/denovo_map.pl", args = settings )
    cat("\n#########################################################\n################# Parsing log files !!!!! ###############\n#########################################################\n")
    parse_DM_log_file(paste(output_files,"/denovo_map.log"))
    return(cat("\n#####Done#####\n"))
}
