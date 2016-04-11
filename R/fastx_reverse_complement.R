#' FASTX Reverse Complement
#' @param fastq_infile name of fastq file as a character vector
#' @param fastq_outfile name of fasta file as a character vector
#' @return NULL
#' @export

######### function for FASTX Reverse Complement #########
fastx_reverse_complement<-function(fastq_infile,fastq_outfile)
{
    system(paste("fastx_reverse_complement "," -i ",fastq_infile," -o ",fastq_outfile,sep=""))
}

