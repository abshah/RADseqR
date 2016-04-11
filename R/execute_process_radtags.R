##### Execute process_radtags pipeline from Stacks ######
#' Process radtags with Stacks
#' @param path_to_input_files Absolute path to input files (default="./raw")
#' @param barcode_file File name of a plain text file with all barcodes for samples (default = "barcodes.txt")
#' @param output_dir Absolute path for output files (default="samples")
#' @param enzyme Restriction enzyme used for the assay (default="ecoRI")
#' @return Process RADseq tags using the process_radtags pipeline from Stacks

#' @export
####### process_radtags_from_stacks(path_to_input_files = "/home/abhijeet/my_radseq_files",barcode_file = "barcodes",enzyme = "ecoRI",phred_value = "phred33")

process_radtags_from_stacks<-function(path_to_input_files="./raw", barcode_file="barcodes.txt", rescue_barcodes=TRUE, barcode_options="--inline_null", output_dir="samples",enzyme="ecoRI",phred_value="phred33")
{
    if(rescue_barcodes==TRUE){rescue_barcodes<-" -r "} else {rescue_barcodes<-" "}
    if(dir.exists(output_dir)==FALSE){dir.create("")
        process_radtags<-Sys.which("process_radtags")
        system2(command=process_radtags, args =c( " -1 ",path_to_input_files[1]," -2 ",path_to_input_files[2], " -o ",output_dir," -c ",
                                                  " -e ", enzyme, " -b ",barcode_file," -q ",rescue_barcodes," -E ",phred_value, barcode_options ))

    }else{cat("\n ### Input files not found ### \n")}

    return(NULL)
}
