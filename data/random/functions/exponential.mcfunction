#> random:exponential
#
# Generates a random number with exponential distribution of expected value lambda
#
# @public
# @input
#	score $lambda random
#		The rate or inverse scale with a scale of 100
# @output
#	score $out random

# Generate a random number between 0 and 1M
data merge storage random:input {min: 1, max: 999999}
function random:uniform

# Calculate log(x)
scoreboard players operation #x random = $out random
function random:private/log

# Calculate -log(x)/lambda
scoreboard players set $out random 0
scoreboard players operation $out random -= #log random
scoreboard players operation $out random /= #100 random
scoreboard players operation $out random /= $lambda random