#' call SNPs with GATK Haplotyper
#' @param ref_fasta reference genome or contigs (in fasta format)
#' @param bam_with_rg BAM input file with full headers
#' @param output_vcf specify the output file (in VCF format)
#' @param java_mem set memory usage for SNP calling using GATK
#' @param Threads number of threads to run (depends on server resources)
#' @export
######## Call SNPs with the GATK Haplotyper caller ##########
call_SNPs_with_GATK_haplotyper<-function(merged_bam_filename,ref_fasta,output_VCF_filename,Threads)
{
    java_location<-Sys.which("java")
    GATK<-Sys.which("GenomeAnalysisTK.jar")
    samtools<-Sys.which("samtools")
    if ((java_location)==""){cat("\n ########## Warning! Java not located in system path ########### \n")}
    if ((GATK)=="") {cat("\n ########### Warning! GATK not located in system path ###########\n")}
    if(length(list.files(pattern = paste(merged_bam_filename,".bai",sep="")))==0){system2(command = samtools, args = c(" index ",merged_bam_filename))}
    system2(command = java_location, args = c(paste0("-Xmx16g -jar ",GATK," -T HaplotypeCaller  -hets 0.01 -R ",ref_fasta," -I ",merged_bam_filename," -o ",output_VCF_filename)))
    #system(paste("java -Xmx16g -jar /usr/local/bin/GenomeAnalysisTK.jar -T HaplotypeCaller  -hets 0.01 -R ",ref_fasta," -I ",merged_bam_filename," -o ",output_VCF_filename,""))


    return(NULL)
}
