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

# Save scores and tags before modifying them
execute if score $out random matches -2147483648..2147483647 run scoreboard players operation #save random = $out random
execute if data storage random:input min run data modify storage random:data Save.min set from storage random:data min
execute if data storage random:input max run data modify storage random:data Save.max set from storage random:data max

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
data remove storage random:input min
data remove storage random:input max
execute if data storage random:data Save.min run data modify storage random:input min set from storage random:data Save.min
execute if data storage random:data Save.max run data modify storage random:input max set from storage random:data Save.max
data remove storage random:data Save
execute unless score #save random matches -2147483648..2147483647 run scoreboard players reset $out random
execute if score #save random matches -2147483648..2147483647 run scoreboard players operation $out random = #save random
scoreboard players reset #save random