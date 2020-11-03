## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("efernandezpascual/seedr")

## ----setup--------------------------------------------------------------------
# once installed, load seedr
library(seedr)

## -----------------------------------------------------------------------------
head(centaury, 3)

## -----------------------------------------------------------------------------
cent <- physiodata(d = centaury, # the name of your data object
                   t = "times", # the column with the scoring times
                   x = "temperature", # the column with the experimental treatment,
                   g = "germinated", # the column with the number of germinated seeds,
                   pg = "germinable") # the column with the total number of viable seeds

## -----------------------------------------------------------------------------
summary(cent)

## ----fig.width = 7, fig.height = 5--------------------------------------------
plot(cent)

## ----fig.width = 7, fig.height = 5--------------------------------------------
barplot(cent)

## ----fig.width = 7, fig.height = 5--------------------------------------------
grass <- physiodata(grasses, 
                    x = "psi", # in this dataset the treatment is water potential
                    groups = "species") # this dataset has two different species
plot(grass)

## -----------------------------------------------------------------------------
anisantha <- physiodata(subset(grasses, species == "Anisantha rubens"), # select only one species
                        x = "psi") 
b <- bradford(anisantha$proportions) # bradford() uses the $proportions element within the physiodata object
b

## ----fig.width = 7, fig.height = 5--------------------------------------------
plot(b)

## -----------------------------------------------------------------------------
malva <- physiodata(subset(centaury, population == "La Malva"), # select only one population
                    x = "temperature") 
h <- huidobro(malva$proportions) # huidobro() uses the $proportions element within the physiodata object
h

## ----fig.width = 7, fig.height = 5--------------------------------------------
plot(h)

## -----------------------------------------------------------------------------
m <- physiotime(d = centaury, # the name of your data object
                t = "times", # the column with the scoring times
                x = "temperature", # the column with the experimental treatment,
                g = "germinated", # the column with the number of germinated seeds,
                pg = "germinable", # the column with the total number of viable seeds 
                groups = c("species", "population"), # the columns with grouping variables 
                method = "huidobro") # the model to fit, in this case a thermal time model
m

## -----------------------------------------------------------------------------
summary(m)

## ----fig.width = 7, fig.height = 5--------------------------------------------
plot(m)

