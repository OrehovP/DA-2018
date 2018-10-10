#Модифицируйте код из предыдущей лекции (функцию estimate.scaling.exponent), чтобы он возвращал список a и y0
#Загрузите данные в датафрейм
gmp <- read.table("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2018/master/data/gmp.dat")
gmp$pop <- gmp$gmp/gmp$pcgmp

#Нахождение коэффициента a
#Inputs: a-начальное значение к-та, y0-масштабирующий к-т,
#response-подушевой доход, predictor-население, maximum.iterations-макс. число итераций,
#step.scale-шаг приближения, stopping.deriv-параметр окончания цикла
#Outputs: fit - список(a, y0)
estimate.scaling.exponent <- function(a, y0=6611, response=gmp$pcgmp,
                                      predictor = gmp$pop, maximum.iterations=100, deriv.step = 1/100,
                                      step.scale = 1e-12, stopping.deriv = 1/100) {
  mse <- function(a) { mean((response - y0*predictor^a)^2) }
  for (iteration in 1:maximum.iterations) {
    deriv <- (mse(a+deriv.step) - mse(a))/deriv.step
    a <- a - step.scale*deriv
    if (abs(deriv) <= stopping.deriv) { break() }
  }
  fit <- list(a=a, y0=y0)
  return(fit)
}

estimate.scaling.exponent(0.15)

#Напишите рекурсивные функции факториала и фибоначчи

#Нахождение факториала
#Inputs: n-число, от которого ищем факториал
#Outputs: значение факториала
factorial <- function(n){
  stopifnot(n > 0, is.numeric(n))
  ifelse(n == 1, return(1), return(n*factorial(n-1)))
}

#Нахождение числа фибоначчи
#Inputs: n-порядковый номер числа
#Outputs: число Фибоначчи
fibonacci <- function(n){
  stopifnot(n > 0, is.numeric(n))
  ifelse(n == 1 || n == 2, return(1), return(fibonacci(n-1)+fibonacci(n-2)))
}
