# Урал (Домашние матчи)
ural_home <- c(2, 0, 1, 0)

# Выездные
ural_away <- c(0, 0, 1, 1)

#Напечатайте на консоль оба вектора

print(ural_home)
# 2 0 1 0
print(ural_away)
# 0 0 1 1

# Назначим имена элеметом вектора (Команды Гости)
names(ural_home) <- c("Ufa", "CSKA", "Arsenal", "Anzhi")

#Проделайте то же самое для вектора ural_away назначив имена команд гостей (away_names)
away_names <- c("Rostov", "Amkar", "Rubin", "Orenburg")
names(ural_away) <- away_names

#Напечатайте на консоль оба вектора, заметьте разницу

ural_home
# Ufa    CSKA Arsenal   Anzhi 
#   2       0       1       0

ural_away
# Rostov    Amkar    Rubin Orenburg 
#      0        0        1        1 

#Посчитайте статистикку домашних и выездных матчей (общее кол-во голов, среднее количество голов)

sum(ural_home)
# 3
mean(ural_home)
# 0.75

sum(ural_away)
# 2
mean(ural_away)
# 0.5

#сравните векторы ural_home и ural_away и сделайте вывод

# Вывод: Урал лучше играет дома