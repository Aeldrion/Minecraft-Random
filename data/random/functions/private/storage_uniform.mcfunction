#> random:private/storage_uniform
#
# @private
# @within random:number_provider
# @input
#	storage random:input
#		n: int
#			The number of Bernoulli min. Maximum accepted value is 1000. Otherwise, output is 0.
#		p: float
#			The probability of success of each Bernoulli trial.

# Save storage values as scores
execute if score $min random matches -2147483648..2147483647 run scoreboard players operation #user_min_input random = $min random
execute if score $max random matches -2147483648..2147483647 run scoreboard players operation #user_max_input random = $max random
execute store result score $min random run data get storage random:input n
execute store result score $max random run data get storage random:input p 1000000000

# Run main function
function random:uniform

# Clean up
execute unless score #user_max_input random matches -2147483648..2147483647 run scoreboard players reset $max random
execute unless score #user_min_input random matches -2147483648..2147483647 run scoreboard players reset $min random
execute if score #user_max_input random matches -2147483648..2147483647 run scoreboard players operation $max random = #user_max_input random
execute if score #user_min_input random matches -2147483648..2147483647 run scoreboard players operation $min random = #user_min_input random