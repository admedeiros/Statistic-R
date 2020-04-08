dados<- read.table("pim.txt", h=T, dec=",")
dados
library("FactoMineR")
library("factoextra")

dados.pca <- PCA(dados[,-10], scale.=TRUE, graph = FALSE)
fviz_eig(dados.pca)


#OPÇÃO 2 DE VETORES
fviz_pca_var(dados.pca,axes = c(1,2),
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
             )


fviz_pca_biplot(dados.pca,
geom.ind = c("point", "text"),
col.ind = dados$Cultivar, palette = "jco",
addEllipses = TRUE, label = "var",
col.var = "black", repel = TRUE,
legend.title = "Grupos")


fviz_pca_biplot(dados.pca,
# Fill individuals by groups
geom.ind = c("point", "text"),
pointshape =22,
pointsize = 2.5,
fill.ind = dados$Cor_do_Fruto,
addEllipses = TRUE, ellipse.type = "convex",
col.ind = "black",
# Color variable by groups
col.var = factor(c("Fisiológica","Fisiológica","Fisiológica","Fisiológica","Física",
"Física","Física","Física","Física")),
legend.title = list(fill = "Grupos", color = "Clusters"),
repel = TRUE # Avoid label overplotting
)+
ggpubr::fill_palette("jco")+ # Indiviual fill color
ggpubr::color_palette("npg") # Variable colors




library(pca3d)
pca <- prcomp(dados[,-15], scale.=TRUE)
gr <- factor(dados[,15])

pca3d(pca, group=gr)
snapshotPCA3d(file="first_plot.png")

dados.pca <- PCA(dados[,-15], graph = FALSE)
fviz_eig(dados.pca)

