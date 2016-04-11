#' Function to convert Genotype data in SNP data for InbreedR
#' @param SNPtable_dataset is a typical table exported from VCF using GATK with genotype data
#' @return a matrix with 0 and 1 representing heterozygosity.
#' @export
convert_table_to_SNP_data<-function(SNPtable_dataset)
{

    genotype_key<-c("T/T","G/G","A/A","C/C",  # assign 0
                    "A/C","C/A","G/A","A/G","G/C","C/G", # assign 1
                    "T/C","C/T","T/G","G/T","A/T","T/A", # assign 1
                    "G/.","./G","T/.","./T","A/.","./A","./C","C/.","./.") # assign NA

        genotype_data<-SNPtable_dataset[, grep(x = names(SNPtable_dataset), pattern = ".GT$")]
        all_loci<-(unlist(c(genotype_data)))
        all_loci_genotype<-(charmatch(x=all_loci, table=genotype_key, nomatch = NA))

        all_loci_genotype[which(all_loci_genotype==1)]<-0
        all_loci_genotype[which(all_loci_genotype==2)]<-0
        all_loci_genotype[which(all_loci_genotype==3)]<-0
        all_loci_genotype[which(all_loci_genotype==4)]<-0

        all_loci_genotype[which(all_loci_genotype==5)]<-1
        all_loci_genotype[which(all_loci_genotype==6)]<-1
        all_loci_genotype[which(all_loci_genotype==7)]<-1
        all_loci_genotype[which(all_loci_genotype==8)]<-1
        all_loci_genotype[which(all_loci_genotype==9)]<-1
        all_loci_genotype[which(all_loci_genotype==10)]<-1

        all_loci_genotype[which(all_loci_genotype==11)]<-1
        all_loci_genotype[which(all_loci_genotype==12)]<-1
        all_loci_genotype[which(all_loci_genotype==13)]<-1
        all_loci_genotype[which(all_loci_genotype==14)]<-1
        all_loci_genotype[which(all_loci_genotype==15)]<-1
        all_loci_genotype[which(all_loci_genotype==16)]<-1

        all_loci_genotype[which(all_loci_genotype==17)]<-NA
        all_loci_genotype[which(all_loci_genotype==18)]<-NA
        all_loci_genotype[which(all_loci_genotype==19)]<-NA
        all_loci_genotype[which(all_loci_genotype==20)]<-NA
        all_loci_genotype[which(all_loci_genotype==21)]<-NA
        all_loci_genotype[which(all_loci_genotype==22)]<-NA
        all_loci_genotype[which(all_loci_genotype==23)]<-NA
        all_loci_genotype[which(all_loci_genotype==24)]<-NA
        all_loci_genotype[which(all_loci_genotype==25)]<-NA

                genotype_matrix<-matrix(data=all_loci_genotype, nrow = dim(genotype_data)[1], ncol = dim(genotype_data)[2], byrow = FALSE )
        return(t(genotype_matrix))
}

