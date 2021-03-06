% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/execute_denovomap_from_stacks.R
\name{execute_denovomap_from_stacks}
\alias{execute_denovomap_from_stacks}
\title{Execute DeNovomap pipeline from Stacks}
\usage{
execute_denovomap_from_stacks(min_stack_depth, number_of_Mismatches, Threads,
  batch_id, output_files, parent_files)
}
\arguments{
\item{min_stack_depth}{minimum depth of all stacks}

\item{number_of_Mismatches}{maximum number of mismatches}

\item{Threads}{maximum number of simulataneous operations on server}

\item{batch_id}{batch name of run}

\item{output_files}{name of output directory as a character vector}

\item{parent_files}{name of directory with parent files}
}
\value{
DONE
}
\description{
Execute DeNovomap pipeline from Stacks
}

