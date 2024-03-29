library(ggplot2)
library(dplyr)
library(patchwork)
library(knitr)

######################################################
### Función de escalonada
######################################################

escalonada <- function(x) { ifelse(x<0,0,1) }

x <- seq(-6,6,0.1)
y <- escalonada(x)    

plotEscalonada <-  
    data.frame(x=x,y=y) %>% 
    ggplot(aes(x=x,y=y)) + 
    geom_line() + 
    xlab('X') + 
    ylab('Y') +
    ggtitle('Función escalonada')

######################################################
### Función de activación sigmoide
######################################################

sigmoide <- function(x) {(1)/(1+exp(-x))}
x <- seq(-6,6,0.1)
y <- sigmoide(x)    

plotSigmoide <- 
    data.frame(x=x,y=y) %>% 
    ggplot(aes(x=x,y=y)) + 
    geom_line() + 
    xlab('X') + 
    ylab('Y') + 
    ggtitle('Función sigmoide')


######################################################
### Función de activación tangente hiperbolica
######################################################

hiperbolica <- function(x) { (((2)/(1+exp(-2*x)))-1) }
x <- seq(-6,6,0.1)
y <- hiperbolica(x)    

plotHiperbolica <- 
    data.frame(x=x,y=y) %>% 
    ggplot(aes(x=x,y=y)) + 
    geom_line() + 
    xlab('X') + 
    ylab('Y') + 
    ggtitle('Función tangente hiperbolica')

######################################################
### Función de activación ReLU – Rectified Lineal Unit
######################################################

relu <- function(x) { ifelse(x<0,0,x) }

x <- seq(-6,6,0.1)
y <- relu(x)    

plotRelu <-  
    data.frame(x=x,y=y) %>% 
    ggplot(aes(x=x,y=y)) + 
    geom_line() + 
    xlab('X') + 
    ylab('Y') +
    ggtitle('Función ReLu')

######################################################
### Función de activación Leaky ReLU 
######################################################

leakyRelu <- function(x,a) { ifelse(x<0,0,x*a) }

x <- seq(-6,6,0.1)
y <- leakyRelu(x,0.01)    

plotLeakyRelu <-  
    data.frame(x=x,y=y) %>% 
    ggplot(aes(x=x,y=y)) + 
    geom_line() + 
    xlab('X') + 
    ylab('Y') +
    ggtitle('Función Leaky relu')

######################################################
### Función de activación Softmax
######################################################

softmax <- function(par){
    n.par <- length(par)
    par1 <- sort(par, decreasing = TRUE)
    Lk <- par1[1]
    for (k in 1:(n.par-1)) {
        Lk <- max(par1[k+1], Lk) + log1p(exp(-abs(par1[k+1] - Lk))) 
    }
    val <- exp(par - Lk)
    return(val)
}

x <- seq(-6,6,0.1)
y <- softmax(x)    

plotSoftmax <-  
    data.frame(x=x,y=y) %>% 
    ggplot(aes(x=x,y=y)) + 
    geom_line() + 
    xlab('X') + 
    ylab('Y') +
    ggtitle('Función Softmax')

######################################################
### GRAFICO UNIDO
######################################################
(plotEscalonada+plotSigmoide)/(plotHiperbolica+plotRelu)/(plotLeakyRelu+plotSoftmax)

