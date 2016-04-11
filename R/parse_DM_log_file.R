######## Parse denovo map log file ##########
parse_DM_log_file<-function(log_file)
{
    ###### read file into R #########
    raw_lines<-readLines(log_file)

    sample_names<-unlist(strsplit(unlist(strsplit(raw_lines[grep(pattern = "Identifying unique stacks;", x = raw_lines,value = FALSE)], split=" ")), split=" "))[seq(8,length(unlist(strsplit(unlist(strsplit(raw_lines[grep(pattern = "Identifying unique stacks;", x = raw_lines,value = FALSE)], split=" ")), split=" "))),8)]

    #### Coverage Stats #####
    Mean_coverage_depth<-unlist(strsplit(raw_lines[grep(pattern = "Mean coverage depth",x = raw_lines,value = FALSE)], split="\b"))
    Mean_merged_coverage_depth<-unlist(strsplit(raw_lines[grep(pattern = "Mean merged coverage depth",x = raw_lines,value = FALSE)], split="\t"))

    Mean_coverage_depth_mean<-as.numeric(gsub(unlist(strsplit(Mean_coverage_depth, split = " "))[seq(7,length(unlist(strsplit(Mean_coverage_depth, split = " "))),12)], pattern = ";", replacement = ""))
    Mean_coverage_depth_SD<-as.numeric(unlist(strsplit(Mean_coverage_depth, split = " "))[seq(10,length(unlist(strsplit(Mean_coverage_depth, split = " "))),12)])
    Mean_coverage_depth_Max<-as.numeric(unlist(strsplit(Mean_coverage_depth, split = " "))[seq(12,length(unlist(strsplit(Mean_coverage_depth, split = " "))),12)])

    Mean_merged_coverage_depth_mean<-as.numeric(gsub(unlist(strsplit(Mean_merged_coverage_depth, split = " "))[seq(8,length(unlist(strsplit(Mean_merged_coverage_depth, split = " "))),13)], pattern = ";", replacement = ""))
    Mean_merged_coverage_depth_SD<-as.numeric(gsub((unlist(strsplit(Mean_merged_coverage_depth, split = " "))[seq(11,length(unlist(strsplit(Mean_merged_coverage_depth, split = " "))),13)]), pattern = ";", replacement = ""))
    Mean_merged_coverage_depth_Max<-as.numeric(unlist(strsplit(Mean_merged_coverage_depth, split = " "))[seq(13,length(unlist(strsplit(Mean_merged_coverage_depth, split = " "))),13)])


    ###### Number of reads utilized per sample ######
    Number_of_reads_utilized_per_sample<-as.numeric((unlist(strsplit(raw_lines[grep(pattern = "Number of utilized reads: ",x = raw_lines,value = FALSE)], split=" ")))[seq(5,length(unlist(strsplit(raw_lines[grep(pattern = "Number of utilized reads: ",x = raw_lines,value = FALSE)], split=" "))),5)])


    ##### Create plots for coverage per sample, and reads utilized #####
    all_parsed_data<-data.frame(Mean_merged_coverage_depth_mean,Mean_merged_coverage_depth_SD,Mean_merged_coverage_depth_Max, Mean_coverage_depth_mean,Mean_coverage_depth_SD,Mean_coverage_depth_Max,Number_of_reads_utilized_per_sample)
    names(all_parsed_data)<-c("merged_coverage_mean","merged_coverage_SD","merged_coverage_Max","coverage_mean","coverage_SD","coverage_Max","reads_utilized_per_sample")

    pdf(paste(log_file,".pdf",sep=""), height = 10, width = 14 )
    par(mfrow=c(1,2), xaxs="i",yaxs="i")
    par(mfg=c(1,1))

    barplot(as.matrix(all_parsed_data[,c(1,4)]), beside = TRUE, xlab = "Coverage", ylab="Samples", main = "Coverage before and after merging", names.arg = rep(sample_names,2), las=2)

    par(mfg=c(1,2))
    barplot(all_parsed_data[,7], names.arg = sample_names, las=2, ylab = "Number of reads utilized", main = "Number of reads utilized per sample")


    dev.off()


    return(all_parsed_data)
}
