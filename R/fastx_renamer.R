#' fastx renamer
#' @param fastq_infile name of fastq file as a character vector
#' @param fastq_outfile name of fasta file as a character vector
#' @param n_type possible values are SEQ and COUNT
#' @return NULL
#' @export
######### function for FASTX Renamer ########
fastx_renamer<-function(fastq_infile,fastq_outfile,n_type)
{
    system(paste("fastx_renamer "," -i ",fastq_infile," -o ",fastq_outfile," -n ",n_type,sep=""))
    return(NULL)
}
