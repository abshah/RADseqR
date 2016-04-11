#' Execute DeNovomap pipeline from Stacks
#' @param min_stack_depth minimum depth of all stacks, (default=3)
#' @param number_of_Mismatches maximum number of mismatches (default=2)
#' @param Threads (default=16)
#' @param batch_id batch name of run (default=1)
#' @param output_files name of output directory as a character vector (default="stacks")
#' @param parent_files name of directory with parent files (default="samples")
#' @return DONE
#' @export
###### Execute Denovomap from Stacks ######
execute_denovomap_from_stacks <- function(min_stack_depth=3,number_of_Mismatches=2,Threads=16,batch_id=1,output_files="stacks",parent_files="samples")
{

    denovomap<-Sys.which("denovo_map.pl")
    if ((denovomap)=="") {cat("\n ########### Warning! denovo_map,pl not located in system path ###########\n")}

    settings <- c("-m ",min_stack_depth," -M ",number_of_Mismatches," -T ",Threads, " -S -b ",batch_id,
                  " -t -o ",output_files, paste(" -p ",parent_files,sep="") )


    system2(command=denovomap, args = settings )
    ##### Add log file parser ######
    parse_DM_log_file(paste(output_files,"/","denovo_map.log",sep=""))
    return(cat("\n#####Done#####\n"))
}

