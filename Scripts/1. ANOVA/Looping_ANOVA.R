#Method I
detach(dados)
dados=read.table("Dados.txt",head=TRUE)
str(dados)
dados
attach(dados)

#install.packages("ExpDes.pt")
require(ExpDes.pt)

col_inicial<-2 # coluna em que inicia as variaveis respostas
for(i in col_inicial:ncol(dados))
{
cat("\n","Variável = ",i-1,"\n") # tirar as colunas que nao tem as variaveis respostas
   
 dic(Trat, dados[,i], quali = c(TRUE), mcomp = "sk", sigT = 0.05, sigF = 0.05)

}


#Plots
data<-read.table("braqui.txt", h=T)
data
my_comparisons <- list(c("Automatizado", "Manual"))

library(ggpubr)
library(ggplot2)

# Create the box plot. Change colors by groups: Species
# Add jitter points and change the shape by groups

ggboxplot(data, x = "Método", y = "Mean",
  color = "Método", palette = c("#00AFBB", "#53fd10"),
  add = "jitter"
  )+   stat_compare_means(comparisons = my_comparisons, method = "t.test")