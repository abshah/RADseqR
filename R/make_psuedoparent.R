#' make psuedo-parent files
#' @param input_samples demultiplexed samples to create psuedoparent (as a character list)
#' @param psuedoparent desired name of psuedoparent file
#' @return NULL
#' @export

##### make super-parents ######
make_psuedoparent <- function(input_samples,psuedoparent)
{
    input_samples <- unlist(input_samples)
    system2(command = "cat ", args =c(input_samples," > ",psuedoparent) )
return(NULL)
}
