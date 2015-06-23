##### Execute process_radtags pipeline from Stacks ######
#' Process radtags with Stacks
#' @param path_to_input_files Absolute path to input files (as a character class)
#' @param barcode_file File name of a plain text file with all barcodes for samples (as a character class)
#' @param output_dir Absolute path for output files (as a character class)
#' @param enzyme Restriction enzyme used for the assay (as a character class)
#' @return Process RADseq tags using the process_radtags pipeline from Stacks
#' @export
####### process_radtags_from_stacks(path_to_input_files = "/home/abhijeet/my_radseq_files",barcode_file = "barcodes",enzyme = "ecoRI",phred_value = "phred33")

process_radtags_from_stacks<-function(path_to_input_files, barcode_file, output_dir,enzyme,phred_value)
{

    system2(command="/usr/local/bin/process_radtags", args =c( " -1 ",path_to_input_files[1]," -2 ",path_to_input_files[2], " -o ",output_dir," -c ",
                                                               " -e ", enzyme, " -b ",barcode_file," -q "," -E ",phred_value ))
    return(NULL)
}
