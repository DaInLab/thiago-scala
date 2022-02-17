library(readxl)

planilha <- read_excel("./dados/exercicio7.xls")

area <- planilha$'Áreas'
atend <- planilha$'Atendimento'

png(filename = "./graficos/ex7.png", width = 800, height = 600)
barplot(atend, main="Exercicio 7", xlab="Areas", ylab="Atendimentos", names.arg = area, ylim=c(0, 400), cex.names = 0.8, xaxs = "i", col = rainbow(12))
dev.off()
