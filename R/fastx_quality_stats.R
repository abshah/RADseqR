#' fastx quality report
#' @param fastq_infile name of fastq file as a character vector
#' @param fasta_outfile name of fasta file as a character vector
#' @return NULL
#' @export
######### function for fastx_quality_stats ######
fastx_quality_stats<-function(fastq_infile,text_outfile)
{
    system(paste("fastx_quality_stats "," -i ",fastq_infile," -o ",text_outfile, sep=""))
    return(NULL)
}
