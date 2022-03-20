library(readxl)
library(ggplot2)
library(gridExtra)
library(RColorBrewer)

planilha <- read_excel("./dados/exercicio2.xls")

tabelafreq <- as.data.frame(table(planilha))
print(paste("Frequencias: ", tabelafreq))

Calcmoda <- function(value) {
  valorunico <- unique(value)
  valorunico[which.max(tabulate(match(value, valorunico)))]
}

media <- mean(planilha$'Casas')
mediana <- median(planilha$'Casas')
moda <- Calcmoda(planilha$'Casas')
variancia <- var(planilha$'Casas')
desvio <- sd(planilha$'Casas')

nomecalculos <- c("Media", "Mediana", "Moda")
valorcalculos <- c(media, mediana, moda)

nomeCalculos <- c("Variancia", "Desvio Padrao")
valorCalculos <- c(variancia, desvio)

png(filename = "./graficos/ex2-tabela.png", height=1000, width=400)
t<- tableGrob(tabelafreq)
grid.arrange(t)
dev.off()

png(filename = "./graficos/ex2-1.png", width = 1000, height = 800)
barplot(valorcalculos, main="Medidas de Posicao", xlab="Taxas", ylab="Resultado", names.arg = nomecalculos, beside=TRUE, ylim=range(pretty(c(0, variancia))), cex.names = 0.9, xaxs = "i", col = rainbow(20))
dev.off()

png(filename = "./graficos/ex2-2.png", width = 1000, height = 800)
barplot(valorCalculos, main="Medidas de Dispersao", xlab="Taxas", ylab="Resultado", names.arg = nomeCalculos, beside=TRUE, ylim=range(pretty(c(0, desvio))), cex.names = 0.9, xaxs = "i", col = rainbow(20))
dev.off()

