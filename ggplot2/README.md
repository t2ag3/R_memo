# legendの位置を変える
- `palmerpenguins`のデータで例示
- `theme()`の`legend.position`と`legend.justification`で指定
- 段組みとかは
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
![e5b0408b-01cc-4a52-a816-2d23917056a1](https://user-images.githubusercontent.com/7193590/194457086-25b9d7d3-ca0f-4a95-8701-e56735302401.png)



## 右下の枠内へ
```R
p + theme(legend.position = c(1, 0),
          legend.justification = c(1, 0)) -> p1
```
![18f2b6c7-f8a7-4470-a35d-5f858b26a0fa](https://user-images.githubusercontent.com/7193590/194457132-efb5e392-4a03-482d-9508-962fdb824ffa.png)


# 軸とかのラベルを変える
```R
p1 + labs(x = 'Length of bill (mm)',
          y = 'Depth of bill (mm)',
          color = 'Species',
          title = '軸とかのラベル変える',
          subtitle = 'サブタイトル',
          caption = '*注釈: palmerpenguinsのデータをプロット', 
          tag = 'A')
```
![a13ccc12-f837-436d-8185-ccb1487fa2bf](https://user-images.githubusercontent.com/7193590/194457846-f0454620-ea60-40b5-aab8-5807fd23e45f.png)



