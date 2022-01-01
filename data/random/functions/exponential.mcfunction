#> random:exponential
#
# Generates a random number following a geometric distribution by rounding up exponential variates of rate lambda
# This results in a geometric distribution of parameter p = exp(-lambda) / (1 - exp(-lambda)), supported on {1, 2, 3, ...}
#
# @public
# @input
#	score $lambda random
#		The rate or inverse scale used for the exponential variates, with a scale of 100
# @output
#	score $out random
#		The exponential variate rounded up to an integer in {1, 2, 3, ...}

# Generate a random number between 0 and 1M
execute if score $min random matches -2147483648..2147483647 run scoreboard players operation #user_min_input random = $min random
execute if score $max random matches -2147483648..2147483647 run scoreboard players operation #user_max_input random = $max random
scoreboard players set $min random 1
scoreboard players set $max random 999999
function random:uniform

# Calculate log(x)
scoreboard players operation #x random = $out random
function random:private/log

# Calculate -log(x)/lambda
scoreboard players set $out random 0
scoreboard players operation $out random -= #log random
scoreboard players operation $out random /= #100 random
scoreboard players operation $out random /= $lambda random

# Add 1
scoreboard players add $out random 1

# Clean up
execute unless score #user_min_input random matches -2147483648..2147483647 run scoreboard players reset $min random
execute unless score #user_max_input random matches -2147483648..2147483647 run scoreboard players reset $max random
execute if score #user_min_input random matches -2147483648..2147483647 run scoreboard players operation $min random = #user_min_input random
execute if score #user_max_input random matches -2147483648..2147483647 run scoreboard players operation $max random = #user_max_input random
scoreboard players reset #user_min_input random
scoreboard players reset #user_max_input random