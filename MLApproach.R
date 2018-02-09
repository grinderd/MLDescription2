
#Create the data:

library(tidyverse)
library(tibble)
library(dplyr)
library(binaryLogic)

n = 100000 #number of observations


predict <- tibble(x1 = rnorm(n,1,2),
       x2 = rnorm(n,3,4),
       x3 = rnorm(n,5,6),
       x4 = rnorm(n,7,8),
       x5 = abs(rnorm(n,9,10))
       )


y = 1 + predict$x1^2 + predict$x3*predict$x4 + log(predict$x5) +rnorm(n,1,1)

#Building the data frame of all possible variables

squared = predict^2
names(squared) <- c("x1_2","x2_2","x3_2","x4_2","x5_2")
cube = predict^3
names(cube) <- c("x1_3","x2_3","x3_3","x4_3","x5_3")
quart = predict^4
names(quart) <- c("x1_4","x2_4","x3_4","x4_4","x5_4")
logs = log(predict)
names(logs) <- c("x1_l","x2_l","x3_l","x4_l","x5_l")

twice = tibble(
  x12 = predict$x1*predict$x2,
  x13 = predict$x1*predict$x3,
  x14 = predict$x1*predict$x4,
  x15 = predict$x1*predict$x5,
  x23 = predict$x2*predict$x3,
  x24 = predict$x2*predict$x4,
  x25 = predict$x2*predict$x5,
  x34 = predict$x3*predict$x4,
  x35 = predict$x3*predict$x5,
  x45 = predict$x4*predict$x5
)

thrice = tibble(
  x112 = predict$x1*predict$x1*predict$x2,
  x113 = predict$x1*predict$x1*predict$x3,
  x114 = predict$x1*predict$x1*predict$x4,
  x115 = predict$x1*predict$x1*predict$x5,
  x122 = predict$x1*predict$x2*predict$x2,
  x123 = predict$x1*predict$x2*predict$x3,
  x124 = predict$x1*predict$x2*predict$x4,
  x125 = predict$x1*predict$x2*predict$x5,
  x133 = predict$x1*predict$x3*predict$x3,
  x134 = predict$x1*predict$x3*predict$x4,
  x135 = predict$x1*predict$x3*predict$x5,
  x145 = predict$x1*predict$x4*predict$x5,
  x155 = predict$x1*predict$x5*predict$x5,
  
  x223 = predict$x2*predict$x2*predict$x3,
  x224 = predict$x2*predict$x2*predict$x4,
  x225 = predict$x2*predict$x2*predict$x5,
  
  x233 = predict$x2*predict$x3*predict$x3,
  x234 = predict$x2*predict$x3*predict$x4,
  x235 = predict$x2*predict$x3*predict$x5,

  x244 = predict$x2*predict$x4*predict$x4,
  x245 = predict$x2*predict$x4*predict$x5,
  
  x255 = predict$x2*predict$x5*predict$x5,
  
  x334 = predict$x3*predict$x3*predict$x4,
  x335 = predict$x3*predict$x3*predict$x5,
  
  x344 = predict$x3*predict$x4*predict$x4,
  x345 = predict$x3*predict$x4*predict$x5,
  
  x355 = predict$x3*predict$x5*predict$x5,
  
  x445 = predict$x4*predict$x4*predict$x5,
  x455 = predict$x4*predict$x5*predict$x5
  
)

