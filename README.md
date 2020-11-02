## Example

Basic examples.

```r
library(victoryR)

data <- data.frame(x = c(1, 2, 3 ,4), y = c(13000, 16500, 14250, 19000), stringsAsFactors = F)

victory(data, "x", "y", type = "Bar")
```


## Get it


The development version from Github.

```r
# install.packages("remotes")
remotes::install_github("ginberg/victoryR")
```
