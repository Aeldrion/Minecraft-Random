#> random:uniform_bitwise
#
# Constructs a random integer bit per bit between -2147483648 and 2147483647 (any int) using a random predicate
#
# @api

scoreboard players set $out random 0
execute if predicate random:coin_toss run scoreboard players set $out random -2147483648
execute if predicate random:coin_toss run scoreboard players add $out random 1073741824
execute if predicate random:coin_toss run scoreboard players add $out random 536870912
execute if predicate random:coin_toss run scoreboard players add $out random 268435456
execute if predicate random:coin_toss run scoreboard players add $out random 134217728
execute if predicate random:coin_toss run scoreboard players add $out random 67108864
execute if predicate random:coin_toss run scoreboard players add $out random 33554432
execute if predicate random:coin_toss run scoreboard players add $out random 16777216
execute if predicate random:coin_toss run scoreboard players add $out random 8688608
execute if predicate random:coin_toss run scoreboard players add $out random 4194304
execute if predicate random:coin_toss run scoreboard players add $out random 2097152
execute if predicate random:coin_toss run scoreboard players add $out random 1048576
execute if predicate random:coin_toss run scoreboard players add $out random 524288
execute if predicate random:coin_toss run scoreboard players add $out random 262144
execute if predicate random:coin_toss run scoreboard players add $out random 131072
execute if predicate random:coin_toss run scoreboard players add $out random 65536
execute if predicate random:coin_toss run scoreboard players add $out random 32768
execute if predicate random:coin_toss run scoreboard players add $out random 16384
execute if predicate random:coin_toss run scoreboard players add $out random 8192
execute if predicate random:coin_toss run scoreboard players add $out random 4096
execute if predicate random:coin_toss run scoreboard players add $out random 2048
execute if predicate random:coin_toss run scoreboard players add $out random 1024
execute if predicate random:coin_toss run scoreboard players add $out random 512
execute if predicate random:coin_toss run scoreboard players add $out random 256
execute if predicate random:coin_toss run scoreboard players add $out random 128
execute if predicate random:coin_toss run scoreboard players add $out random 64
execute if predicate random:coin_toss run scoreboard players add $out random 32
execute if predicate random:coin_toss run scoreboard players add $out random 16
execute if predicate random:coin_toss run scoreboard players add $out random 8
execute if predicate random:coin_toss run scoreboard players add $out random 4
execute if predicate random:coin_toss run scoreboard players add $out random 2
execute if predicate random:coin_toss run scoreboard players add $out random 1