quatro = tibble(
  x1112 = predict$x1*predict$x1*predict$x1*predict$x2,
  x1113 = predict$x1*predict$x1*predict$x1*predict$x3,
  x1114 = predict$x1*predict$x1*predict$x1*predict$x4,
  x1115 = predict$x1*predict$x1*predict$x1*predict$x5,
  
  x1122 = predict$x1*predict$x1*predict$x2*predict$x2,
  x1123 = predict$x1*predict$x1*predict$x2*predict$x3,
  x1124 = predict$x1*predict$x1*predict$x2*predict$x4,
  x1125 = predict$x1*predict$x1*predict$x2*predict$x5,
  
  x1133 = predict$x1*predict$x1*predict$x3*predict$x3,
  x1134 = predict$x1*predict$x1*predict$x3*predict$x4,
  x1135 = predict$x1*predict$x1*predict$x3*predict$x5,

  x1144 = predict$x1*predict$x1*predict$x4*predict$x4,
  x1145 = predict$x1*predict$x1*predict$x4*predict$x5,
  
  x1155 = predict$x1*predict$x1*predict$x5*predict$x5,
  
  x1222 = predict$x1*predict$x2*predict$x2*predict$x2,
  x1223 = predict$x1*predict$x2*predict$x2*predict$x3,
  x1224 = predict$x1*predict$x2*predict$x2*predict$x4,
  x1225 = predict$x1*predict$x2*predict$x2*predict$x5,
  
  x1233 = predict$x1*predict$x2*predict$x3*predict$x3,
  x1234 = predict$x1*predict$x2*predict$x3*predict$x4,
  x1235 = predict$x1*predict$x2*predict$x3*predict$x5,
  
  x1244 = predict$x1*predict$x2*predict$x4*predict$x4,
  x1245 = predict$x1*predict$x2*predict$x4*predict$x5,
  
  x1255 = predict$x1*predict$x2*predict$x5*predict$x5,
  
  x1333 = predict$x1*predict$x3*predict$x3*predict$x3,
  x1334 = predict$x1*predict$x3*predict$x3*predict$x4,
  x1335 = predict$x1*predict$x3*predict$x3*predict$x5,
  
  x1344 = predict$x1*predict$x3*predict$x4*predict$x4,
  x1345 = predict$x1*predict$x3*predict$x4*predict$x5,
  
  x1355 = predict$x1*predict$x3*predict$x5*predict$x5,
  
  x1444 = predict$x1*predict$x4*predict$x4*predict$x4,
  x1445 = predict$x1*predict$x4*predict$x4*predict$x5,
  
  x1455 = predict$x1*predict$x4*predict$x5*predict$x5,
  
  x1555 = predict$x1*predict$x5*predict$x5*predict$x5,
  
  x2223 = predict$x2*predict$x2*predict$x2*predict$x3,
  x2224 = predict$x2*predict$x2*predict$x2*predict$x4,
  x2225 = predict$x2*predict$x2*predict$x2*predict$x5,

  x2233 = predict$x2*predict$x2*predict$x3*predict$x3,
  x2234 = predict$x2*predict$x2*predict$x3*predict$x4,
  x2235 = predict$x2*predict$x2*predict$x3*predict$x5,
  
  x2244 = predict$x2*predict$x2*predict$x4*predict$x4,
  x2245 = predict$x2*predict$x2*predict$x4*predict$x5,
  
  x2255 = predict$x2*predict$x2*predict$x5*predict$x5,
  
  x2333 = predict$x2*predict$x3*predict$x3*predict$x3,
  x2334 = predict$x2*predict$x3*predict$x3*predict$x4,
  x2335 = predict$x2*predict$x3*predict$x3*predict$x5,
  
  x2344 = predict$x2*predict$x3*predict$x4*predict$x4,
  x2345 = predict$x2*predict$x3*predict$x4*predict$x5,
  
  x2355 = predict$x2*predict$x3*predict$x5*predict$x5,
  
  x2444 = predict$x2*predict$x4*predict$x4*predict$x4,
  x2445 = predict$x2*predict$x4*predict$x4*predict$x5,
  
  x2455 = predict$x2*predict$x4*predict$x5*predict$x5,
  
  x2555 = predict$x2*predict$x5*predict$x5*predict$x5,
  
  x3334 = predict$x3*predict$x3*predict$x3*predict$x4,
  x3335 = predict$x3*predict$x3*predict$x3*predict$x5,
  
  x3344 = predict$x3*predict$x3*predict$x4*predict$x4,
  x3345 = predict$x3*predict$x3*predict$x4*predict$x5,
  
  x3355 = predict$x3*predict$x3*predict$x5*predict$x5,
  
  x3444 = predict$x3*predict$x4*predict$x4*predict$x4,
  x3445 = predict$x3*predict$x4*predict$x4*predict$x5,
  
  x3455 = predict$x3*predict$x4*predict$x4*predict$x5,
  
  x3555 = predict$x3*predict$x5*predict$x5*predict$x5,
  
  x4445 = predict$x4*predict$x4*predict$x4*predict$x5,
  
  x4455 = predict$x4*predict$x4*predict$x5*predict$x5,
  
  x4555 = predict$x4*predict$x5*predict$x5*predict$x5
)

base= squared%>%
  cbind(cube)%>%
  cbind(quart)%>%
  cbind(logs)%>%
  cbind(twice)%>%
  cbind(thrice)%>%
  cbind(quatro)


#Building a model that predicts the variables - loop that works through combinations



