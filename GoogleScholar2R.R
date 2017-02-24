############################################
# Analyse citation data from Google Scholar
#############################################

# Installing depending packages
requiredPackages <- c("scholar","ggplot2","dplyr","stringr",
                       "R.cache","httr","rvest","xml2")
install.packages(requiredPackages)


#********************** Install scholar from CRAN
# install.packages("scholar")
#
#********************** Install scholar from github
#if (!require("devtools")) install.packages("devtools")
# devtools::install_github("jkeirstead/scholar")
# https://github.com/jkeirstead

#********************** Load library
library(scholar)
library(ggplot2)


#********************** Gets profile of some authors
ids      <- c("a1D7YVUAAAAJ&hl", "6pWlo6UAAAAJ&hl")
profiles <- lapply(ids, get_profile)
profiles[[1]]$name   # display the name of the first aurhor
profiles[[2]]$name   # display the name of the second aurhor

#**********************  Get citation history
# The function get_citation_history() can be used to gets
# the number of citations to a scholar’s articles over the past years.
authorID        <- "WCFg9C0AAAAJ&hl"
citationHistory <- get_citation_history(authorID)
head(citationHistory)

#**********************  Get all publications for a scholar
id <- "a1D7YVUAAAAJ&hl"
Publist <- get_publications(id)
dim(Publist)
head(Publist)
names(Publist)

#**********************  Generate a citation history plot
#png('GScholarCitationHistory_SerayaMaouche.png',width=700,height=1800,res=200)
ggplot(citationHistory,aes(x=year,y=cites))+
  geom_bar(stat='identity')+
  theme_bw()+
  xlab('Year of citation')+
  ylab('Google Scholar\n Number of citations')+
  annotate('text',label=format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),x=-Inf,y=Inf,vjust=1.5,hjust=-0.05,size=4,colour='blue')
#dev.off()
