Graphic Design with ggplot2: How to Create Engaging and Complex Visualizations in R
================

### rstudio::conf 2022

by Cédric Scherer

-----

:spiral_calendar: July 25 and 26, 2022  
:alarm_clock:     09:00 - 17:00  
:hotel:           National Harbor 4/5  
:writing_hand:    [rstd.io/conf](http://rstd.io/conf)

-----

## Overview

Creating engaging and accessible data visualizations of high quality in an efficient and preferably reproducible way is an essential tool in a data scientist's toolbox. After completing the course, participants will have a solid understanding of data visualization principles and the functionality of the ggplot2 graphics library and helpful extension libraries to create highly customized graphics without the need for post-processing.

We will discuss the main concepts of the grammar of graphics and use hands-on examples to explore ggplot2’s utility to create multi-layered, more complex graphs. The workshop covers a short overview of the basics of ggplot2 and quickly focuses on the most important steps and helpful tips to create visually appealing and complex graphics both in theory and practice. The power of ggplot2 will be illustrated with advanced real–life examples that help to understand data visualization principles and useful coding tricks.

The course covers complex code examples that are suited for more experienced ggplot2 users but designed to be informative for participants with minimal prior experience in ggplot2 and data visualization. As part of the training, attendees can download the course material from the course webpage for future reference.

## Learning objectives

* Understanding the general concepts of ggplot2.
* Learning the many options of customizing a ggplot.
* Gaining the major steps need to create engaging graphics.
* Being able to generate complex plots without th need of post-processing.

## Is this course for me?

This course will be appropriate for you if you answer yes to these questions:

- Do you aim to build graphics in a fully reproducible way without the need to manually adjust details afterwards?

- Do you enjoy using the {ggplot2} package but are interested in doing more with it?

- Would you like to learn how to improve future data visualizations in terms of accessibility, impact, and complexity?

## Prework
The workshop will also cover the basic logic of ggplot2 and its compontents. However, some pre-knowledge on how the package works is beneficial for following the examples and for the group exercises. A good overview is provided  might by the “First Steps” chapter of the ggplot2 book by Hadley Wickham et al.: https://ggplot2-book.org/getting-started.html

## Requirements

The example codes and the hands-on workshop parts are run in the Rstudio cloud. Thus, nothing but a laptop is needed.

If you want to run  the workshop content locally on youre machine, please make sure to install a suitable IDE (Rstudio, VS Code or others), a recent version of R (4.1+) and the following packages and typefaces.

### R Packages Installation

- tidyverse
  - ggplot2
  - readr
  - tibble
  - dplyr
  - tidyr
  - forcats
  - stringr
- lubridate
- here
- systemfonts
- magick
- scales
- grid
- grDevices
- viridis
- colorblindr
- colorspace
- RColorBrewer
- rcartocolor
- scico
- ggsci
- ggthemes
- nord
- MetBrewer
- ggrepel
- ggforce
- ggtext
- ggdist
- ggbeeswarm
- gghalves
- ggblur
- patchwork
- palmerpenguins
- rnaturalearth
- sf
- rmapshaper

#### Run this code to install the packages if needed:

```
packages <- c(
  "ggplot2", "readr", "tibble", "tidyr", "forcats", "stringr",
  "lubridate", "here", "systemfonts", "magick", "scales", "grid",
  "grDevices", "colorspace", "viridis", "RColorBrewer", "rcartocolor",
  "scico", "ggsci", "ggthemes", "nord", "MetBrewer", "ggrepel",
  "ggforce", "ggtext", "ggdist", "ggbeeswarm", "gghalves", "patchwork", 
  "palmerpenguins", "rnaturalearth", "sf", "rmapshaper", "devtools"
)

install.packages(setdiff(packages, rownames(installed.packages())))  

## install {colorblindr} and requirements
remotes::install_github("wilkelab/cowplot")
remotes::install_github("clauswilke/colorblindr")

## not strictly needed but a nice package for a bonus solution
devtools::install_github("coolbutuseless/ggblur")
```

### Typeface Installation

We will make use of custom fonts. If you want to follow all contents, make sure the following typefaces are installed:

- Roboto Condensed: [fonts.google.com/specimen/Roboto+Condensed](www.fonts.google.com/specimen/Roboto+Condensed)
- Cabinet Grotesk: [fontshare.com/fonts/cabinet-grotesk](www.fontshare.com/fonts/cabinet-grotesk)
- Tabular: [fontshare.com/fonts/tabular](www.fontshare.com/fonts/tabular)
- Boska: [fontshare.com/fonts/boska](www.fontshare.com/fonts/boska)
- Pally: [fontshare.com/fonts/pally](www.fontshare.com/fonts/pally)


*For Mac  OS users:* Please make sure that [XQuartz is installed](https://www.xquartz.org/) which is needed to use the cairo pdf device.

## Schedule

### Day 1

| Time          | Activity         |
| :------------ | :--------------- |
| 09:00 - 09:30 | Introduction     |
| 09:30 - 10:30 | Concepts Pt. 1   |
| 10:30 - 11:00 | *Coffee break*   |
| 11:00 - 12:00 | Concepts Pt. 1 (continued) |
| 12:00 - 12:30 | Concepts Pt. 2   |
| 12:30 - 13:30 | *Lunch break*    |
| 13:30 - 15:00 | Concepts Pt. 2 (continued) |
| 15:00 - 15:30 | *Coffee break*   |
| 15:30 - 17:00 | Data Communication |

### Day 2

| Time          | Activity         |
| :------------ | :--------------- |
| 09:00 - 10:30 | Labels and Annotations |
| 10:30 - 11:00 | *Coffee break*   |
| 11:00 - 12:30 | Colors           |
| 12:30 - 13:30 | *Lunch break*    |
| 13:30 - 15:00 | Layout and Composition|
| 15:00 - 15:30 | *Coffee break*   |
| 15:30 - 17:00 | Group Project    |

## Instructor

Cédric Scherer is a graduated computational ecologist with a passion for design. After his PhD, he combined his expertise in analyzing and visualizing large data sets in R with his passion to become an independent data visualization designer and specialist. Cédric has created visualizations across all disciplines, purposes, and styles and regularly teaches data visualization principles, the R programing language, and ggplot2. Due to regular participation in social data challenges such as #TidyTuesday, he is now well known for complex and visually appealing figures, entirely made with ggplot2, that look as if they have been created with a vector design tool.

-----

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
