#> random:private/load
#
# @private
# @handles #minecraft:load

# Storage
#define storage random:input
data merge storage random:input {n: 10, p: 0.5}

# Scoreboard
scoreboard objectives add random dummy
scoreboard players set #lcg_a random 1630111353
scoreboard players set #lcg_c random 1623164762
scoreboard players set #lcg_m random 2147483647
execute store result score #lcg_x random run seed

scoreboard players set #65536 random 65536
scoreboard players set #59299 random 59299
scoreboard players set #53656 random 53656
scoreboard players set #48550 random 48550
scoreboard players set #43930 random 43930
scoreboard players set #39750 random 39750
scoreboard players set #35967 random 35967
scoreboard players set #32544 random 32544
scoreboard players set #29447 random 29447
scoreboard players set #26645 random 26645
scoreboard players set #100 random 100
scoreboard players set #10 random 10
scoreboard players set #8 random 8