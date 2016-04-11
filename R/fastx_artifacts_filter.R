#' FASTX Artifacts Filter
#' @param fastq_infile name of fastq file as a character vector
#' @param fastq_outfile name of fasta file as a character vector
#' @return NULL
#' @export

######### function for FASTX Artifacts Filter ##########
fastx_artifacts_filter<-function(fastq_infile,fastq_outfile)
{
    system(paste("fastx_artifacts_filter "," -i ",fastq_infile," -o ",fastq_outfile,sep=""))
    return(NULL)
}
