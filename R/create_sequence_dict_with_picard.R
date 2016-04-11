##### Use Picard to Create Fasta Dictionary #####
#' Create Fasta Dictionary
#' @param ref_fasta reference fasta or genome (default="reference.fasta")
#' @return "Created Sequence Dictionary using PicardTools!"
#' @export
create_sequence_dict_with_picard<-function(ref_fasta="reference.fasta")
{
    system2(command="java", args=c("-jar","-Xmx4g","/home/abhijeet/bin/picard.jar CreateSequenceDictionary","R=",ref_fasta,"O=",gsub(pattern=".fa", replacement = ".dict",x=ref_fasta)))

    return(cat("\n Created Sequence Dictionary using PicardTools! \n"))
}

