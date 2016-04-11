#' Function to read VCF table and apply PNAS 2014 SNP filters
#' @param VCF_table file VCF exported as a table using GATK's Variant to table command
#' @return VCF_table as a data.frame
#' @export
read_VCF_table_and_apply_PNAS_2014_SNP_filters<-function(VCF_table_file)
{

    results<-(read.table(file=VCF_table_file, header = TRUE, stringsAsFactors = FALSE))

    GQ_cols<-grep(pattern = ".GQ$", x=names(results))
    DP_cols<-grep(pattern = "[0-9].DP$", x=names(results))
    GT_cols<-grep(pattern = ".GT$", x=names(results))

    #### Filter out contigs with more than 1 SNP #####
    contigs_with_1_SNP<-names((table(results$CHROM)))[as.vector((table(results$CHROM)==1))]
    results_contigs_with_1_SNP<-results[charmatch(x=contigs_with_1_SNP, table = results$CHROM, nomatch = NA),]

    ##### ALT==1 filter ####
    results_contigs_with_1_SNP_and_only_1_ALT<-results_contigs_with_1_SNP[which(nchar(results_contigs_with_1_SNP$ALT)==1),]
    which_SNPs_to_filter_per_coverage<-(as.vector(results_contigs_with_1_SNP_and_only_1_ALT[,DP_cols]<2 | results_contigs_with_1_SNP_and_only_1_ALT[,DP_cols] == 2))

    ##### Replace all NAs with FALSE ####
    which_SNPs_to_filter_per_coverage[is.na(which_SNPs_to_filter_per_coverage)]<-FALSE
    Genotypes_vector<-as.vector(unlist(c(results_contigs_with_1_SNP_and_only_1_ALT[,GT_cols])))
    ###### if coverage of sample snp is less than or equal to 2, replace with NA ######
    Genotypes_vector[which_SNPs_to_filter_per_coverage]<-NA
    results_contigs_with_1_SNP_and_only_1_ALT[,GT_cols]<-Genotypes_vector
return(results_contigs_with_1_SNP_and_only_1_ALT)
}

#f_values_from_2014_paper<-temp1[charmatch(table=temp1$hel_ID, x = names_of_samples, nomatch = NA),4]
#RAD_het_from_2014_paper<-temp1[charmatch(table=temp1$hel_ID, x = names_of_samples, nomatch = NA),5]

