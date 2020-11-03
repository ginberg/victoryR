## Example

Basic examples.

```r
library(victoryR)

data <- data.frame(quarter = c(1, 2, 3 ,4), 
                   earnings = c(13000, 16500, 14250, 19000), 
                   stringsAsFactors = F)

victory(data, "quarter", "earnings", type = "Pie", colorScale=c("tomato", "orange", "gold", "cyan"))
victory(data, "quarter", "earnings", type = "Bar")
```


## Get it


The development version from Github.

```r
# install.packages("remotes")
remotes::install_github("ginberg/victoryR")
```
