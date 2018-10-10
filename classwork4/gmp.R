#Загрузите данные в датафрейм
gmp <- read.table("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2018/master/data/gmp.dat")
gmp$pop <- gmp$gmp/gmp$pcgmp
plot(pcgmp~pop, data=gmp, xlab="Население", log="xy",ylab="Доход на душу населения ($/человеко-год)", main="Метрополии США, 2006")

#Нахождение коэффициента a
#Inputs: a-начальное значение к-та, y0-масштабирующий к-т,
#response-подушевой доход, predictor-население, maximum.iterations-макс. число итераций,
#step.scale-шаг приближения, stopping.deriv-параметр окончания цикла
#Outputs: fit - список(a, iterations-число итераций, converged-флаг сходимости)
estimate.scaling.exponent <- function(a, y0=6611, response=gmp$pcgmp,
                                        predictor = gmp$pop, maximum.iterations=100, deriv.step = 1/100,
                                        step.scale = 1e-12, stopping.deriv = 1/100) {
  mse <- function(a) { mean((response - y0*predictor^a)^2) }
  for (iteration in 1:maximum.iterations) {
    deriv <- (mse(a+deriv.step) - mse(a))/deriv.step
    a <- a - step.scale*deriv
    if (abs(deriv) <= stopping.deriv) { break() }
  }
  fit <- list(a=a,iterations=iteration,
              converged=(iteration < maximum.iterations))
  return(fit)
}

#Пример вызова с начальным значением a
a1 <- estimate.scaling.exponent(0.15)

#С помошью полученного коэффициента постройте кривую (функция curve) зависимости
curve(6611*x^a1$a, log="xy", add=TRUE, col="green", xlab="Население",ylab="Доход на душу населения ($/человеко-год)", main="Метрополии США, 2006")

#Удалите точку из набора исходных данных случайным образом, как изменилось статистическая оценка коэффициента a?
point<-round(runif(1, max=366))
gmp <- gmp[-point,]
a2<-estimate.scaling.exponent(0.15)
a2$a-a1$a
#оценка увеличилась на малую величину - 3.48815e-05

#Запустите оценку несколько раз с разных стартовых точек. Как изменилось значение a?
a0.05 <- estimate.scaling.exponent(0.05)
a0.1 <- estimate.scaling.exponent(0.1)
a0.2 <- estimate.scaling.exponent(0.2)

c(a0.05$a, a0.1$a, a0.2$a) #константа a=0.1210955 не изменилась
c(a0.05$iterations, a0.1$iterations, a0.2$iterations) #количество итераций изменяется

