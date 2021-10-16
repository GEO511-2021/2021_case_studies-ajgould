---
title: "Final Project"
author: "Alex Gould"
date: "10/15/2021"
output: github_document
---



# Introduction to Question
The processes and systems of topography’s influence on the spatial distribution of vegetation is not well understood.  While the topic of topography and spatial distribution of vegetation is expanding, the literature addressing the topographic influence on the composition, occurrence, abundance, assemblage, partitioning, succession, distribution, and niche construction of vegetative communities at fine scales have not been identified. Understanding the conditions acting upon biodiversity, especially at finer scales, is important to the creation of ecological niche models, the protection of resources and ecosystem productivity, and global resilience to climate change.  

## Question
What is the effect of topography (tpi) in montage forests on forest structure and composition? 

# Inspiring Examples

Here are some examples of graphics I would like to create:

## Example 1
![Plots in Bighorn National Forest](https://arcg.is/1LCr950) 
[Plots in Bighorn National Forest](https://arcg.is/1LCr950)

This is part of my original data collection that was made using ArcGIS field maps. This helps demonstrate the spatial component of my plots. This type of graph will be helpful in visualizing the extent of the study area. 


## Example 2
![The Relationship Between PAR and TPI](https://www.frontiersin.org/files/Articles/238568/fpls-08-00549-HTML/image_m/fpls-08-00549-g001.jpg)
[The Relationship Between PAR and TPI](https://www.frontiersin.org/files/Articles/238568/fpls-08-00549-HTML/image_m/fpls-08-00549-g001.jpg)

This graphic would be important in demonstrating if there is a statistical relationship which can be observed between TPI/ topography in montane forests and forest structure/ composition. 

## Example 3
![Lanuse/Land Cover data in Bighorn National Forest](https://databasin.org/datasets/fe0d55e60b464eb2a4a35404474e8691/)
[Lanuse/Land Cover data in Bighorn National Forest](https://databasin.org/datasets/fe0d55e60b464eb2a4a35404474e8691/)

This graph using a culmination of personally collected data and derived data could help demonstrate the knowledge gap of truth at a fine scale (filled/answered by my research) 


## Example 4
![TPI of Study Area](https://www.researchgate.net/publication/328734319_Comparison_of_ASTER_GDEM_and_SRTM_DEM_in_the_Pieniny_National_Park/figures?lo=1)
[TPI of Study Area](https://www.researchgate.net/publication/328734319_Comparison_of_ASTER_GDEM_and_SRTM_DEM_in_the_Pieniny_National_Park/figures?lo=1)

Deriving the TPI in r will help visualize and analyze the topography of the study area and plots. 


# Proposed data sources

The majority of my data will be sources from my field research findings. Some principle data will be derived from the USGS National Map

Tree_Data <- read.csv("~/Documents/Master's Program/GEO 511/Final Project/Final Project\\Thesis_Tree_Data.csv")

Plot_Data <- read.csv("~/Documents/Master's Program/GEO 511/Final Project/Final Project\\Thesis_Plot_Data.csv")

Canopy_Data <- read.csv("~/Documents/Master's Program/GEO 511/Final Project/Final Project\\Thesis_Canopy_Data.csv")

Original DEM
localtif = raster::raster("USGS_13_n45w108_20210615.tif")

[Hydrology Data](https://www.usgs.gov/core-science-systems/ngp/national-hydrography)

# Proposed Methods


```r
library(sf)
library(raster)
library(dplyr)
library(spData)
library(spDataLarge)
library(rayshader)
library(rgl)
library(tmap)    
library(leaflet)
library(ggplot2)
```
The first task after loading my data will be to adjust the coordinate and projection systems of my data, and to create/convert to simple spatial features. This will be done using the SF package, in addition to the spData and spDataLarge packages

The second task in my methods is joining my data sets into one table. This will be done with the dplyr package and will allow me to work with my data easily

The next task in my methodology will be to generate the map of my study area and plots. I can do this in 3D using Rayshader, or 2D but interactive maps with ggplot, tmap, or leaflet

Following the creation of my plots, I will derive TPI for my plots using the raster package. 

The next steps will be to run ANOVA to determine the relationship/ significance of TPI on species composition (species and abundance) and on forest structure (tree species data, DBH and canopy cover data)


# Expected results
1. One table with all of my data joined together

 2a. Graphs of landuse/ land cover for study area and plots

2b. Graphs of DEM, slope angle, slope aspect and change in elevation 

3. Derived and mapped TPI

4. Graphs of tree species present in plot with spatial locations

5. Analysis of variance with the aov() function 

6. Graph or map demonstrating the correlation between tpi and species composition 

7. Graph or map demonstrating the correlation between tpi and forest structure (including canopy cover, tree species, dbh)

8. 3D plot of sites

