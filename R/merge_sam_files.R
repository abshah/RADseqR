#' Merge SAM/BAM files
#' @param a list or vector of SAM/BAM file names
#' @return NULL
###### Merge SAM/BAM files #########
merge_SAM_files<-function(bam_filenames,output_filename)
{
    write.table(bam_filenames, file=paste("temp_bam_list.txt", sep=""), col.names = FALSE, row.names = FALSE, quote = FALSE, append = FALSE)

    system2(command = "/usr/local/bin/samtools", args = c(" merge -f -b temp_bam_list.txt ",output_filename))
#    unlink("temp_bam_list.txt")
    return(NULL)}
