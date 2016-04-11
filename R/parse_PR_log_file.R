##### Helper function for parsing process_radtags.log file ########
parse_PR_log_file<-function(log_file)
{
    ###### read file into R #########
    raw_lines<-readLines(log_file)


    #### First Major Stats #####
    major_stats_header<-unlist(strsplit(raw_lines[grep(pattern = "^File",x = raw_lines,value = FALSE)], split="\t"))
    major_stats<-unlist(strsplit(raw_lines[grep(pattern = "^File",x = raw_lines,value = FALSE)+1], split="\t"))

    #### Total seq stats ####

    total_seqs<-as.integer(unlist(strsplit(raw_lines[grep(pattern = "^Total Sequences",x = raw_lines,value = FALSE)], split="\t"))[2])

    ambiguous_barcodes<-as.integer(unlist(strsplit(raw_lines[grep(pattern = "^Ambiguous Barcodes",x = raw_lines,value = FALSE)], split="\t"))[2])

    ambiguous_radtags<-as.integer(unlist(strsplit(raw_lines[grep(pattern = "^Ambiguous RAD-Tag",x = raw_lines,value = FALSE)], split="\t"))[2])

    retained_reads<-as.integer(unlist(strsplit(raw_lines[grep(pattern = "^Retained Reads",x = raw_lines,value = FALSE)], split="\t"))[2])

    where_does_the_Barcode_RADtag_table_start<-grep(pattern = "^Barcode\tTotal\tNo RadTag\tLow Quality\tRetained", x=raw_lines, value = FALSE)+1
    where_does_the_Barcode_RADtag_table_end<-grep(pattern = "^Sequences not recorded", x=raw_lines, value = FALSE)-2
    barcodes_table_header<-c("Barcode","Total","No_RADtag","Low_Quality_reads","Retained_reads")
    barcodes_table<-matrix(data=unlist(strsplit(raw_lines[c(where_does_the_Barcode_RADtag_table_start:where_does_the_Barcode_RADtag_table_end)], split = "\t")), nrow=(where_does_the_Barcode_RADtag_table_end-where_does_the_Barcode_RADtag_table_start)+1, ncol=5, byrow = TRUE)
    sequences_not_recorded_start<-grep(pattern = "^Sequences not recorded", x=raw_lines)+2
    sequences_not_recorded_end<-(length(raw_lines)-1)
    sequences_not_recorded_matrix<-matrix(unlist(strsplit(raw_lines[sequences_not_recorded_start:sequences_not_recorded_end], split = "\t")), nrow=((sequences_not_recorded_end-sequences_not_recorded_start)+1), ncol = 2, byrow = TRUE)

    all_parsed_data<-list(rbind(major_stats_header,major_stats),ambiguous_barcodes,ambiguous_radtags,barcodes_table,sequences_not_recorded_matrix)
    pdf(paste(log_file,".pdf",sep=""), height = 10, width = 14 )
    par(mfrow=c(1,2), xaxs="i",yaxs="i")
    par(mfg=c(1,1))
    barplot((as.integer(sequences_not_recorded_matrix[,2])[as.integer(sequences_not_recorded_matrix[,2])>1000])/1000, names.arg = sequences_not_recorded_matrix[as.integer(sequences_not_recorded_matrix[,2])>1000,1], las=2, cex.names = 0.75, main="", xlab="", ylab = "")
    mtext("Number of Sequences x1000", side=2, line=2)
    mtext("Barcodes", side=1, line=3.5)
    par(mfg=c(1,2))
    barplot(as.integer(barcodes_table[,5])/1000,names.arg = barcodes_table[,1], las=2, cex.names = 0.75, ylab="Number of Sequences x1000")
    dev.off()


    return(all_parsed_data)
}
