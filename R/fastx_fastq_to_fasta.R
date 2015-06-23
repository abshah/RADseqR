#' fastq to fasta
#' @export
####function for fastq_to_fasta#####
fastq_to_fasta<-function(fastq_infile,fasta_outfile)
{
    system(paste("fastq_to_fasta "," -i ",fastq_infile," -o ",fasta_outfile, sep=""))
    return(NULL)}

