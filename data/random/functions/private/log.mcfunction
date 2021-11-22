#> random:private/log
#
# Calculates the natural log of a number between 0 and 1
#
# @private
# @input
#	score #x random
#		The number, with a scale of 1,000,000
#	score #log random
#		The log, with a scale of 10,000
# @within random:exponential

execute if score #x random matches 100000..999999 run scoreboard players set #digits random 1
execute if score #x random matches 10000..99999 run scoreboard players set #digits random 2
execute if score #x random matches 1000..9999 run scoreboard players set #digits random 3
execute if score #x random matches 100..999 run scoreboard players set #digits random 4
execute if score #x random matches 1..99 run scoreboard players set #digits random 5

scoreboard players operation #a random = #x random
execute if score #digits random matches 1.. run scoreboard players operation #a random *= #10 random
execute if score #digits random matches 2.. run scoreboard players operation #a random *= #10 random
execute if score #digits random matches 3.. run scoreboard players operation #a random *= #10 random
execute if score #digits random matches 4.. run scoreboard players operation #a random *= #10 random
execute if score #digits random matches 5.. run scoreboard players operation #a random *= #10 random

scoreboard players operation #(a*100-100M) random = #a random
scoreboard players operation #(a*100-100M) random *= #100 random
scoreboard players remove #(a*100-100M) random 100000000

scoreboard players operation #(a/100+10K) random = #a random
scoreboard players operation #(a/100+10K) random /= #100 random
scoreboard players add #(a/100+10K) random 10000

scoreboard players operation #y random = #(a*100-100M) random
scoreboard players operation #y random /= #(a/100+10K) random

# S = 2*sum((y**(2k+1) / (2k+1) for k in range(5))
scoreboard players set #S random 0
scoreboard players operation #y^(2k+1) random = #y random
scoreboard players operation #y^(2k+1)/(2k+1) random = #y^(2k+1) random
scoreboard players operation #S random += #y^(2k+1)/(2k+1) random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1)/(2k+1) random = #y^(2k+1) random
scoreboard players operation #y^(2k+1)/(2k+1) random /= #3 random
scoreboard players operation #S random += #y^(2k+1)/(2k+1) random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1)/(2k+1) random = #y^(2k+1) random
scoreboard players operation #y^(2k+1)/(2k+1) random /= #5 random
scoreboard players operation #S random += #y^(2k+1)/(2k+1) random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1)/(2k+1) random = #y^(2k+1) random
scoreboard players operation #y^(2k+1)/(2k+1) random /= #7 random
scoreboard players operation #S random += #y^(2k+1)/(2k+1) random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1) random *= #y random
scoreboard players operation #y^(2k+1) random /= #10000 random
scoreboard players operation #y^(2k+1)/(2k+1) random = #y^(2k+1) random
scoreboard players operation #y^(2k+1)/(2k+1) random /= #9 random
scoreboard players operation #S random += #y^(2k+1)/(2k+1) random
scoreboard players operation #S random += #S random

# log = S - n*log(10)
scoreboard players operation #log random = #S random
scoreboard players operation #n*log(10) random = #log(10) random
scoreboard players operation #n*log(10) random *= #digits random
scoreboard players operation #log random -= #n*log(10) random