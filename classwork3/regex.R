#Загрузите данные о землятресениях
anss <- readLines("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2017/master/data/earthquakes_2011.html", warn=FALSE)
#Выберите строки, которые содержат данные с помощью регулярных выражений и функции grep

data <- anss[grep(pattern="^[0-9]{4}/[01][0-9]/[0-9]{2}", anss)]

#Проверьте что все строки (all.equal) в результирующем векторе подходят под шаблон.

all.equal(data, anss[grep(pattern="^[0-9]{4}/[01][0-9]/[0-9]{2}", anss)])



