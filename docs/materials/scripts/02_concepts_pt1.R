#------------------------------------------------------------------------------#
#                                                                              #
#                         Graphic Design with ggplot2:                         #
#            How to Create Engaging and Complex Visualizations in R            #
#                                                                              #
#                   Concepts of the {ggplot2} Package Part 1                   #
#                                                                              #
#                              Dr. Cedric Scherer                              #
#                         rstudio::conf(2022) workshop                         #
#                              July 25-26th, 2022                              #
#                                                                              #
#------------------------------------------------------------------------------#



## -----------------------------------------------------------------------------
# install.packages("ggplot2")
# library(ggplot2)

# install.packages("tidyverse")
library(tidyverse)


## -----------------------------------------------------------------------------
bikes <- readr::read_csv(
  here::here("data", "london-bikes-custom.csv"),
  ## or: "https://raw.githubusercontent.com/z3tt/graphic-design-ggplot2/main/data/london-bikes-custom.csv"
  col_types = "Dcfffilllddddc"
)

bikes$season <- forcats::fct_inorder(bikes$season)


## -----------------------------------------------------------------------------
?ggplot


## -----------------------------------------------------------------------------
ggplot(data = bikes)


## -----------------------------------------------------------------------------
ggplot(data = bikes) +
  aes(x = temp_feel, y = count)


## -----------------------------------------------------------------------------
ggplot(data = bikes) +
  aes(x = temp_feel, y = count)

ggplot(data = bikes, mapping = aes(x = temp_feel, y = count))

ggplot(bikes, aes(temp_feel, count))

ggplot(bikes, aes(x = temp_feel, y = count))


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    color = "#28a87d",
    alpha = .5,
    shape = "X",
    stroke = 1,
    size = 4
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    color = "#28a87d",
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = temp_feel > 20),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear"),
    alpha = .5,
    size = 2
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    shape = 18,
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    shape = 5,
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    shape = 9,
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    shape = 23,
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(fill = weather_type == "clear",
        size = count),
    shape = 23,
    color = "black",
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    filter(bikes, !is.na(weather_type)),
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    shape = 18,
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes %>% filter(!is.na(weather_type)),
    aes(x = temp, y = temp_feel)
  ) +
  geom_point(
    aes(color = weather_type == "clear",
        size = count),
    shape = 18,
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  ) +
  geom_smooth(
    aes(group = day_night),
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp_feel, y = count)) +
  stat_smooth(geom = "smooth")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp_feel, y = count)) +
  geom_smooth(stat = "smooth")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = season)) +
  stat_count(geom = "bar")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = season)) +
  geom_bar(stat = "count")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = date, y = temp_feel)) +
  stat_identity(geom = "point")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = date, y = temp_feel)) +
  geom_point(stat = "identity")


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary() 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary(
    fun = mean_se, ## the default
    geom = "pointrange"  ## the default
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  geom_boxplot() +
  stat_summary(
    fun = mean,
    geom = "point",
    color = "#28a87d",
    size = 3
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary(
    fun = mean, 
    fun.max = function(y) mean(y) + sd(y), 
    fun.min = function(y) mean(y) - sd(y) 
  ) 


## -----------------------------------------------------------------------------
g <-
  ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )

class(g)

g$data

$mapping


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2
  )


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2,
    show.legend = FALSE
  )


## -----------------------------------------------------------------------------
g +
  xlab("Feels-like temperature (°F)") +
  ylab("Reported bike shares") +
  ggtitle("TfL bike sharing trends")


## -----------------------------------------------------------------------------
g +
  labs(
    x = "Feels-like temperature (°F)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends"
  )


## -----------------------------------------------------------------------------
g <- g +
  labs(
    x = "Feels-like temperature (°F)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends",
    color = "Season:"
  )

g


## -----------------------------------------------------------------------------
g +
  labs(
    x = "Feels-like temperature (°F)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends",
    subtitle = "Reported bike rents versus feels-like temperature in London",
    caption = "Data: TfL",
    color = "Season:",
    tag = "Fig. 1"
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = "",
    caption = "Data: TfL"
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = NULL,
    caption = "Data: TfL"
  )


## -----------------------------------------------------------------------------
g + theme_light()


## -----------------------------------------------------------------------------
g + theme_minimal()


## -----------------------------------------------------------------------------
g + theme_light(
  base_size = 14,
  base_family = "Roboto Condensed"
)


## -----------------------------------------------------------------------------
theme_set(theme_light())

g


## -----------------------------------------------------------------------------
theme_set(theme_light(
  base_size = 14,
  base_family = "Roboto Condensed"
))

g


## -----------------------------------------------------------------------------
# install.packages("systemfonts")

library(systemfonts)

system_fonts() %>%
  filter(str_detect(family, "Cabinet")) %>%
  pull(name) %>%
  sort()


## -----------------------------------------------------------------------------
register_variant(
  name = "Cabinet Grotesk Black",
  family = "Cabinet Grotesk",
  weight = "heavy",
  features = font_feature(letters = "stylistic")
)


## -----------------------------------------------------------------------------
g +
  theme_light(
    base_size = 18,
    base_family = "Cabinet Grotesk Black"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank()
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "top"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "none"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "top",
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  legend.position = "top",
  plot.title.position = "plot"
)

g


## -----------------------------------------------------------------------------
## ggsave(g, filename = "my_plot.png")


## -----------------------------------------------------------------------------
## ggsave("my_plot.png")


## -----------------------------------------------------------------------------
## ggsave("my_plot.png", width = 8, height = 5, dpi = 600)


## -----------------------------------------------------------------------------
## ggsave("my_plot.pdf", width = 20, height = 12, unit = "cm", device = cairo_pdf)


## -----------------------------------------------------------------------------
## grDevices::cairo_pdf("my_plot.pdf", width = 10, height = 7)
## g
## dev.off()

