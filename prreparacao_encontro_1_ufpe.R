# Encontro 1 - UFPE

# Estruturas de dados no R 

## Estruturas de dados

### Variáveis e Vetores
x <- 1 
x
x <- 2 
x
x <- c(1, 2) 
x 
is.vector(x) 
length(x)
x <- c(1:10)
x
x <- seq(1, 50, 5)
x
class(x)
is.numeric(x)
x <- c("TCE", "PE", "Recife") 
x
x[2]
is.numeric(x)
class(x)
is.character(x)
x <- c(1, 2, "Recife") 
class(x)

### Matrizes
m1 <- matrix( c(1,11,2,22,3,33), nrow=3,
              ncol=2,
              byrow=TRUE)

m1 
class(m1) 
dim(m1) 
m1[2,2]
v1 <- c(1,2,3)
v2 <- c(4,5,6)
m2 <- rbind(v1, v2) 
m2
dim(m2)

### Listas

a <- c(1, 2, 3)
b <- c("a", "b", "c", "d")
c <- c(TRUE, FALSE, TRUE, TRUE) 
lista1 <- list(a, b, c)
lista1
lista1[1]
class(lista1[1])
lista1[[1]] 
class(lista1[[1]])
lista1[[2]][1] <- "j"
lista1[[2]]

### Data Frames

bd <- data.frame(id = c(1:5), nivel = c("baixo","medio","alto","medio","alto"), 
                 n.alunos = c(500, 200, 100, 200, 100))
bd 
dim(bd) 
str(bd)
summary(bd) 
bd$nivel 
class(bd$nivel) 
table(bd$nivel)


### Atividade prática em aula:

# O R possui algumas bases de dados para teste. Uma delas é "mtcars". 
head(mtcars)

# Com a base de dados mtcars, obtenha:
# Uma descrição dos tipos de variáveis da base
# Um resumo descritivo da base
# O número de dimensões da base
# Imprima a terceira coluna
# Imprima a segunda linha
# O quarto elemento presente na variável "cyl"

## Exemplo de uso dos operadores

# Soma valores
1+1
# Soma variáveis
x <- 1
y <- 2
x+y
x*y

# Soma vetores
x <- c(1:3)
y <- c(1:3) 
x+y

sum(x)
sum(x) == sum(y) 
sum(x + y)
x+1
# Comparação
1 == 1 
x == y 
x != y

# Comparação
x <- c(1:10) # Atribuindo valores de 1 a 10 a x

x # verificando x

x[(x>8) | (x<5)] # Verificando em x quais elementos são maiores que 8 ou menores que 5 # Comparação

y <- c(1,2,3) # Atribuindo valores de 1 a 3 a y

x %in% y # Verificando quais elementos de x também pertencem a y


# Importação e exportação de dados

# Para fazer a verificação de qual diretório está sendo utilizado, basta usar a função `getwd()`.

getwd()

setwd("./dados/dados_encontro_1_ufpe/")

### Abertura de bases pequenas (ESCOLAS e TURMAS):

turmas <- read.csv2("TURMAS.csv", sep = "|")  # Carregando base de dados

# Verificando aspectos estruturais da base de dados:
  
dim(turmas)  # verificando dimensões da base de dados
names(turmas)[1:10]  # verificando nomes das colunas na base de dados
head(turmas[, 1:5])  # verificando as primeiras 6 linhas da base de dados

### Abertura de bases maiores (MATRÍCULAS e DOCENTES):

install.packages("ffbase", dependencies = TRUE)  # instalando o pacote
require(ffbase)  # carregando o pacote
# definindo diretório
setwd("./dados/")
# carregando base de dados
docentes_ne <- read.csv2.ffdf(file = "DOCENTES_NORDESTE.csv", sep = "|", first.rows=100000)
# verificando estrutura da base de dados
dim(docentes_ne)
docentes_ne[1:5,]
names(docentes_ne)
table.ff(docentes_ne$CO_UF_END)

## Exportação de dados

### Arquivos em formato `ffdf`

# definindo diretório
setwd("./dados/")
save.ffdf(docentes_ne, dir = "./docentes_ne", overwrite = T)
rm(list = ls())  # limpando ambiente de trabalho

# definindo diretório
setwd("./dados/")
load.ffdf(dir="./docentes_ne")

### Arquivos em formato `.RData`

setwd("./dados/")
turmas <- read.csv2("TURMAS.csv", sep = "|")  # Carregando base de dados

# selecionando linhas da base nas quais CO_UF == 26
turmas_pe <- subset(turmas, turmas$CO_UF == "26")

# comparando as bases
dim(turmas)
dim(turmas_pe)

# definindo diretório
setwd("./dados/")

# salvando nova base
save(turmas_pe, file ="turmas_pe.RData")

rm(list = ls())  # limpando ambiente de trabalho

# Para carregar o arquivo salvo, basta:

# definindo diretório
setwd("./dados/")

load("turmas_pe.RData")  # Carregando base de dados

dim(turmas_pe)  # verificando dimensões da base de dados
names(turmas_pe)  # nomes das colunas da base de dados
head(turmas_pe)  # início da base de dados
