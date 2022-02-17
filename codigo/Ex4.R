library(readxl)
library(dplyr)
library(ggplot2)
library(gridExtra)

planilha <- read_excel("./dados/exercicio4.xls")
sal <- planilha$'Salários'

png(filename = "./graficos/ex4.png", width = 800, height = 600)
hist(sal, main="Exercicio 04", xlab="Salarios", ylab="Frequencia", col=rgb(0.5,0.4,0.7,0.1))
dev.off()

tabela <- data.frame(t(table(sal)))[,-1]
tabela$sal <- as.numeric(levels(tabela$sal))
tabela <- tabela %>% 
  mutate(Fr = 100*Freq/sum(Freq),
         Fac = cumsum(Freq),
         Xi.Fi = sal*Freq)
tabela
View(tabela)

png(filename = "./graficos/ex4-tabela.png",width=600, height = 800)
t<-tableGrob(tabela)
grid.arrange(t)
dev.off()
