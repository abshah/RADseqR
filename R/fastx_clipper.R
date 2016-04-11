#' fastx clipper
#' @param fastq_infile name of fastq file as a character vector
#' @param fastq_outfile name of fasta file as a character vector
#' @param adapter of sample as a character
#' @return NULL
#' @export
######### function for FASTX Clipper ########
fastx_clipper<-function(adapter, fastq_infile, fastq_outfile)
{
    system(paste("fastx_clipper -a ", adapter," -i ",fastq_infile," -o ",fastq_outfile, sep=""))
    return(NULL)
}
