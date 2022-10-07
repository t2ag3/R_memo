# legendの位置を変える
- `palmerpenguins`のデータで例示
```R
library(palmerpenguins)
p <- penguins %>% 
    ggplot(aes(x = bill_length_mm, 
               y = bill_depth_mm, 
               color = species)) +
    geom_point() + 
    theme_paper()
```
![plot](https://user-images.githubusercontent.com/7193590/192661187-c1fe1a8d-122f-49b6-a9ea-a2e109e11259.jpeg)

## 右上の枠内へ
```R
p + theme(legend.position = c(1, 1),
          legend.justification = c(1, 1))
```
![05f11e10-ba15-4c34-aa67-5a2236b76843](https://user-images.githubusercontent.com/7193590/194456741-27589f27-d013-4f08-9448-32c719d24c9a.png)


## 右下の枠内へ
```R
p + theme(legend.position = c(1, 0),
          legend.justification = c(1, 0))
```
![e9c13acf-7d72-4d9e-95f8-577fa1f1ea0b](https://user-images.githubusercontent.com/7193590/194456773-d65bbdfd-e725-4097-a37d-00f8ffd6abf0.png)

