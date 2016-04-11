#' Remove PCR duplicates using bwa and Picard
#' @param idxbase name of bwa index
#' @param in1_fq left reads or 1 reads (of pair-end reads) fastq file
#' @param in2_fq right or 2 reads (of pair-end reads) fastq file
#' @param threads number of threads to run with (depends on server resources)
#' @param output_filename output filename (after removing PCR duplicates)
#' @return NULL
#' @export
### Remove PCR duplicates using SAMtools and Picard ###

map_with_bwa_and_remove_PCR_duplicates<-function(idxbase, in1_fq,in2_fq, threads, output_filename)
{
    bwa<-Sys.which("bwa")
    samtools<-which("samtools")
    system(command = paste(bwa," index ",idxbase, sep=""))
    if(is.na(in2_fq)){

        system(paste("bwa mem ",idxbase," ",in1_fq," "," -t ",threads, " | samtools view -S -b - | samtools sort sorted_",output_filename," - ",sep=""), intern=TRUE)}else{

            system(paste("bwa mem ",idxbase," ",in1_fq," ",in2_fq," -t ",threads, " | samtools view -S -b - | samtools sort sorted_",output_filename," - ",sep=""), intern=TRUE)
        }

    system(paste("java -Xmx4g -jar /home/abhijeet/bin/picard.jar MarkDuplicates INPUT=sorted_",output_filename," OUTPUT=dedup_",output_filename,"METRICS_FILE=dups_",output_filename," VALIDATION_STRINGENCY=LENIENT REMOVE_DUPLICATES=TRUE TMP_DIR=/tmp"), intern=TRUE)
return(NULL)
}
