# Using Google Scholar with R

The [scholar package](https://cran.r-project.org/web/packages/scholar/index.html) provides functions to retrieve citation data from Google Scholar. The package provides functions for comparing multiple scholars and predicting h-index scores based on past publication records.


a- Citation history for a researcher.
```R
# Get citation history
# The function get_citation_history() can be used to gets
# the number of citations to a scholar’s articles over the past years.
authorID <- "NDyEvlQAAAAJ&hl"
citationHistory <- get_citation_history(authorID)
head(citationHistory)
```
<p align="center">
  <img src="https://github.com/serayamaouche/RGoogle/blob/master/AtulJButteHistCitation.png" width="450"/>
</p>

```R
# Get how many articles a scholar has published
authorID <- "NDyEvlQAAAAJ&hl"
# Gets the citation history of a single article
get_article_history(authorID, article)

# Calculate how many articles a scholar has published.
get_num_articles(authorID)

# Gets the number of distinct journals in which a scholar has published
get_num_distinct_journals(authorID)

# Gets the number of top journals in which a scholar has published
journals <- c("Nature","Nature Genetics","Science","Nature Neuroscience",
               "PNAS")
get_num_top_journals(authorID, journals)

# Gets the year of the oldest article for a scholar
get_oldest_article(authorID)

# Gets profile information for a scholar
get_profile(authorID)
```


b- compare two scholars
```R
#********************** Compare multiple scholars
# This example compares Sekar Kathiresan and Euan Ashley
# Compares the careers of multiple scholars based on their citation histories. 
# The scholar’s career is defined by the number of 
# citations to his or her work in a given year (i.e. the bar chart at the top of a
# scholar’s profile). The function has an career option that allows users to compare scholars directly,
# i.e. relative to the first year in which their publications are cited.
ids <- c("EISUuucAAAAJ&hl", "Zb0am48AAAAJ&hl")
# Compare their career trajectories, based on year of first citation 
df <- compare_scholars(ids, pages=1000)
df <- compare_scholar_careers(ids, career = TRUE)
head(df)
ggplot(df, aes(x=career_year, y=cites)) + 
geom_line(aes(linetype=name)) + theme_bw()
```
<p align="center">
  <img src="https://github.com/serayamaouche/RGoogle/blob/master/CompareCS.png" width="450"/>
</p>

