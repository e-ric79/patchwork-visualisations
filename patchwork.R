# Load required libraries
library(tidyverse)  # For data manipulation and ggplot2
library(patchwork) # For combining multiple ggplots into a single layout

# Create scatter plot (p1): engine displacement vs highway mileage, colored by class, faceted by drive type
p1<-ggplot(mpg,aes(x=displ,y=hwy))+
  geom_point(show.legend=FALSE,aes(color=class))+ # Scatter plot with color by class 
  facet_wrap(~drv)+  # Create separate plots for each drive type (drv)
  labs(
    title = "p1"  # Title for this subplot
  )

# Create boxplot (p2): engine displacement vs drive type
p2<-ggplot(mpg,aes(x=displ,y=drv))+
  geom_boxplot(show.legend = FALSE)+ #Boxplot
  labs(
    title = "p2" #Title for this boxplot
  )

# Create density plot (p3): city mileage distribution, filled and colored by drive type
p3<-ggplot(mpg,aes(x=cty,fill=drv,color=drv))+
  geom_density(alpha=0.5)+  # Semi-transparent density plot
  labs(
    title="p3"  # Title for this subplot
  )

# Create density plot (p4): highway mileage distribution, filled and colored by drive type
p4<-ggplot(mpg,aes(x=hwy,fill=drv,color=drv))+
  geom_density(alpha=0.5)+ # Similar to p3 but for highway mileage
  labs(
    title = "p4" #Title for this subplot
  )

# Combine all plots using patchwork layout
(guide_area()/(p2+p3)/p4/p1)+ # Stack guide area, p2+p3 side by side, then p4, then p1
  plot_annotation(
    title = "city and highway mileage for cars with different drive head",  # Overall title
    caption="https:\\drive train.com" 
  )+
  plot_layout(
    guides="collect", # Collect legends in a common guide area
    heights=c(1,3,2,4) # Define relative heights of each row
  )&
  theme(legend.position = "top") # Apply shared theme: legend on top