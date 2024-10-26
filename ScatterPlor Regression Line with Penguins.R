## Scatterplots in R
library(tidyverse)
library(modeldata)

View(penguins)

#basic plot
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) +
  geom_point()

#adding a non straight regression line
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) +
  geom_point() +
  geom_smooth()

#improving the line, making it straight
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE)

#playing with points and the colors
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) +
  geom_point(size=2, color="red", shape="square", alpha=0.5) +
  geom_smooth(method = "lm", se=FALSE, color="blue")


#now get back to basic scatterplot
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE)

#linnearmodel funcntion, 0.2548 is the slope
lm(bill_length_mm ~ flipper_length_mm, data = penguins)


#coloring islands and adding color blind friendly color palette
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = island)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")

#coloring species
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")
#this is a more clear grouping when checked the plot

#seperate regression lines for each group annd adding labels
ggplot(penguins, aes(x = flipper_length_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE) +
  scale_color_brewer(palette = "Dark2") +
  labs(x = "Flipper length",
       y = "Bill length",
       color = "Species",
       title = "Penguin measurements")+
  theme_minimal()
#theme_minimal erase the grey background













