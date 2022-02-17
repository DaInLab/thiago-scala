library(readxl)

planilha <- read_excel("./dados/exercicio5.xls")

marcas <- planilha$'Marcas'
np <- planilha$'Nº pessoas'

png(filename = "./graficos/ex5.png", width = 800, height = 600)
barplot(np, main="Exercicio 5", xlab="Marcas", ylab="Pessoas", names.arg = marcas, ylim=c(0, 50), cex.names = 0.8, xaxs = "i", col = rainbow(15))
dev.off()
