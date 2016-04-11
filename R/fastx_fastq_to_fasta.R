#' fastq to fasta
#' @param fastq_infile file name of fastq input file as a character vector
#' @param fasta_outfile file name of fasta output file as a character vector
#' @return NULL
#' @export
####function for fastq_to_fasta#####
fastq_to_fasta<-function(fastq_infile,fasta_outfile)
{
    system(paste("fastq_to_fasta "," -i ",fastq_infile," -o ",fasta_outfile, sep=""))
    return(NULL)
}

