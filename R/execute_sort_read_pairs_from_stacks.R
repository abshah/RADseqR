#' Execute sort read pairs from stacks
#' @param stacks_output_files output files from stacks. default ="stacks/"
#' @param sample_files sample files directory. default="samples/"
#' @param whitelist_file which whitelist to use. default="whitelist.txt"
#' @param where to store the output files. default="paired/"
#' @export
#### Execute Sort Read Pairs from Stacks #####
execute_sort_read_pairs_from_stacks<-function(stacks_output_files="stacks/",sample_files="samples/",whitelist_file="whitelist.txt",output_files="paired/")
{
    if(dir.exists(output_files)==FALSE){dir.create(output_files)}
    sort_read_pairs<-Sys.which("sort_read_pairs.pl")
    system2(command=sort_read_pairs, args = c(" -p ", stacks_output_files," -s ",sample_files," -o ",output_files," -w ",whitelist_file))
    return(NULL)
}

