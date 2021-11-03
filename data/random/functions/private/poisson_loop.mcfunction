#> random:private/poisson_loop
#
# @private
# @within random:poisson
# @within random:private/poisson_loop

scoreboard players add #k random 1

data merge storage random:input {min: 0, max: 65536}
function random:uniform
scoreboard players operation #p random /= #65536 random
scoreboard players operation #p random *= $out random

execute if score #p random > #L random run function random:private/poisson_loop