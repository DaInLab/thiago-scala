library(readxl)
library(dplyr)

planilha <- read_excel("./dados/exercicio8.xls")

conjunto <- data.matrix(planilha)
vet <- as.vector(conjunto)
vet

tabela <- data.frame(t(table(vet)))[,-1]
tabela$vet <- as.numeric(levels(tabela$vet))
tabela <- tabela %>% 
  mutate(Fr = 100*Freq/sum(Freq),
         Fac = cumsum(Freq),
         Xi.Fi = vet*Freq)
tabela
View(tabela)

png(filename = "./graficos/ex8-tabela.png",width=600, height = 800)
t<-tableGrob(tabela)
grid.arrange(t)
dev.off()

png(filename = "./graficos/ex8.png", width = 800, height = 600)
hist(conjunto, main="Exercicio 08", xlab="Altura", ylab="Frequencia", col=rgb(1,0.4,0.8,0.2))
dev.off()

