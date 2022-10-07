# legendを操作
- `palmerpenguins`のデータで例示
- `theme()`の`legend.position`と`legend.justification`で指定
- 段組みは`guides()`の`color`か`fill`attributeに対して、`guide_legend()`で指定
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

## legendを2段組みにする
```R
p1 + guides(color = guide_legend(ncol = 2))
```
![10acf09f-20fa-4b08-93c8-32a693496e5e](https://user-images.githubusercontent.com/7193590/194458979-5c9583f1-316e-4ad2-bbfb-b52725a5e81c.png)

## ledendを横方向にする
```R
p1 + theme(legend.direction = 'horizontal')
```
![84c3c902-9832-4ec0-b7e5-9c23796582a5](https://user-images.githubusercontent.com/7193590/194458998-44a51974-84ec-4b36-bdac-d94e2c83eb3e.png)

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


# 棒グラフ関連
```R
p.bar <- penguins %>% filter(!is.na(sex)) %>% 
    ggplot(aes(x = sex, 
               y = bill_length_mm,
               fill = species)) +
    geom_bar(position = position_dodge(width = 0.9),
             stat = 'summary',
             fun = 'mean') + theme_paper() + 
    labs(title = 'Mean of bill length of each species')
```
![3215fc5a-edbf-4012-9177-82055ca17098](https://user-images.githubusercontent.com/7193590/194460854-5c31c75e-1563-4085-b5e7-453901d8bf8a.png)

## x軸から浮かないようにする
```R
p.bar + scale_y_continuous(expand = c(0, 0)) -> p.bar1
```
![7a80a5a8-7920-4942-9630-efda1a592915](https://user-images.githubusercontent.com/7193590/194460855-d71ceca2-ac85-4b3a-9740-665cce5a138d.png)

## エラーバーをつける
```R
p.bar1 +
    stat_summary(fun.data = 'mean_se', 
                 geom = 'errorbar', 
                 position = position_dodge(width = 0.9), 
                 width = 0.2)
```
![62269a05-654f-4009-830b-a6ce23062a8d](https://user-images.githubusercontent.com/7193590/194460857-b0ce92dd-e736-45cc-9199-775a8721b4b9.png)

