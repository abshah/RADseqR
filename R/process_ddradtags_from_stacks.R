##### Execute process_ddradtags pipeline from Stacks ######
#' Process radtags with Stacks
#' @param path_to_input_files Absolute path to input files (as a character)
#' @param barcode_file File name of a plain text file with all barcodes for samples (as a character)
#' @param output_dir Absolute path for output files (as a character)
#' @param enzyme1 1st Restriction enzyme used for the assay (as a character)
#' @param enzyme2 2nd Restriction enzyme used for the assay (as a character)
#' @return NULL
#' @export
####### process_radtags_from_stacks(path_to_input_files = "/home/abhijeet/my_radseq_files",barcode_file = "barcodes",enzyme = "ecoRI",phred_value = "phred33")

process_ddradtags_from_stacks<-function(path_to_input_files, barcode_file, output_dir,enzyme1,enzyme2,phred_value)
{

    system2(command="/usr/local/bin/process_radtags", args =c( " -1 ",path_to_input_files[1]," -2 ",path_to_input_files[2], " -o ",output_dir," -c ",
                                                               " --renz_1 ", enzyme1," --renz_2 ",enzyme2, " -b ",barcode_file," -q "," -E ",phred_value ))

    return(NULL)
}
