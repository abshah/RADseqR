#' Get whitelist from haplotype list
#' @param haplotype_file filename of your haplotypes file. Usually found in your Stacks folder.
#' @param number_of_Mismatches maximum number of mismatches
#' @export

###### Get whitelist from haplotype list ####
get_whitelist_from_haplotype_list<-function(haplotypes_file, whitelist_file)
{
    system2(command="cut", args=c(" -f 1 ",haplotypes_file," > ",whitelist_file))
    return(NULL)
}
