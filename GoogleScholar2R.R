############################################
# Analyse citation data from Google Scholar
#############################################

# Installing depending packages
requiredPackages <- c("scholar","ggplot2","dplyr","stringr",
                       "R.cache","httr","rvest","xml2")
install.packages(requiredPackages)


#********************** Installing scholar from CRAN
# install.packages("scholar")
#
#********************** Installing scholar from github
#if (!require("devtools")) install.packages("devtools")
# devtools::install_github("jkeirstead/scholar")
# https://github.com/jkeirstead

#********************** Load library
library(scholar)
library(ggplot2)

#********************** Gets profile of two researchers
ids      <- c("EISUuucAAAAJ&hl", "Zb0am48AAAAJ&hl")
profiles <- lapply(ids, get_profile)
profiles[[1]]$name   #disply the name of the first aurhor
profiles[[2]]$name   #disply the name of the second aurhor

#********************** Get citation history
# The function get_citation_history() can be used to gets
# the number of citations to a scholar’s articles over the past years.
authorID <- "NDyEvlQAAAAJ&hl"
citationHistory <- get_citation_history(authorID)
head(citationHistory)

#********************** Get how many articles a scholar has published
authorID <- "NDyEvlQAAAAJ&hl"
# Gets the citation history of a single article
get_article_history(authorID, article)

#********************** Calculate how many articles a scholar has published.
get_num_articles(authorID)

#********************** Gets the number of distinct journals in which a scholar has published
get_num_distinct_journals(authorID)

#********************** Gets the number of top journals in which a scholar has published
journals <- c("Nature","Nature Genetics","Science","Nature Neuroscience",
               "PNAS")
get_num_top_journals(authorID, journals)

#********************** Gets the year of the oldest article for a scholar
get_oldest_article(authorID)

#********************** Gets profile information for a scholar
get_profile(authorID)

#********************** Get all publications for an author
# Atul J. Butte
id <- "NDyEvlQAAAAJ&hl"
Publist <- get_publications(id, cstart = 0, pagesize = 100, flush = FALSE)
dim(Publist)
head(Publist)
names(Publist)

#********************** Generate a citation history plot
#png('GScholarCitationHistory_SerayaMaouche.png',width=700,height=1800,res=200)
ggplot(citationHistory,aes(x=year,y=cites))+
  geom_bar(stat='identity')+
  theme_bw()+
  xlab('Year of citation')+
  ylab('Google Scholar\n Number of citations')+
  annotate('text',label=format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),x=-Inf,y=Inf,vjust=1.5,hjust=-0.05,size=4,colour='blue')
#dev.off()


#********************** Compare multiple scholars
# This example compares Sekar Kathiresan and Euan Ashley
ids      <- c("EISUuucAAAAJ&hl", "Zb0am48AAAAJ&hl")
# Compare their career trajectories, based on year of first citation 
# Compares the citation records of multiple scholars.
df <- compare_scholars(ids, pages=1000)
# Compares the careers of multiple scholars based on their citation histories. 
# The scholar’s career is defined by the number of 
# citations to his or her work in a given year (i.e. the bar chart at the top of a
# scholar’s profile). The function has an career option that allows users to compare scholars directly,
# i.e. relative to the first year in which their publications are cited.
df <- compare_scholar_careers(ids, career = TRUE)
head(df)
ggplot(df, aes(x=career_year, y=cites)) + 
  geom_line(aes(linetype=name)) + theme_bw()

# Predicting the h-index for a researcher
## Predict Sekar Kathiresan's h-index
# predict_h_index(id, journals)
id < - "EISUuucAAAAJ&hl" 
predict_h_index(id) 












