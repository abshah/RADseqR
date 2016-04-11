#' Remove PCR duplicates using Picard-tools
#' @param
#' @return
#' @export
#'
##### Remove PCR duplicates using Picard-tools
remove_PCR_duplicates<-function(sam_filename)
{
  #  if(length(grep(x=list.dirs(path = "."), pattern = "/temp"))<1){system("mkdir temp")}else{

    picard<-Sys.which("picard.jar")
    samtools<-Sys.which("samtools")

    if(picard==""){cat("\n ###### Picardtools not found in path ######")}
    if(samtools==""){cat("\n ###### samtools not found in path ######")}


        system(command = paste("samtools view -bS ", sam_filename, " | samtools sort - ",sam_filename,"_sorted", sep=""))

        sam_filename<-gsub(x=sam_filename, pattern = ".sam$", replacement = ".sam_sorted.bam")

            if(dir.exists("temp")==FALSE){dir.create("temp")}
    if(dir.exists("temp")==TRUE){system(command = paste("java -Xmx2g -jar /home/abhijeet/bin/picard.jar MarkDuplicates INPUT=",sam_filename," OUTPUT=dedup_",sam_filename, " METRICS_FILE=dup_metrics_",sam_filename," VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=250 TMP_DIR=./temp ", sep=""))}



return(NULL)}

