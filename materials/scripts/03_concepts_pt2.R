#------------------------------------------------------------------------------#
#                                                                              #
#                         Graphic Design with ggplot2:                         # 
#            How to Create Engaging and Complex Visualizations in R            #
#                                                                              #
#                   Concepts of the {ggplot2} Package: Part 2                  #
#                                                                              #
#                              Dr. Cédric Scherer                              #
#                         rstudio::conf(2022) workshop                         #
#                              July 25–26th, 2022                              #
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




## Facets ######################################################################
## = split variables to multiple panels


## -----------------------------------------------------------------------------
g <-
  ggplot(
    bikes, 
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .3,
    guide = "none"
  )

g


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    vars(day_night)
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1,
    scales = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1,
    scales = "free_y"
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    ncol = 1,
    switch = "x"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    rows = vars(day_night), 
    cols = vars(is_workday)
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday + season
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free",
    switch = "y"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free",
    space = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free_y",
    space = "free_y"
  )



## Exercise --------------------------------------------------------------------

## Create this facet from the `diamonds` data: img/exercise-facets.png
## Bonus: create this dark version: img/exercise-facets-bonus.png

diamonds





## -----------------------------------------------------------------------------
ggplot(
    diamonds, 
    aes(x = carat, y = price)
  ) +
  geom_point(
    alpha = .3
  ) +
  geom_smooth(
    method = "lm", 
    se = FALSE, 
    color = "dodgerblue"
  ) 


## -----------------------------------------------------------------------------
ggplot(
    diamonds, 
    aes(x = carat, y = price)
  ) +
  geom_point(
    alpha = .3
  ) +
  geom_smooth(
    method = "lm", 
    se = FALSE, 
    color = "dodgerblue"
  ) +
  facet_grid(
    cut ~ clarity, 
    space = "free_x", 
    scales = "free_x"
  )


## -----------------------------------------------------------------------------
ggplot(
    diamonds, 
    aes(x = carat, y = price)
  ) +
  geom_point(
    alpha = .3,
    color = "white"
  ) +
  geom_smooth(
    method = "lm", 
    se = FALSE, 
    color = "dodgerblue"
  ) +
  facet_grid(
    cut ~ clarity, 
    space = "free_x", 
    scales = "free_x"
  ) +
  theme_dark(
    base_size = 14,
    base_family = "Roboto Condensed"
  )





## Scales ######################################################################
## = translate between variable ranges and property ranges


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_log10() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_log10() +
  scale_color_viridis_d()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    trans = "log10"
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares"
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = seq(0, 60000, by = 15000)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = c(0, seq(5000, 30000, by = 2500), 40000, 50000)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares in thousands",
    breaks = 0:4*15000,
    labels = 0:4*15
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares in thousands",
    breaks = 0:4,
    labels = paste(0:4*15000, "bikes")
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    limits = c(NA, 60000)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    expand = c(0, 0)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = -1:5*15000,
    expand = c(.5, .5)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_y_continuous(
    name = "Reported bike shares",
    breaks = 0:4*15000,
    guide = "none"
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "3 months"
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "20 weeks"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "4 months",
    date_labels = "%Y/%m/%d"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count)
  ) +
  geom_point() +
  scale_x_date(
    name = NULL,
    date_breaks = "4 months",
    date_labels = "%b '%y"
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_x_discrete(
    name = "Period",
    labels = c("Dec-Feb", "Mar-May", "Jun-Aug", "Sep-Nov")
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_x_discrete(
    name = "Season",
    expand = c(.5, .5)
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = as.numeric(season), y = count)
  ) +
  geom_boxplot(
    aes(group = season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = as.numeric(season), 
        y = count)
  ) +
  geom_boxplot(
    aes(group = season)
  ) +
  scale_x_continuous(
    name = "Season",
    breaks = 1:4,
    labels = levels(bikes$season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = as.numeric(season) + as.numeric(season) / 8, 
        y = count)
  ) +
  geom_boxplot(
    aes(group = season)
  ) +
  scale_x_continuous(
    name = "Season",
    breaks = 1:4,
    labels = levels(bikes$season)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = c("#69b0d4", "#00CB79", "#F7B01B", "#a78f5f")
  )


## -----------------------------------------------------------------------------
g <- ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = c("#69b0d4", "#00CB79", "#F7B01B", "#a78f5f")
  )

gb <- ggplot_build(g)

gb$data[[1]][1:10,]


## -----------------------------------------------------------------------------
my_colors <- c(
  `winter` = "#69b0d4", 
  `spring` = "#00CB79", 
  `summer` = "#F7B01B", 
  `autumn` = "#a78f5f"
)

ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = my_colors
  )


## -----------------------------------------------------------------------------
my_colors_alphabetical <- c(
  `autumn` = "#a78f5f", 
  `spring` = "#00CB79", 
  `summer` = "#F7B01B", 
  `winter` = "#69b0d4"
)

ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = my_colors_alphabetical
  )


## -----------------------------------------------------------------------------
library(RColorBrewer)

ggplot(
    bikes, 
    aes(x = date, y = count,
        color = season)
  ) +
  geom_point() +
  scale_color_discrete(
    name = "Season:",
    type = brewer.pal(
      n = 4, name = "Dark2"
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = weather_type)
  ) +
  geom_point() +
  scale_color_manual(
    name = "Season:",
    values = brewer.pal(n = 6, name = "Pastel1"),
    na.value = "black"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = date, y = count,
        color = weather_type)
  ) +
  geom_point() +
  rcartocolor::scale_color_carto_d(
    name = "Season:",
    palette = "Pastel",
    na.value = "black" 
  )



## Exercise --------------------------------------------------------------------

## Modify our diamonds facet like this: img/exercise-scales.png





