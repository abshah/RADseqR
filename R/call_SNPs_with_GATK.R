#' call SNPs with GATK
#' @param ref_fasta reference genome or contigs (in fasta format)
#' @param bam_with_rg BAM input file with full headers
#' @param output_vcf specify the output file (in VCF format)
#' @param java_mem set memory usage for SNP calling using GATK
#' @param Threads
#' @return NULL
#' @export
######## SNP Calling with GATK (UnifiedGenotyper) ###########
call_SNPs_with_GATK<-function(ref_fasta="reference.fasta", bam_with_rg="samples_with_rg.bam", Threads=2, output_vcf="output.vcf", java_mem="2")
{
    ####### Check if the programs are installed and in the system PATH ##########
    samtools<-Sys.which("samtools")
    java_location<-Sys.which("java")
    picard<-Sys.which("picard.jar")
    GATK<-Sys.which("GenomeAnalysisTK.jar")
    if ((java_location)==""){cat("\n ########## Warning! Java not located on system ########### \n")}
    if ((samtools)==""){cat("\n ########## Warning! samtools not located on system ########### \n")}
    if ((picard)=="") {cat("\n ########### Warning! PicardTools not located on system ###########\n")}
    if ((GATK)=="") {cat("\n ########### Warning! GATK not located on system ###########\n")}

    #system(command = paste("samtools sort -O 'bam' -T temp1 ",bam_with_rg, " -o sorted_",bam_with_rg,sep=""))
    system2(command = paste(samtools,sep=""), args = paste("sort -O 'bam' -T temp1 ",bam_with_rg, " -o sorted_",bam_with_rg,sep=""))
    system2(command=paste(java_location,sep=""), args = c("-jar -Xmx4g  BuildBamIndex I=",paste("sorted_",bam_with_rg,sep=""),"O=",paste("idx_",bam_with_rg,sep="")))
    ####### Create FASTA index with samtools #########
    #system2(command="samtools",args=c("faidx",ref_fasta))
    system2(command=paste0(samtools), args =c("faidx",ref_fasta) )
    ####### Call SNPs with GATK Unified Genotyper ##########
    #system2(command="java", args=c("-jar ",paste("-Xmx",java_mem,"g",sep="")," /usr/local/bin/GenomeAnalysisTK.jar --fix_misencoded_quality_scores -T UnifiedGenotyper","-R ",ref_fasta,"-I ",paste("sorted_",bam_with_rg,sep=""),"-o",output_vcf,"--num_threads",Threads,"--num_cpu_threads_per_data_thread 4"))
    system2(command = java_location, args = c(paste(" -jar -Xmx ",java_mem,"g ",GATK," --fix_misencoded_quality_scores -T UnifiedGenotyper","-R ",ref_fasta,"-I ",paste("sorted_",bam_with_rg,sep=""),"-o",output_vcf,"--num_threads",Threads,"--num_cpu_threads_per_data_thread 4", sep="")))
    return(NULL)
}

