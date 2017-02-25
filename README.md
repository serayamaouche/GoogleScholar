# Using Google Scholar with R

The [scholar package](https://cran.r-project.org/web/packages/scholar/index.html)provides functions to retrieve citation data from Google Scholar. The package
provides functions for comparing multiple scholars and predicting h-index scores based on
past publication records.



a- Citation history for a researcher
<p align="center">
  <img src="https://github.com/serayamaouche/RGoogle/blob/master/AtulJButteHistCitation.png" width="450"/>
</p>

```R
# Get citation history
# The function get_citation_history() can be used to gets
# the number of citations to a scholar’s articles over the past years.
authorID <- "NDyEvlQAAAAJ&hl"
citationHistory <- get_citation_history(authorID)
head(citationHistory)

# Get how many articles a scholar has published
authorID <- "NDyEvlQAAAAJ&hl"
# Gets the citation history of a single article
get_article_history(authorID, article)

# Calculate how many articles a scholar has published.
get_num_articles(authorID)

#Gets the number of distinct journals in which a scholar has published
get_num_distinct_journals(authorID)

# Gets the number of top journals in which a scholar has published
journals <- c("Nature","Nature Genetics","Science","Nature Neuroscience","Proceedings of the National Academy of Sciences")
get_num_top_journals(authorID, journals)

# Gets the year of the oldest article for a scholar
get_oldest_article(authorID)

# Gets profile information for a scholar
get_profile(authorID)
```


b- compare two scholars
<p align="center">
  <img src="https://github.com/serayamaouche/RGoogle/blob/master/CompareCS.png" width="450"/>
</p>

