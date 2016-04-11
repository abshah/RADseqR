#' Execute DeNovomap pipeline from Stacks
#' @param file_name name of the haplotypes file
#' @param file name of the output
#' @return NULL
#' @export
######## Function to filter Haplotypes File from a super_parent run ######
apply_filter_to_stacks_haplotypes_for_whitelist<-function(file_name="batch1_haplotypes.tsv",whitelist_output="batch1_haplotypes_whitelist.txt")
{
######## Filter Haplotypes File #######
test_data<-read.table(file_name,sep="\t", header = TRUE, comment.char = "")
####### Drop loci which do not occur in the superparent #########
test_data<-test_data[-(which(as.character(test_data[,4])=="-")),]
####### Drop loci which occur in less than 2 individuals ########
#### First count the number of "-" in every row ####
dash_counts_per_locus<-rowSums(test_data[,-(1:3)]=="-")
#### Drop the loci which occur in ####
target_count<-(dim(test_data)[2]-6)
test_data<-test_data[which(dash_counts_per_locus<target_count),]
write.table(test_data$X..Catalog.ID, file=whitelist_output, col.names = FALSE, row.names = FALSE, quote = FALSE)
return(NULL)}

