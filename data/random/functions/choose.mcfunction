#> random:choose
#
# Outputs a random tag from a list
#
# @public
# @input
#	storage random:input List
#		The list a tag is picked from
# @output
#	storage random:output Tag
#		The tag that is chosen

# If $out is set, save it before modifying its value
execute if score $out random matches -2147483648..2147483647 run scoreboard players operation #save random = $out random

# Choose random index
data modify storage random:input min set value 1
execute store result storage random:input max int 1 if data storage random:input List[]
function random:uniform
scoreboard players operation #index random = $out random

# Pick nth tag from the end of the list
data modify storage random:data List set from storage random:input List
execute if data storage random:data List[0] run function random:private/choose_loop

# Clean up
data remove storage random:data List
execute if score #save random matches -2147483648..2147483647 run scoreboard players operation $out random = #save random
scoreboard players reset #save random