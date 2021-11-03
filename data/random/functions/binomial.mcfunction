#> random:binomial
#
# Generates a random number with binomial distribution of parameters n, p using a value_check predicate on a loop
#
# @public
# @input
#	storage random:input
#		n: int
#			The number of Bernoulli trials
#		p: float
#			The probability of success of each Bernoulli trial

# Save storage values as scores
execute store result score #trials random run data get storage random:input n
execute if score $chance random matches -2147483648..2147483647 run scoreboard players operation #save random = $chance random
execute store result score $chance random run data get storage random:input p 1000000000

# Run Bernoulli trials on a loop
scoreboard players set $out random 0
execute if score #trials random matches 1.. run function random:private/binomial_loop

# Clean up
scoreboard players reset #trials random
execute if score #save random matches -2147483648..2147483647 run scoreboard players operation $chance random = #save random
scoreboard players reset #save random