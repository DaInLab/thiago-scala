library(qcc)
library(readxl)

planilha <- read_excel("./dados/exercicio6.xls")

pessoas <- planilha$'Nº pessoas'
names(pessoas) <- planilha$'Qualidade'

png(filename = "./graficos/ex6.png", width = 800, height = 600)
graficoPareto <- pareto.chart(pessoas, main="Exercicio 6", ylab2="Frequencia Cumulativa", ylab="Frequencia", col = rainbow(5))
dev.off()
