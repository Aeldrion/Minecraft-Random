#> random:uniform_uuid
#
# Generates a random integer between -2147483648 and 2147483647 (any int) with the UUID method
#
# @api
# @output
#	score $out random
#		A random number

summon minecraft:marker ~ ~ ~ {Tags: ["random.get_uuid"]}
execute store result score $out random run data get entity @e[type=minecraft:marker, tag=random.get_uuid, limit=1] UUID[1]
kill @e[type=minecraft:marker, tag=random.get_uuid, limit=1]