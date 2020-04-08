dados<- read.table("pca.txt", h=T)

round(apply(dados,2,var),2) 

library(factoextra)
res.pca <- prcomp(dados, scale=TRUE); prc.dados

#Visualize autovalores ( scree plot ). Mostrar a porcentagem de variações explicadas por cada componente principal.
fviz_eig(res.pca)

#Gráfico de indivíduos. Indivíduos com um perfil semelhante são agrupados.
fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
             )

#Gráfico de variáveis. Variáveis ??correlacionadas positivas apontam para o mesmo lado da parcela. Variáveis ??negativas correlacionadas apontam para lados opostos do gráfico.
fviz_pca_var(res.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
             )

#Biplot de indivíduos e variáveis
fviz_pca_biplot(res.pca, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
                )


#Acesso aos resultados do PCA
library(factoextra)
# Eigenvalues
eig.val <- get_eigenvalue(res.pca)
eig.val
  
# Results for Variables
res.var <- get_pca_var(res.pca)
res.var$coord          # Coordinates
res.var$contrib        # Contributions to the PCs
res.var$cos2           # Quality of representation 
# Results for individuals
res.ind <- get_pca_ind(res.pca)
res.ind$coord          # Coordinates
res.ind$contrib        # Contributions to the PCs
res.ind$cos2           # Quality of representation 