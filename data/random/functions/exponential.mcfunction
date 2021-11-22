#> random:exponential
#
# Generates a random number with exponential distribution of expected value lambda
#
# @public
# @input
#	storage random:input
#		lambda: float
#			The rate/inverse scale
# @output
#	score $out random

# Save storage values as scores
execute store result score #lambda random run data get storage random:input lambda 100

# Generate a random number between 0 and 1M
data merge storage random:input {min: 1, max: 999999}
function random:uniform

# Calculate log(x)
scoreboard players operation #x random = $out random
function random:private/log

# Calculate -log(x)/lbda
scoreboard players set $out random 0
scoreboard players operation $out random -= #log random
scoreboard players operation $out random /= #lambda random
scoreboard players operation $out random /= #100 random