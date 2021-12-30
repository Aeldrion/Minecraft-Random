#> random:geometric
#
# Generates a random number following a geometric distribution of probability p, supported on {1, 2, 3, ...}
# Caps at 1000
# For a geometric distribution supported on {0, 1, 2, 3, ...} using exponential variates with a given inverse rate, use random:exponential
#
# @public
# @input
#	score $chance random
#		The probability of success of each Bernoulli trial, with a scale of 1,000,000,000
# @output
#	score $out random
#		An integer in [1, 1000]

scoreboard players set $out random 0
function random:private/geometric_loop