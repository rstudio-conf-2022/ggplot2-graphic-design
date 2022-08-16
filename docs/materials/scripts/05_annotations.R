#------------------------------------------------------------------------------#
#                                                                              #
#                         Graphic Design with ggplot2:                         #
#            How to Create Engaging and Complex Visualizations in R            #
#                                                                              #
#                     Working with Labels and Annotations                      #
#                                                                              #
#                              Dr. C�dric Scherer                              #
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
  legend.position = "top"
)


## -----------------------------------------------------------------------------
g <- ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  labs(
    x = "Feels-like temperature (°F)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends",
    subtitle = "Reported bike rents versus feels-like temperature in London",
    caption = "Data: TfL",
    color = "Season:",
    tag = "1."
  )

g


## -----------------------------------------------------------------------------
g + theme(
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot"
)


## -----------------------------------------------------------------------------
g + theme(
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  axis.text = element_text(
    color = "grey40"
  )
)


## -----------------------------------------------------------------------------
g + theme(
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  axis.text = element_text(
    color = "grey40",
    family = "Tabular",
    face = "italic",
    hjust = 1,
    vjust = 0,
    angle = 45,
    lineheight = 1.3, ## no effect here
    margin = margin(10, 0, 20, 0)
  )
)


## -----------------------------------------------------------------------------
g + theme(
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  axis.text = element_text(
    color = "grey40",
    family = "Tabular",
    face = "italic",
    colour = NULL,
    size = NULL,
    hjust = 1,
    vjust = 0,
    angle = 45,
    lineheight = 1.3, ## no effect here
    margin = margin(10, 0, 20, 0) ## no effect here
  ),
  axis.text.x = element_text(
    margin = margin(10, 0, 20, 0) ## trbl
  )
)


## -----------------------------------------------------------------------------
g + theme(
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  axis.text = element_text(
    color = "grey40",
    family = "Tabular",
    face = "italic",
    colour = NULL,
    size = NULL,
    hjust = 1,
    vjust = 0,
    angle = 45,
    lineheight = 1.3, ## no effect here
    margin = margin(10, 0, 20, 0) ## no effect here
  ),
  plot.tag = element_text(
    margin = margin(0, 12, -8, 0) ## trbl
  )
)


## -----------------------------------------------------------------------------
g + theme(
  plot.title = element_text(face = "bold"),
  plot.title.position = "plot",
  axis.text = element_text(
    color = "grey40",
    family = "Tabular",
    face = "italic",
    colour = NULL,
    size = NULL,
    hjust = 1,
    vjust = 0,
    angle = 45,
    lineheight = 1.3, ## no effect here
    margin = margin(10, 0, 20, 0), ## no effect here
    debug = TRUE
  ),
  plot.tag = element_text(
    margin = margin(0, 12, -8, 0), ## trbl
    debug = TRUE
  )
)


## -----------------------------------------------------------------------------
g <- g + labs(title = NULL, subtitle = NULL, tag = NULL)

g +
  scale_y_continuous(
    breaks = 0:4*15000
  )


## -----------------------------------------------------------------------------
g +
  scale_y_continuous(
    breaks = 0:4*15000,
    labels = scales::comma_format()
  )


## -----------------------------------------------------------------------------
g +
  scale_y_continuous(
    breaks = 0:4*15000,
    labels = scales::comma_format(
      suffix = " bikes"
    ),
    name = NULL
  )


## -----------------------------------------------------------------------------
g +
  scale_y_continuous(
    breaks = 0:4*15000,
    labels = scales::comma_format(
      suffix = "\nbikes shared"
    ),
    name = NULL
  ) +
  theme(
    axis.text.y = element_text(
      hjust = .5
    )
  )


## -----------------------------------------------------------------------------
g +
  scale_y_continuous(
    breaks = 0:4*15000,
    labels = scales::comma_format(
      scale = .001
    ),
    name = "Reported bike shares in thousands"
  )


## -----------------------------------------------------------------------------
g +
  scale_y_continuous(
    breaks = 0:4*15000,
    labels = function(y) y / 1000,
    name = "Reported bike shares in thousands",
  )


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    labels = function(y) paste0(y, "°F"),
    name = "Feels-Like Temperature"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_x_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_x_discrete(
    name = NULL,
    labels = stringr::str_to_title
  )


## -----------------------------------------------------------------------------
g +
  scale_color_discrete(
    name = NULL,
    labels = stringr::str_to_title
  )


## -----------------------------------------------------------------------------
g +
  ggtitle("**TfL bike sharing trends by _season_**")


## -----------------------------------------------------------------------------
# install.packages("ggtext")

g +
  ggtitle("**TfL bike sharing trends by _season_**") +
  theme(
    plot.title = ggtext::element_markdown()
  )


## -----------------------------------------------------------------------------
# install.packages("ggtext")

