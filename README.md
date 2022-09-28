# Rのメモ

1. ggplot2
2. 論文用ggplot2テーマ自作パッケージ: [mytheme](https://github.com/t2ag3/R_memo/tree/main/mytheme)

# mytheme
## Installation
```R
library(remotes)
install_github('t2ag3/R_memo/mytheme')
```

## Usage
```R
# 
g <- iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point()
g + theme_paper()


# show vignette page
vignette('theme_paper')
```

