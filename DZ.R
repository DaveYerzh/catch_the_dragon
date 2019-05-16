library(rio) 
library(tidyverse) 
library(skimr) 
getwd() 
setwd("~/documents/") 
getwd() 
m = import("pr201_marks_leaked.csv", encoding="UTF-8") 
glimpse(m) 
qplot(data = m, x = k3_final) + 
  labs(title = "оценки за КР-3", 
       x = "Оценка за кр", 
       y = "Количество бриллиантов") # гистограмма

skim(m)
view(m)

mu_hat = mean(m$k3_final) #матожидание
glimpse(mu_hat)
mu_hat
sigma_hat = sd(m$k3_final) #стандартное отклонение
sigma_hat
n = nrow(m)
n
se_mu_hat = sigma_hat / sqrt(n) #стандартная ошибка
se_mu_hat
t_crit = qt(0.975, df = n - 1) #квантиль распределения стьюдента
t_crit

left_ci = mu_hat - t_crit * se_mu_hat
right_ci = mu_hat + t_crit * se_mu_hat

left_ci
right_ci

t.test(m$k3_final)