g +
  ggtitle("<b style='font-family:tabular;font-size:25pt'>TfL</b> bike sharing trends by <i style='color:#28a87d;'>season</i>") +
  theme(
    plot.title = ggtext::element_markdown()
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night,
    labeller = label_both
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = label_both
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = labeller(
      day_night = stringr::str_to_title
    )
  )


## -----------------------------------------------------------------------------
codes <- c(
  `TRUE` = "Workday",
  `FALSE` = "Weekend or Holiday"
)

g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = labeller(
      day_night = stringr::str_to_title,
      is_workday = codes
    )
  )


## -----------------------------------------------------------------------------
codes <- c(
  `TRUE` = "Workday",
  `FALSE` = "Weekend or Holiday"
)

g +
  facet_wrap(
    ~ is_workday + day_night,
    labeller = labeller(
      .default = stringr::str_to_title,
      is_workday = codes
    )
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free",
    space = "free",
    labeller = labeller(
      day_night = stringr::str_to_title,
      is_workday = codes
    )
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type,
        y = count)
  ) +
  geom_boxplot()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = stringr::str_wrap(weather_type, 6),
        y = count)
  ) +
  geom_boxplot()


## -----------------------------------------------------------------------------
g +
  ggtitle("TfL bike sharing trends in 2015 and 2016 by season for day and night periods") +
  theme(
    plot.title = element_text(size = 20),
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
g +
  ggtitle("TfL bike sharing trends in 2015 and 2016 by season for day and night periods") +
  theme(
    plot.title =
      ggtext::element_textbox_simple(size = 20),
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
g +
  ggtitle("TfL bike sharing trends in 2015 and 2016 by season for day and night periods") +
  theme(
    plot.title = ggtext::element_textbox_simple(
      margin = margin(t = 12, b = 12),
      lineheight = .9
    ),
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
g +
  ggtitle("TfL bike sharing trends in 2015 and 2016 by season for day and night periods") +
  theme(
    plot.title = ggtext::element_textbox_simple(
      margin = margin(t = 12, b = 12),
      fill = "grey90",
      lineheight = .9
    ),
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
g +
  ggtitle("TfL bike sharing trends in 2015 and 2016 by season for day and night periods") +
  theme(
    plot.title = ggtext::element_textbox_simple(
      margin = margin(t = 12, b = 12),
      padding = margin(rep(12, 4)),
      fill = "grey90",
      box.color = "grey40",
      r = unit(9, "pt"),
      halign = .5,
      face = "bold",
      lineheight = .9
    ),
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext"
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext",
    size = 6,
    color = "firebrick",
    fontface = "bold",
    lineheight = .9
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = c(90, 50),
    y = c(27.5, 3.5),
    label = c("Text A", "Text B"),
    color = c("black", "firebrick"),
    size = c(5, 10),
    fontface = c("plain", "bold")
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "rect",
    xmin = -Inf,
    xmax = 60,
    ymin = 20,
    ymax = Inf,
    fill = "#663399"
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  annotate(
    geom = "rect",
    xmin = -Inf,
    xmax = 60,
    ymin = 20,
    ymax = Inf,
    fill = "#663399"
  ) +
  geom_point(size = 2, color = "grey")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext",
    size = 6,
    lineheight = .9
  ) +
  annotate(
    geom = "segment",
    x = 90, xend = 82,
    y = 25, yend = 18.5
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext",
    size = 6,
    lineheight = .9
  ) +
  annotate(
    geom = "curve",
    x = 90, xend = 82,
    y = 25, yend = 18.5
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext",
    size = 6,
    lineheight = .9
  ) +
  annotate(
    geom = "curve",
    x = 90, xend = 82,
    y = 25, yend = 18.5,
    curvature = -.3,
    arrow = arrow()
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext",
    size = 6,
    lineheight = .9
  ) +
  annotate(
    geom = "curve",
    x = 90, xend = 82,
    y = 25, yend = 18.5,
    curvature = -.3,
    arrow = arrow(
      length = unit(10, "pt"),
      type = "closed",
      ends = "both"
    )
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(humidity, temp)) +
  geom_point(size = 2, color = "grey") +
  annotate(
    geom = "text",
    x = 90,
    y = 27.5,
    label = "Some\nadditional\ntext",
    size = 6,
    lineheight = .9
  ) +
  annotate(
    geom = "curve",
    x = 94, xend = 82,
    y = 26, yend = 18.5,
    curvature = -.8,
    angle = 140,
    arrow = arrow(
      length = unit(10, "pt"),
      type = "closed"
    )
  )


## -----------------------------------------------------------------------------
g <- ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5)


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  geom_text(
    aes(label = season),
    nudge_x = .3,
    hjust = 0
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  geom_label(
    aes(label = season),
    nudge_x = .3,
    hjust = 0
  )


## -----------------------------------------------------------------------------
set.seed(20220726)


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  ggrepel::geom_text_repel(
    aes(label = season)
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp,
        color = season == "summer")
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  ggrepel::geom_text_repel(
    aes(label = str_to_title(season))
  ) +
  scale_color_manual(
    values = c("firebrick", "black"),
    guide = "none"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp,
        color = season == "summer")
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  ggrepel::geom_text_repel(
    aes(label = str_to_title(season)),
    ## space between points + labels
    box.padding = .4,
    ## always draw segments
    min.segment.length = 0
  ) +
  scale_color_manual(
    values = c("firebrick", "black"),
    guide = "none"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp,
        color = season == "summer")
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  ggrepel::geom_text_repel(
    aes(label = str_to_title(season)),
    ## force to the right
    xlim = c(NA, 35), hjust = 1
  ) +
  scale_color_manual(
    values = c("firebrick", "black"),
    guide = "none"
  ) +
  xlim(25, NA)


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp,
        color = season == "summer")
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  ggrepel::geom_text_repel(
    aes(label = str_to_title(season)),
    ## force to the right
    xlim = c(NA, 35),
    ## style segment
    segment.curvature = .01,
    arrow = arrow(length = unit(.02, "npc"), type = "closed")
  ) +
  scale_color_manual(
    values = c("firebrick", "black"),
    guide = "none"
  ) +
  xlim(25, NA)


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp >= 27),
    aes(x = humidity, y = temp,
        color = season == "summer")
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point(size = 2.5) +
  ggrepel::geom_text_repel(
    aes(label = str_to_title(season)),
    ## force to the right
    xlim = c(NA, 35),
    ## style segment
    segment.curvature = .001,
    segment.inflect = TRUE
  ) +
  scale_color_manual(
    values = c("firebrick", "black"),
    guide = "none"
  ) +
  xlim(25, NA)


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp > 20 & season != "summer"),
    aes(x = humidity, y = temp,
        color = season)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point() +
  scale_color_brewer(
    palette = "Dark2",
    guide = "none"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp > 20 & season != "summer"),
    aes(x = humidity, y = temp,
        color = season)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point() +
  ggforce::geom_mark_rect(
    aes(label = str_to_title(season))
  ) +
  scale_color_brewer(
    palette = "Dark2",
    guide = "none"
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp > 20 & season != "summer"),
    aes(x = humidity, y = temp,
        color = season)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point() +
  ggforce::geom_mark_rect(
    aes(label = str_to_title(season))
  ) +
  scale_color_brewer(
    palette = "Dark2",
    guide = "none"
  ) +
  ylim(NA, 35)


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, temp > 20 & season != "summer"),
    aes(x = humidity, y = temp,
        color = season)
  ) +
  geom_point(
    data = bikes,
    color = "grey65", alpha = .3
  ) +
  geom_point() +
  ggforce::geom_mark_rect(
    aes(label = str_to_title(season)),
    expand = unit(5, "pt"),
    radius = unit(0, "pt"),
    con.cap = unit(0, "pt"),
    label.buffer = unit(15, "pt"),
    con.type = "straight",
    label.fill = "transparent"
  ) +
  scale_color_brewer(
    palette = "Dark2",
    guide = "none"
  ) +
  ylim(NA, 35)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = humidity, y = temp,
        color = season == "summer")
  ) +
  geom_point(alpha = .4) +
  ggforce::geom_mark_hull(
    aes(label = str_to_title(season),
        filter = season == "summer",
        description = "June to August"),
    expand = unit(10, "pt")
  ) +
  scale_color_manual(
    values = c("grey65", "firebrick"),
    guide = "none"
  )


## -----------------------------------------------------------------------------
url <- "https://d33wubrfki0l68.cloudfront.net/dbb07b06a7b3fe056db386fef0b158cc2fd33cb9/8b491/assets/img/2022conf/logo-rstudio-conf.png"
img <- magick::image_read(url)
img <- magick::image_negate(img)

img


## -----------------------------------------------------------------------------
ggplot(bikes, aes(date, temp_feel)) +
  annotation_custom(
    grid::rasterGrob(
      image = img
    )
  ) +
  geom_point(color = "#71a5d4")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(date, temp_feel)) +
  annotation_custom(
    grid::rasterGrob(
      image = img,
      x = .5,
      y = .9,
      width = .9
    )
  ) +
  geom_point(color = "#71a5d4") +
  ylim(NA, 37)


## -----------------------------------------------------------------------------
ggplot(bikes, aes(date, temp_feel)) +
  annotation_custom(
    grid::rasterGrob(
      image = img,
      x = .47,
      y = 1.15,
      width = .9
    )
  ) +
  geom_point(color = "#71a5d4") +
  coord_cartesian(clip = "off") +
  theme(
    plot.margin = margin(90, 10, 10, 10)
  )

