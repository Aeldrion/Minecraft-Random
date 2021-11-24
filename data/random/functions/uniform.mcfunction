#> random:uniform
#
# Generates a random number between two given bounds using a linear congruential generator
#
# @public
# @within random:exponential
# @within random:private/poisson_loop
# @input
#	storage random:input
#		min
#			The minimum value (inclusive)
#		max
#			The maximum value (inclusive)
# @output
#	score $out random
#		An integer in range [min, max]

# Save input parameters as scores
execute store result score #min random run data get storage random:input min
execute store result score #max random run data get storage random:input max
scoreboard players operation #max random -= #min random
scoreboard players add #max random 1

# Xn+1 = (aXn + c) mod m
scoreboard players operation #lcg random *= #lcg_a random
scoreboard players operation #lcg random += #lcg_c random
scoreboard players operation #lcg random %= #lcg_m random

# Trim "low quality" bits
scoreboard players operation $out random = #lcg random
scoreboard players operation $out random /= #8 random

# Get within desired range
scoreboard players operation $out random %= #max random
scoreboard players operation $out random += #min random