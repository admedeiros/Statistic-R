#limpar dados
ls()# lista todos os objetos criados
remove(list=ls(all=TRUE)) #remove todos objetos criados
ls()


# load packages
library(FactoMineR)
library(factoextra)



# read data
dados <- read.table("dados.txt", h=T)
dados$impedance<-as.factor(dados$impedance)
#row.names(dados) <- dados$treat


# PCA
# Nessa parte do código "PCA(dados[(4:14)]" o 4 representa a coluna onde meus dados brutos inicia e o 14 é o número total colunas da minha tabela de análise ou dados.
dados_pca <- PCA(dados[(1:18)], scale=TRUE, graph = FALSE)
fviz_eig(dados_pca)
get_eig(dados_pca)


xlab = "PC1(42.4%)"
ylab = "PC2(23.3%)"


fviz_pca_biplot(dados_pca,
                xlab = "PC1(56.9%)",
                ylab = "PC2(18.5%)",
                geom.ind = c("point", "text"),
                pointshape =22,
                pointsize = 3,
                label = c("ind", "var"),
                fill.ind = dados$impedance,
                addEllipses = F, ellipse.type = "confidence",
                col.ind = "black",
                palette = c( "#458b00","darkblue", "#fb1616"),
                mean.point = FALSE,
                # Color variable by groups
                col.var = 'black',
                alpha.var= "contrib",
                gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
                legend.title = "Treatment",
                repel = TRUE)+ theme_minimal()
 
