# legend関連
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
<img src="https://user-images.githubusercontent.com/7193590/192661187-c1fe1a8d-122f-49b6-a9ea-a2e109e11259.jpeg" width="50%" />

## 右上の枠内へ
```R
p + theme(legend.position = c(1, 1),
          legend.justification = c(1, 1))
```
<img src="https://user-images.githubusercontent.com/7193590/194457086-25b9d7d3-ca0f-4a95-8701-e56735302401.png" width="50%" />



## 右下の枠内へ
```R
p + theme(legend.position = c(1, 0),
          legend.justification = c(1, 0)) -> p1
```
<img src="https://user-images.githubusercontent.com/7193590/194457132-efb5e392-4a03-482d-9508-962fdb824ffa.png" width="50%" />

## legendを2段組みにする
```R
p1 + guides(color = guide_legend(ncol = 2))
```
<img src="https://user-images.githubusercontent.com/7193590/194458979-5c9583f1-316e-4ad2-bbfb-b52725a5e81c.png" width="50%" />

## ledendを横方向にする
```R
p1 + theme(legend.direction = 'horizontal')
```
<img src="https://user-images.githubusercontent.com/7193590/194458998-44a51974-84ec-4b36-bdac-d94e2c83eb3e.png" width="50%" />

## legendの表示名を変える
```R
p1 + scale_color_discrete(labels = c('アデリー', 'アゴヒゲ', 'ジェンツー'))
```
<img src="https://user-images.githubusercontent.com/7193590/197204222-d967ee4c-994e-4d17-a148-cd31f30a2901.png" width="50%" />

# 配色関連
## 配色を逆順にする
```R
p1 + scale_color_hue(direction = -1)
```
<img src="https://user-images.githubusercontent.com/7193590/197204965-ccd7dfa4-e049-41e0-beff-3513526ea943.png" width="50%" />

## カラーパレットを見る
```R
# 最初の6桁がカラーコード, 最後の2桁が透過度
scales::show_col(ggsci::pal_jama()(4))
```
<img src="https://user-images.githubusercontent.com/7193590/198450810-e8e89d30-4d4e-479b-bc50-65eb3d8b25dd.png" width="50%" />


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
<img src="https://user-images.githubusercontent.com/7193590/194457846-f0454620-ea60-40b5-aab8-5807fd23e45f.png" width="50%" />


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
<img src="https://user-images.githubusercontent.com/7193590/194460854-5c31c75e-1563-4085-b5e7-453901d8bf8a.png" width="50%" />

## x軸からy軸が浮かないようにする
```R
p.bar + scale_y_continuous(expand = c(0, 0)) -> p.bar1
```
<img src="https://user-images.githubusercontent.com/7193590/194460855-d71ceca2-ac85-4b3a-9740-665cce5a138d.png" width="50%" />

## エラーバーをつける
```R
p.bar1 +
    stat_summary(fun.data = 'mean_se', 
                 geom = 'errorbar', 
                 position = position_dodge(width = 0.9), 
                 width = 0.2)
```
<img src="https://user-images.githubusercontent.com/7193590/194460857-b0ce92dd-e736-45cc-9199-775a8721b4b9.png" width="50%" />

## 色を変える
```R
p.bar1 + ggsci::scale_fill_jama()
```
<img src="https://user-images.githubusercontent.com/7193590/198453508-2e51bd62-e977-4dc4-a28e-0d1da4b95d33.png" width="50%" />


# Facet / patchwork関連
```R
penguins %>% 
    ggplot(aes(x = bill_length_mm,
               y = bill_depth_mm)) +
    geom_point() +
    facet_wrap(~ species)
```
<img src="https://user-images.githubusercontent.com/7193590/198456922-c26e3391-c88b-4943-9ee6-af9ca5cd96bd.png" width="50%" />


## Facetのタイトルを変更する
```R
penguins %>% 
    ggplot(aes(x = bill_length_mm,
               y = bill_depth_mm)) +
    geom_point() +
    facet_wrap(~ species,
               labeller = as_labeller(c(Adelie = 'アデリー',
                                        Chinstrap = 'ヒゲ',
                                        Gentoo = 'ジェンツー')))
```
<img src="https://user-images.githubusercontent.com/7193590/198459753-8653a6a9-6c36-411b-8517-12973cdf0073.png" width="50%" />


# 保存関連
- single column size: `width`: 3.5 inch
- 1.5 column size: `width`: 5 inch
- double column size: `width`: 7.2 inch
- `units`: `in`(default), `cm`, `mm`, `px`

```R
width <- 3.5
height <- 4
dpi <- 600
device <- 'eps'
ggsave('filename.eps', 
       plot = p1, 
       width = width, 
       height = height,
       dpi = dpi,
       device = device)
```

