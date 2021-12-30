#> random:private/number_provider/exponential
#
# @private
# @within random:number_provider
# @input
#	storage random:input
#		lambda: float
#			The rate or inverse scale

# Save storage values as scores
execute if score $lambda random matches -2147483648..2147483647 run scoreboard players operation #user_lambda_input random = $lambda random
execute store result score $lambda random run data get storage random:input lambda 100

# Run main function
function random:exponential

# Clean up
execute unless score #user_lambda_input random matches -2147483648..2147483647 run scoreboard players reset $lambda random
execute if score #user_lambda_input random matches -2147483648..2147483647 run scoreboard players operation $lambda random = #user_lambda_input random
scoreboard players reset #user_lambda_input random