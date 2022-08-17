# Graphic Design with ggplot2: How to Create Engaging and Complex Visualizations in R

### An rstudio::conf(2022) Workshop by Cédric Scherer[<img src="https://raw.githubusercontent.com/rstudio-conf-2022/ggplot2-graphic-design/main/images/logo.png" align="right" width="150">](https://rstudio-conf-2022.github.io/ggplot2-graphic-design/)

------------------------------------------------------------------------

:spiral_calendar: July 25 and 26, 2022  
:alarm_clock: 09:00 - 17:00  
:hotel: National Harbor 4/5  
:writing_hand: [rstd.io/conf](http://rstd.io/conf)

------------------------------------------------------------------------

# Course Overview

Creating engaging and accessible data visualizations of high quality in an efficient and preferably reproducible way is an essential tool in a data scientist's toolbox. After completing the course, participants will have a solid understanding of data visualization principles and the functionality of the ggplot2 graphics library and helpful extension libraries to create highly customized graphics without the need for post-processing.

We will discuss the main concepts of the grammar of graphics and use hands-on examples to explore ggplot2's utility to create multi-layered, more complex graphs. The workshop covers a short overview of the basics of ggplot2 and quickly focuses on the most important steps and helpful tips to create visually appealing and complex graphics both in theory and practice. The power of ggplot2 will be illustrated with advanced real--life examples that help to understand data visualization principles and useful coding tricks.

The course covers complex code examples that are suited for more experienced ggplot2 users but designed to be informative for participants with minimal prior experience in ggplot2 and data visualization. As part of the training, attendees can download the course material from the course webpage for future reference.

## Learning objectives

-   Understanding the general concepts of ggplot2.
-   Learning the many options of customizing a ggplot.
-   Gaining the major steps need to create engaging graphics.
-   Being able to generate complex plots without th need of post-processing.

## Is this course for me?

This course will be appropriate for you if you answer yes to these questions:

-   Do you aim to build graphics in a fully reproducible way without the need to manually adjust details afterwards?

-   Do you enjoy using the {ggplot2} package but are interested in doing more with it?

-   Would you like to learn how to improve future data visualizations in terms of accessibility, impact, and complexity?


# Instructor

[**Dr. Cédric Scherer**](http://cedricscherer.com/) (he/him) is a graduated computational ecologist with a passion for design. After his PhD, he combined his expertise in analyzing and visualizing large data sets in R with his passion to become an independent data visualization designer and specialist. Cédric has created visualizations across all disciplines, purposes, and styles and regularly teaches data visualization principles, the R programming language, and ggplot2. Due to regular participation in social data challenges such as [#TidyTuesday](https://github.com/rfordatascience/tidytuesday), he is now well known for complex and visually appealing figures, entirely made with ggplot2, that look as if they have been created with a vector design tool.


# Prework

The workshop will also cover the basic logic of ggplot2 and its components. However, some pre-knowledge on how the package works is beneficial for following the examples and for the group exercises. A good overview is provided might by the "First Steps" chapter of the ggplot2 book by Hadley Wickham et al.: [ggplot2-book.org/getting-started.html](https://ggplot2-book.org/getting-started.html)

The example codes and the hands-on workshop parts are run in the Rstudio cloud. Thus, nothing but a laptop is needed.

If you want to run the workshop content locally on your machine, please make sure to install a suitable IDE (Rstudio, VS Code or others), a recent version of R (4.1+) and the following packages and typefaces.

*For Mac OS users:*  
Please make sure that [XQuartz is installed](https://www.xquartz.org/) which is needed to use the cairo pdf device.

### Required Packages

-   **tidyverse packages and friends**
    -   ggplot2, readr, tibble, dplyr, tidyr, forcats, stringr, lubridate, here, systemfonts, scales
-   **extension packages**
    -   ggrepel, ggforce, ggtext, ggdist, ggbeeswarm, gghalves, ggblur, patchwork
-   **color packages**
    -   viridis, RColorBrewer, rcartocolor, scico, ggsci, ggthemes, nord, MetBrewer, colorspace, colorblindr
-   **util packages**
    -   magick, grid, grDevices
-   **data packages**
    -   palmerpenguins, rnaturalearth
-   **rspatial packages**
    -   sf, rmapshaper

#### Run this code to install the packages if needed:

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

## Required Typefaces

We will make use of custom fonts. A lot.  
If you want to follow all contents locally, make sure the following typefaces are installed:

-   Roboto Condensed: [fonts.google.com/specimen/Roboto+Condensed](www.fonts.google.com/specimen/Roboto+Condensed)
-   Cabinet Grotesk: [fontshare.com/fonts/cabinet-grotesk](www.fontshare.com/fonts/cabinet-grotesk)
-   Tabular: [fontshare.com/fonts/tabular](www.fontshare.com/fonts/tabular)
-   Boska: [fontshare.com/fonts/boska](www.fontshare.com/fonts/boska)
-   Pally: [fontshare.com/fonts/pally](www.fontshare.com/fonts/pally)

You can download all typefaces as a single zip file [here](https://github.com/rstudio-conf-2022/ggplot2-graphic-design/raw/main/ggplot2-course-fonts.zip).

------------------------------------------------------------------------

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
