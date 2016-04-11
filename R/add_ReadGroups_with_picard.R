#' Add Read Groups to SAM files using Picard tools
#' @param input_BAM specify the input BAM file
#' @param output_BAM specify the output BAM file
#' @param read_group_lib set the read group library value with a character
#' @param read_group_platform set the read group platform value with a character
#' @param read_group_barcode set the read group barcode value with a character
#' @param read_group_sample set the read group sample value with a character
#' @return NULL
#' @export

### Add Read Groups to SAM files using Picard ####
add_ReadGroups_with_picard<-function(input_BAM,output_BAM,read_group_lib,read_group_platform,read_group_barcode,read_group_sample)
{

    java_location<-Sys.which("java")
    picard<-Sys.which("picard.jar")
    if ((java_location)==""){cat("\n ########## Warning! Java not located on system ########### \n")}
    if ((picard)=="") {cat("\n ########### Warning! PicardTools not located on system ###########\n")}
    system2(command=(paste(java_location,sep="")), args=paste("-Xmx4g -jar ",picard, " AddOrReplaceReadGroups INPUT=",input_BAM," OUTPUT=", output_BAM," RGLB=",read_group_lib," RGPL=",read_group_platform," RGPU=",read_group_barcode," RGSM=",read_group_sample, sep = "") )

    return(NULL)
}
