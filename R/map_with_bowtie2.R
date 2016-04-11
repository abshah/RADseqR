#' Map reads with Bowtie2
#' @param ref_fasta reference genome or contigs in fasta format
#' @param idx_name index name for alignment
#' @param fastq_1 left or 1 reads
#' @param fastq_2 left or 2 reads (for pair-end reads only)
#' @param Threads number of concurrent threads to run with (depends on server resources)
#' @param sam_outfile resulting filename (in SAM format)
#' @param rg_id sample id name
#' @param rg_lb sample library name
#' @param rg_sm sample pool name
#' @param rg_pl Platform/technology used to produce reads. Valid values: "CAPILLARY", "LS454", "ILLUMINA", "SOILD","HELICOS","IONTORRENT","ONT","PACBIO"
#' @return NULL
#' @export

### Execute Bowtie2 ####
map_with_bowtie2 <- function(ref_fasta,idx_name,fastq_1,fastq_2,Threads,sam_outfile,rg_id,rg_lb,rg_sm,rg_pl)
{
    bowtie2<-Sys.which("bowtie2")
    bowtie2-build<-Sys.which("bowtie2-build")
        if(length(list.files(path = "./", pattern = idx_name))==0){system2(command = paste(bowtie2-build),args = c(ref_fasta, idx_name))}

    if (is.na(fastq_2))
    {system2(command = bowtie2, args = c(" -x ",idx_name," -U ",fastq_1," -S ",sam_outfile, " -p ", Threads, "--rg-id",rg_id,"--rg LB:",rg_lb," --rg SM:",rg_sm," --rg PL:",rg_pl))
        } else{
        system(command = paste("/home/abhijeet/bin/bowtie2"," -x ",idx_name," -1 ",fastq_1," -2 ",fastq_2," -S ",sam_outfile, " -p ", Threads, " --rg-id ",rg_id," --rg LB:",rg_lb," --rg SM:",rg_sm," --rg PL:",rg_pl,sep=""))


            #system2(command = "/home/abhijeet/bin/bowtie2",args = c(" -x ",idx_name," -1 ",fastq_1," -2 ",fastq_2," -S ",sam_outfile, " -p ", Threads, "--rg-id",rg_id," --rg LB:",rg_lb," --rg SM:",rg_sm," --rg PL:",rg_pl))

            }

    return(NULL)
}
