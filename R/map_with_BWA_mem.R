#' Map reads with BWA
#' @param ref_fasta reference genome or contigs
#' @param fastq_1 left reads or 1 reads of sample (pair-end reads) to map
#' @param fastq_2 right reads or 2 reads of sample (pair-end reads) to map
#' @return NULL
#' @export
map_with_bwa_mem<-function(ref_fasta,fastq_1,fastq_2, Threads, output_file)
{
 #   system2(command="bwa",args=c(" index ",ref_fasta))
    #  if(length(Threads==0))
    system2(command="bwa", args=c(" mem "," -t ",Threads,ref_fasta,fastq_1,fastq_2, " > ",output_file))
    return(cat("\n###########BWA run with the following paramters############\n ref_fasta: ",ref_fasta,"\n fastq_1: ",fastq_1,"\n fastq_2: ",fastq_2))
return(NULL)
}
