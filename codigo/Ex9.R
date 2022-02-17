library(readxl)
library(dplyr)

planilha <- read_excel("./dados/exercicio9.xls")
sal <- planilha$'Salários'

png(filename = "./graficos/ex9.png", width = 800, height = 600)
hist(sal, main="Exercicio 9", xlab="Salarios", ylab="Frequencia", col=rgb(0.1,0.9,0.3,0.6))
dev.off()

tabela <- data.frame(t(table(sal)))[,-1]
tabela$sal <- as.numeric(levels(tabela$sal))
tabela <- tabela %>% 
  mutate(Fr = 100*Freq/sum(Freq),
         Fac = cumsum(Freq),
         Xi.Fi = sal*Freq)
tabela
View(tabela)

png(filename = "./graficos/ex9-tabela.png",width=600, height = 800)
t<-tableGrob(tabela)
grid.arrange(t)
dev.off()
