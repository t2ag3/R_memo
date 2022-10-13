# データ変形
## 元データ
```R
anscombe

#>   x1 x2 x3 x4    y1   y2    y3    y4
#> 1 10 10 10  8  8.04 9.14  7.46  6.58
#> 2  8  8  8  8  6.95 8.14  6.77  5.76
#> 3 13 13 13  8  7.58 8.74 12.74  7.71
#> 4  9  9  9  8  8.81 8.77  7.11  8.84
#> 5 11 11 11  8  8.33 9.26  7.81  8.47
#> 6 14 14 14  8  9.96 8.10  8.84  7.04
#> 7  6  6  6  8  7.24 6.13  6.08  5.25
#> 8  4  4  4 19  4.26 3.10  5.39 12.50
#> 9 12 12 12  8 10.84 9.13  8.15  5.56
#>  [ reached 'max' / getOption("max.print") -- omitted 2 rows ]
```

## x列とy列にして、long-formatに変換
```R
anscombe %>% 
    pivot_longer(
        everything(),
        names_to = c('.value', 'group'),
        names_sep = 1L,
        names_transform = list(group = as.integer))

#> # A tibble: 44 × 3
#>    group     x     y
#>    <int> <dbl> <dbl>
#>  1     1    10  8.04
#>  2     2    10  9.14
#>  3     3    10  7.46
#>  4     4     8  6.58
#>  5     1     8  6.95
#>  6     2     8  8.14
#>  7     3     8  6.77
#>  8     4     8  5.76
#>  9     1    13  7.58
#> 10     2    13  8.74
#> # … with 34 more rows
```
