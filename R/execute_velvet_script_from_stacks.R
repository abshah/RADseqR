#' Execute Velvet from Stacks
#' @param sort_read_pairs_output output from sort_read_pairs from stacks. default = "paired/"
#' @param output_dir output directory. default = "assembled/"
#' @param min_contig_size miniumum size of contigs. Note: this is sensitive to sample read size. default = "100"
#' @return NULL
#' @export
### Execute Velvet script from Stacks #####
execute_velvet_script_from_stacks<-function(sort_read_pairs_output="paired/",output_dir="assembled/",min_contig_size="100")
{
    exec_velvet<-Sys.which("exec_velvet.pl")
    velvet<-Sys.which("velveth")
    velvet_location<-as.character(gsub(pattern = "/velveth", x = velvet, replacement = ""))
   if(dir.exists(output_dir)==FALSE){dir.create(output_dir)}
    system2(command="exec_velvet.pl", args=c(" -s ",sort_read_pairs_output," -o ",output_dir,
                                             " -c ", " -e ",velvet_location," -M ", min_contig_size, " -R "), stdout=NULL)
    return(NULL)
}
