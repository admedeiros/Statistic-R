dados<- read.table("dadosca.txt", h=T, dec=",")
dados
library("FactoMineR")
library("factoextra")

dados.pca <- PCA(dados[,-28], scale.=TRUE, graph = FALSE)
fviz_eig(dados.pca)


fviz_pca_biplot(dados.pca,
title = "Principal Component Analysis",
xlab = "PC1(69.6%)", ylab = "PC2(14.8%)",
geom.ind = c("point", "text"),
pointshape =22,
pointsize = 3,
fill.ind = dados$Cor,
addEllipses = T, ellipse.type = "confidence",
col.ind = "black",
palette = c("#E7B800", "#ff8100", "#458b00"),
# Color variable by groups
col.var = factor(c("Fisiológico","Fisiológico","Fisiológico","Fisiológico","Físico",
"Físico","Físico","Físico","Físico","Físico")),
legend.title = list(fill = "Cor do Fruto", color = "Atributo"),
repel = TRUE # Avoid label overplotting
)+ ggpubr::color_palette(c("#3b5998","#ff66c1")) # Variable colorse.g.: "npg", "aaas", "lancet", "jco", "ucscgb", "uchicago", "simpsons" and "rickandmorty".



library(pca3d)
pca <- prcomp(dados[,-15], scale.=TRUE)
gr <- factor(dados[,15])

pca3d(pca, group=gr)
snapshotPCA3d(file="first_plot.png")

dados.pca <- PCA(dados[,-15], graph = FALSE)
fviz_eig(dados.pca)

