#> random:poisson
#
# Generates a random number using a Poisson distribution
#
# @public
# @input
#	storage random:input
#		lambda
#			The expected value, a number between 0 and 10. Decimal values are supported but only the first decimal place is taken into account.
# @output
#	score $out random

# Save storage values as scores
execute store result score #lambda_int random run data get storage random:input lambda
execute store result score #lambda_dec random run data get storage random:input lambda 10
scoreboard players operation #lambda_dec random %= #10 random

# Evaluate exp(-l). The result is a number between 0 and 1 (but not 0), we save it with a scale of 2147483648
execute if score #lambda_int random matches 0 run scoreboard players set #exp(-l) random 32768
execute if score #lambda_int random matches 1 run scoreboard players set #exp(-l) random 12054
execute if score #lambda_int random matches 2 run scoreboard players set #exp(-l) random 4434
execute if score #lambda_int random matches 3 run scoreboard players set #exp(-l) random 1631
execute if score #lambda_int random matches 4 run scoreboard players set #exp(-l) random 600
execute if score #lambda_int random matches 5 run scoreboard players set #exp(-l) random 221
execute if score #lambda_int random matches 6 run scoreboard players set #exp(-l) random 81
execute if score #lambda_int random matches 7 run scoreboard players set #exp(-l) random 30
execute if score #lambda_int random matches 8 run scoreboard players set #exp(-l) random 11
execute if score #lambda_int random matches 9 run scoreboard players set #exp(-l) random 4
execute if score #lambda_int random matches 10 run scoreboard players set #exp(-l) random 2

execute if score #lambda_dec random matches 0 run scoreboard players operation #exp(-l) random *= #65536 random
execute if score #lambda_dec random matches 1 run scoreboard players operation #exp(-l) random *= #59299 random
execute if score #lambda_dec random matches 2 run scoreboard players operation #exp(-l) random *= #53656 random
execute if score #lambda_dec random matches 3 run scoreboard players operation #exp(-l) random *= #48550 random
execute if score #lambda_dec random matches 4 run scoreboard players operation #exp(-l) random *= #43930 random
execute if score #lambda_dec random matches 5 run scoreboard players operation #exp(-l) random *= #39750 random
execute if score #lambda_dec random matches 6 run scoreboard players operation #exp(-l) random *= #35967 random
execute if score #lambda_dec random matches 7 run scoreboard players operation #exp(-l) random *= #32544 random
execute if score #lambda_dec random matches 8 run scoreboard players operation #exp(-l) random *= #29447 random
execute if score #lambda_dec random matches 9 run scoreboard players operation #exp(-l) random *= #26645 random

# Draw random number using Knuth's method
scoreboard players operation #L random = #exp(-l) random
scoreboard players set #p random 2147483647
scoreboard players set #k random -1
function random:private/poisson_loop
data remove storage random:input min
data remove storage random:input max
scoreboard players operation $out random = #k random