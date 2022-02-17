library(readxl)

planilha <- read_excel("./dados/exercicio1.xls")

media <- mean(planilha$'Taxas de juros')
mediana <- median(planilha$'Taxas de juros')
variancia <- var(planilha$'Taxas de juros')
desvioPadrao <- sd(planilha$'Taxas de juros')
minimo <- min(planilha$'Taxas de juros')
maximo <- max(planilha$'Taxas de juros')
Q1 <- quantile(planilha$'Taxas de juros', probs = 0.25)
Q3 <- quantile(planilha$'Taxas de juros', probs = 0.75)


print(paste("Media: ", media))
print(paste("Mediana: ", mediana))
print(paste("Variancia: ", variancia))
print(paste("Desvio Padrao: ", desvioPadrao))
print(paste("Valor Minimo: ", minimo))
print(paste("Valor Maximo: ", maximo))
print(paste("Primeiro Quartil: ", Q1))
print(paste("Terceiro Quartil: ", Q3))

nomecalculos <- c("Media", "Mediana", "Variancia", "D.Padrao", "Minimo", "Maximo", "Q1", "Q3")
valorcalculos <- c(media, mediana, variancia, desvioPadrao, minimo, maximo, Q1, Q3)

if(!"RColorBrewer" %in% installed.packages()) install.packages("RColorBrewer")
png(filename = "./graficos/ex1.png", width = 900, height = 700)
barplot(valorcalculos, main="Exercicio 1", xlab="Calculos", ylab="Taxas de juros", names.arg = nomecalculos, ylim=c(0, 3), cex.names = 0.8, xaxs = "i", col = rainbow(30))
dev.off()