## -----------------------------------------------------------------------------
facet <- 
  ggplot(
    diamonds, 
    aes(x = carat, y = price)
  ) +
  geom_point(
    alpha = .3
  ) +
  geom_smooth(
    aes(color = cut),
    method = "lm", 
    se = FALSE
  ) +
  facet_grid(
    cut ~ clarity, 
    space = "free_x", 
    scales = "free_x"
  )

facet


## -----------------------------------------------------------------------------
facet +
  scale_x_continuous(
    breaks = 0:5
  ) +
  scale_y_continuous(
    limits = c(0, 30000),
    breaks = 0:3*10000, 
    labels = c("$0", "$10,000", "$20,000", "$30,000")
  )


## -----------------------------------------------------------------------------
facet +
  scale_x_continuous(
    breaks = 0:5
  ) +
  scale_y_continuous(
    limits = c(0, 30000),
    breaks = 0:3*10000, 
    labels = paste0(
      "$", format(0:3*10000, big.mark = ",")
    )
  )


## -----------------------------------------------------------------------------
facet +
  scale_x_continuous(
    breaks = 0:5
  ) +
  scale_y_continuous(
    limits = c(0, 30000),
    breaks = 0:3*10000, 
    labels = function(y) paste0(
      "$", format(y, big.mark=",")
    )
  )


## -----------------------------------------------------------------------------
facet +
  scale_x_continuous(
    breaks = 0:5
  ) +
  scale_y_continuous(
    limits = c(0, 30000),
    breaks = 0:3*10000, 
    labels = scales::dollar_format()
  )


## -----------------------------------------------------------------------------
facet +
  scale_x_continuous(
    breaks = 0:5
  ) +
  scale_y_continuous(
    limits = c(0, 30000),
    breaks = 0:3*10000, 
    labels = scales::dollar_format()
  ) +
  scale_color_brewer(
    palette = "Set2",
    guide = "none"
  )


## -----------------------------------------------------------------------------
facet +
  scale_x_continuous(
    breaks = 0:5
  ) +
  scale_y_continuous(
    limits = c(0, 30000),
    breaks = 0:3*10000, 
    labels = scales::dollar_format()
  ) +
  scale_color_brewer(
    palette = "Set2"
  ) +
  theme(
    legend.position = "none"
  )




## Coordinate Systems###########################################################
## = interpret the position aesthetics


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000) 
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000) 
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_y_continuous(
    limits = c(NA, 15000) 
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000),
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, is_holiday == TRUE), 
    aes(x = temp_feel, y = count)
  ) +
  geom_point() +
  geom_text(
    aes(label = season),
    nudge_x = .3,
    hjust = 0
  ) +
  coord_cartesian(
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, is_holiday == TRUE), 
    aes(x = temp_feel, y = count)
  ) +
  geom_point() +
  ggrepel::geom_text_repel(
    aes(label = season),
    nudge_x = .3,
    hjust = 0
  ) +
  coord_cartesian(
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = count)
  ) +
  geom_point() +
  coord_cartesian(
    expand = FALSE,
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = temp)
  ) +
  geom_point() +
  coord_fixed()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = temp_feel, y = temp)
  ) +
  geom_point() +
  coord_fixed(ratio = 4)


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_flip()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(y = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_flip()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(y = fct_infreq(weather_type))
  ) +
  geom_bar()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(y = fct_rev(
      fct_infreq(weather_type)
    ))
  ) +
  geom_bar()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = weather_type,
        fill = weather_type)
  ) +
  geom_bar() +
  coord_polar()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = weather_type,
        fill = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = fct_infreq(weather_type),
        fill = weather_type)
  ) +
  geom_bar(width = 1) +
  coord_polar()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = fct_infreq(weather_type),
        fill = weather_type)
  ) +
  geom_bar(width = 1) +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = fct_infreq(weather_type),
        fill = weather_type)
  ) +
  geom_bar() +
  coord_polar(theta = "x")


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = fct_infreq(weather_type),
        fill = weather_type)
  ) +
  geom_bar() +
  coord_polar(theta = "y")


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = 1,
        fill = fct_rev(fct_infreq(weather_type)))
  ) +
  geom_bar(position = "stack") +
  coord_polar(theta = "y")


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)), 
    aes(x = 1,
        fill = fct_rev(fct_infreq(weather_type)))
  ) +
  geom_bar(position = "stack") +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count)
  ) +
  geom_point() +
  coord_trans(y = "log10")


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        group = day_night)
  ) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_trans(y = "log10")


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = count,
        group = day_night)
  ) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_y_log10()


## -----------------------------------------------------------------------------
countries <- rnaturalearth::ne_countries(
  returnclass = "sf"
)

ggplot() +
  geom_sf(
    data = countries, 
    color = "#79dfbd",
    fill = "#28a87d",
    size = .3
  ) 


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = countries, 
    color = "#79dfbd",
    fill = "#28a87d",
    size = .3
  ) +
  coord_sf(
    crs = "+proj=moll"
  )


## -----------------------------------------------------------------------------
ggplot() +
  geom_sf(
    data = countries, 
    color = "#79dfbd",
    fill = "#28a87d",
    size = .3
  ) +
  coord_sf(
    crs = "+proj=bonne +lat_1=10"
  )


## -----------------------------------------------------------------------------
oceans <- rnaturalearth::ne_download(
  category = "physical", type = "ocean", returnclass = "sf"
)

ggplot() +
  geom_sf(
    data = oceans,
    fill = "#d8f1f6"
  ) +
  geom_sf(
    data = countries, 
    color = "#79dfbd",
    fill = "#28a87d",
    size = .3
  ) +
  coord_sf(
    crs = "+proj=bonne +lat_1=10"
  ) +
  theme_void()
