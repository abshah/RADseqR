#' FASTX Trimmer
#' @param fastq_infile name of fastq file as a character vector
#' @param fastq_outfile name of fasta file as a character vector
#' @param first_base which first base to keep
#' @param last_base which last base to keep
#' @return NULL
#' @export

######### function for FASTX Trimmer ########
fastx_trimmer<-function(first_base,last_base,fastq_infile,fastq_outfile)
{
    system(paste("fastx_trimmer "," -i ",fastq_infile," -o ",fastq_outfile," -f ",first_base," -l ",last_base,sep=""))
    return(NULL)
}
