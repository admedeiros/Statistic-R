# Scrip Daniel

dados
library("FactoMineR")
library("factoextra")

dados.pca <- PCA(dados[,-16], scale.=TRUE, graph = FALSE)
fviz_eig(dados.pca)



fviz_pca_biplot(dados.pca,
title = "Principal Component Analysis",
xlab = "PC1(52.9%)", ylab = "PC2(27.1%)",
geom.ind = c("point", "text"),
pointshape =22,
pointsize = 3,
fill.ind = dados$Cultivar,
addEllipses = T, ellipse.type = "convex",
col.ind = "black",
palette = c("#ff0505", "#999333", "#f4f600","#16623a","#00f6e4","#0c88c2"),
# Color variable by groups
col.var = factor(c("Raios X","Raios X","Raios X","Raios X","Raios X","Raios X","Plântulas",
"Plântulas","Plântulas","Plântulas","Plântulas","Plântulas","Plântulas","Plântulas","Raios X" )),
legend.title = list(fill = "Cultivar", color = "Análises"),
repel = TRUE # Avoid label overplotting
)+ ggpubr::color_palette(c("#369939","#f60000")) # Variable colorse.g.: "npg", "aaas", "lancet", "jco", "ucscgb", "uchicago", "simpsons" and "rickandmorty".

