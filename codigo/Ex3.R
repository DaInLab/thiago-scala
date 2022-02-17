library("writexl")

numFilhos <- c(0, 1, 2, 3, 4, 5,"5+")
nf <- c(0, 1, 2, 3, 5,6)
familias <- c(17, 20, 28, 19, 7, 4, 5)

tabela <- data.frame("Filhos" = numFilhos, "Famílias" = familias)
tabela
View(tabela)

write_xlsx(tabela,"./dados/exercicio3.xlsx")

mediana <- median(nf)
moda <- c(2)

print(paste("Moda: ", moda))
print(paste("Mediana: ", mediana))

nome <- c("Mediana", "Moda")
valor <- c(mediana, moda)

png(filename = "./graficos/ex3.png", width =800, height = 600)
barplot(valor, main="Exercício 03", xlab="Taxas", ylab="Resultado", names.arg = nome, beside=TRUE, ylim=range(pretty(c(0, valor))), cex.names = 0.9, xaxs = "i", col = rainbow(10))
dev.off()
