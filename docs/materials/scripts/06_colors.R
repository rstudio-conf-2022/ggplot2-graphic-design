#------------------------------------------------------------------------------#
#                                                                              #
#                         Graphic Design with ggplot2:                         #
#            How to Create Engaging and Complex Visualizations in R            #
#                                                                              #
#                             Working with Colors                              #
#                                                                              #
#                              Dr. Cedric Scherer                              #
#                         rstudio::conf(2022) workshop                         #
#                              July 25-26th, 2022                              #
#                                                                              #
#------------------------------------------------------------------------------#



## -----------------------------------------------------------------------------
library(tidyverse)

bikes <- readr::read_csv(
  here::here("data", "london-bikes-custom.csv"), 
  col_types = "Dcfffilllddddc"
)

bikes$season <- forcats::fct_inorder(bikes$season)

theme_set(theme_light(base_size = 14, base_family = "Roboto Condensed"))

theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  legend.position = "top",
  plot.title.position = "plot"
)


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_viridis_d(
    option = "plasma",
    begin = .3
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = month)
  ) +
  geom_boxplot() +
  scale_fill_viridis_d(
    option = "plasma",
    begin = .3
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_viridis_c(
    option = "plasma",
    end = .9
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_viridis_c(
    option = "plasma",
    end = .9,
    direction = -1
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_brewer(
    palette = "Set1"
  )


## -----------------------------------------------------------------------------
RColorBrewer::display.brewer.all()

RColorBrewer::display.brewer.all(colorblindFriendly = TRUE)


## -----------------------------------------------------------------------------
# install.packages("rcartocolor")

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  rcartocolor::scale_fill_carto_d(
    palette = "Vivid" 
  )


## -----------------------------------------------------------------------------
rcartocolor::display_carto_all()

rcartocolor::display_carto_all(colorblind_friendly = TRUE)


## -----------------------------------------------------------------------------
# install.packages("scico")

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scico::scale_fill_scico_d(
    palette = "hawaii"
  )


## -----------------------------------------------------------------------------
scico::scico_palette_show()


## -----------------------------------------------------------------------------
# install.packages("ggsci")
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  ggsci::scale_fill_npg()


## -----------------------------------------------------------------------------
# install.packages("ggthemes")
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  ggthemes::scale_fill_gdocs()


## -----------------------------------------------------------------------------
# install.packages("nord")

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  nord::scale_fill_nord(
    palette = "aurora"
  )


## -----------------------------------------------------------------------------
# install.packages("nord")

ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  nord::scale_color_nord(
    palette = "silver_mine",
    discrete = FALSE
  )


## -----------------------------------------------------------------------------
# install.packages("MetBrewer")

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  MetBrewer::scale_fill_met_d(
    name = "Klimt"
  )


## -----------------------------------------------------------------------------
MetBrewer::display_all()

MetBrewer::display_all(colorblind_only = TRUE)


## -----------------------------------------------------------------------------
# install.packages("MetBrewer")

ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  MetBrewer::scale_color_met_c(
    name = "Hiroshige" 
  )


## -----------------------------------------------------------------------------
library("rcartocolor")

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  rcartocolor::scale_fill_carto_d(
    name = "Vivid" 
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_pal(
      name = "Vivid", n = 4
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_pal(
      name = "Vivid", n = 5
    )[1:4]
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_pal(
      name = "Vivid", n = 6
    )[c(1, 3:5)]
  )


## -----------------------------------------------------------------------------
carto_custom <- 
  carto_pal(
    name = "Vivid", n = 6
  )[c(1, 3:5)]

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
# install.packages("colorspace")
library(colorspace)

carto_light <- lighten(carto_custom, .8)

ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_light
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count)
  ) +
  geom_boxplot(
    aes(fill = season,
        fill = after_scale(
          lighten(fill, .8)
    ))
  ) +
  scale_fill_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count)
  ) +
  geom_boxplot(
    aes(
      fill = stage(
        season,
        after_scale =
          lighten(fill, .8)
      )
    )
  ) +
  scale_fill_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count)
  ) +
  geom_boxplot(
    aes(color = season,
        fill = after_scale(
          lighten(color, .8)
    ))
  ) +
  scale_color_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count)
  ) +
  geom_boxplot(
    aes(color = season,
        fill = after_scale(
          lighten(color, .8)
    ))
  ) +
  geom_jitter(
    aes(color = season), 
    position = position_jitterdodge(
      dodge.width = .75, 
      jitter.width = .2
    ),
    alpha = .4
  ) +
  scale_color_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count)
  ) +
  geom_boxplot(
    aes(color = season,
        fill = after_scale(
          lighten(color, .8)
        ))
  ) +
  geom_jitter(
    aes(color = season,
        color = after_scale(
          darken(color, .3)
    )), 
    position = position_jitterdodge(
      dodge.width = .75, 
      jitter.width = .2
    ),
    alpha = .4
  ) +
  scale_color_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count)
  ) +
  geom_boxplot(
    aes(color = season,
        fill = after_scale(
          lighten(color, .8)
        ))
  ) +
  geom_jitter(
    aes(color = season,
        color = after_scale(
          darken(color, .3)
        )), 
    position = position_jitterdodge(
      dodge.width = .75, 
      jitter.width = .2
    ),
    alpha = .4
  ) +
  scale_color_manual(
    values = carto_custom
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradient(
    low = "#28A87D",
    high = "#FFD166"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradient2(
    low = "#663399",
    high = "#993334",
    mid = "grey95"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradient2(
    low = "#663399",
    high = "#993334",
    mid = "grey92",
    midpoint = 10    
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradient2(
    low = "#663399",
    high = "#993334",
    mid = "grey92",
    midpoint = 10,
    limits = c(-10, 30)   
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradientn(
    colors = carto_custom  
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradientn(
    colors = carto_custom,
    values = c(0, .2, .8, 1)
  )


## -----------------------------------------------------------------------------
dubois_colors <- function(...) {
  dubois_cols <- c(
    `black`    = "#000000",
    `purple`   = "#582f6c",
    `violet`   = "#94679C",
    `pink`     = "#ef849f",
    `softred`  = "#f4b7a7",
    `iceblue`  = "#bccbf3",
    `palegrey` = "#e4e4e4"
  )

  cols <- c(...)

  if (is.null(cols))
    return (dubois_cols)

  dubois_cols[cols]
}

dubois_colors("black", "pink", "softred", "iceblue")


## -----------------------------------------------------------------------------
dubois_pal_d <- function(palette = "default", reverse = FALSE) {
  function(n) {
    if(n > 5) stop('Palettes only contains 5 colors')

    if (palette == "default") { pal <- dubois_colors("black", "violet", "softred", "iceblue", "palegrey")[1:n] }
    if (palette == "dark") { pal <- dubois_colors(1:5)[1:n] }
    if (palette == "light") { pal <- dubois_colors(3:7)[1:n] }
    
    pal <- unname(pal)

    if (reverse) rev(pal) else pal
  }
}

dubois_pal_d()(3)


## -----------------------------------------------------------------------------
scale_color_dubois_d <- function(palette = "default", reverse = FALSE, ...) {
  if (!palette %in% c("default", "dark", "light")) stop('Palette should be "default", "dark" or "light".')

  pal <- dubois_pal_d(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("colour", paste0("dubois_", palette), palette = pal, ...)
}

scale_fill_dubois_d <- function(palette = "default", reverse = FALSE, ...) {
  if (!palette %in% c("default", "dark", "light")) stop('Palette should be "default", "dark" or "light".')

  pal <- dubois_pal_d(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("fill", paste0("dubois_", palette), palette = pal, ...)
}


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_dubois_d()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        color = season)
  ) +
  geom_boxplot() +
  scale_color_dubois_d(
    palette = "dark",
    reverse = TRUE
  )


## -----------------------------------------------------------------------------
deut <- 
  colorspace::deutan(
    viridis::turbo(
      n = 100, direction = -1
    )
  )

ggplot(
    bikes, 
    aes(x = temp_feel, y = count,
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_gradientn(
    colors = deut
  )


## -----------------------------------------------------------------------------
g <- 
  ggplot(
    bikes, 
    aes(x = day_night, y = count, 
        fill = season)
  ) +
  geom_boxplot() +
  scale_fill_manual(
    values = carto_custom
  )

g


## -----------------------------------------------------------------------------
# devtools::install_github(
#   "clauswilke/colorblindr"
# )

colorblindr::cvd_grid(g)


## -----------------------------------------------------------------------------
g2 <- 
  ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = season)
  ) +
  geom_point(size = 2, alpha = .75) +
  scale_color_manual(
    values = carto_custom
  )

colorblindr::cvd_grid(g2)


## -----------------------------------------------------------------------------
g3 <- 
  g2 +
  scale_color_manual(
    values = c("#3c89d9", "#1ec99b", "#F7B01B", "#a26e7c")
  )

colorblindr::cvd_grid(g3)


## -----------------------------------------------------------------------------
colorspace::specplot(
  colorspace::diverging_hcl(
    n = 100, palette = "Blue-Red"
  )
)


## -----------------------------------------------------------------------------
colorspace::specplot(
  scico::scico(
    n = 100, palette = "hawaii"
  )
)


## -----------------------------------------------------------------------------
colorspace::specplot(
  MetBrewer::met.brewer(
     n = 100, name = "Hiroshige"
  )
)


## -----------------------------------------------------------------------------
colorspace::specplot(
  rcartocolor::carto_pal(
    n = 7, name = "TealRose"
  )
)


## -----------------------------------------------------------------------------
colorspace::specplot(
  MetBrewer::met.brewer(
     n = 100, name = "Cassatt2"
  )
)


## -----------------------------------------------------------------------------
colorspace::specplot(
  rainbow(
    n = 100
  )
)


## -----------------------------------------------------------------------------
colorspace::specplot(
  viridis::turbo(
     n = 100, direction = -1
  )
)


## -----------------------------------------------------------------------------
dubois_pal_c <- function(palette = "dark", reverse = FALSE, ...) {
  dubois_palettes <- list(
    `dark`    = dubois_colors("black", "purple", "violet", "pink"),
    `light`   = dubois_colors("purple", "violet", "pink", "palered")
  )

  pal <- dubois_palettes[[palette]]
  pal <- unname(pal)

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}

dubois_pal_c(palette = "light", reverse = TRUE)(3)


## -----------------------------------------------------------------------------
scale_fill_dubois_c <- function(palette = "dark", reverse = FALSE, ...) {
  if (!palette %in% c("dark", "light")) stop('Palette should be "dark" or "light".')

  pal <- dubois_pal_c(palette = palette, reverse = reverse)

  ggplot2::scale_fill_gradientn(colours = pal(256), ...)
}

scale_color_dubois_c <- function(palette = "dark", reverse = FALSE, ...) {
  if (!palette %in% c("dark", "light")) stop('Palette should be "dark" or "light".')

  pal <- dubois_pal_c(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colours = pal(256), ...)
}


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_dubois_c()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count, 
        color = temp_feel)
  ) +
  geom_point() +
  scale_color_dubois_c(
    palette = "light",
    reverse = TRUE
  )

