# Random

**Random** is a utility data pack for Minecraft 1.17+ that adds functions for random number generation and predicates for evaluation of random events.

## Functions

`random:uniform`
Generates a random number between two inputs using a linear congruential generator.

```mcfunction
data merge storage random:input {min: 27, max: 61}
function random:uniform
execute if score $out random matches 30 run say hi!
```

`random:binomial`
Generates a random number using a binomial distribution given parameters `n` and `p`.

```mcfunction
data merge storage random:input {n: 10, p: 0.1666667}
function random:binomial
execute if score $out random matches 3.. run say Got three or more 1s!
```

`random:poisson`
Generates a random number using a Poisson distribution given the expected value `lambda`.

```mcfunction
data modify storage random:input lambda set value 5.3
function random:poisson
execute if score $out random matches 2 run say hi!
```

`random:uniform_bitwise`
Generates a random number between -2147483648 and 2147483647 using 32 predicates. Note that `random:uniform` should be more efficient.

`random:uniform_uuid`
Generates a random number between -2147483648 and 2147483647 using a UUID. Note that `random:uniform` should be more efficient.

## Predicates

`random:coin_toss`
Has a 50% chance of evaluating to true

```mcfunction
execute if predicate random:coin_toss run say hi!
```

```mcfunction
# Simulating a coin toss
execute store result score <player> <objective> if predicate random:coin_toss
execute if score <player> <objective> matches 0 run say Heads
execute if score <player> <objective> matches 1 run say Tails
```

`random:score_invert`
The probability that this predicate passes is the inverse of the value of the "chance" score:

```mcfunction
scoreboard players set $chance random 365
execute if predicate random:score_invert run say Happy birthday!
# Note: this is not how birthdays work
```

`random:score_percentage`
The probability that this predicate passes is proportional to the value of the "chance" score. At 0, it always fails; at 100, it always succeeds.

```mcfunction
scoreboard players set $chance random 5
execute if predicate random:score_percentage run say Only 5% of players can see this secret message!
```

`random:score_ppb`
Same as `random:score_percentage` but the maximum is 1000000000 instead of 1:

```mcfunction
scoreboard players set $chance random 123456789
execute if predicate random:score_ppb run say Only 12.3456789% of players can see this not so secret message!
```

## Version

This data pack was designed for Minecraft: Java Edition 1.17+.

Functions `random:uniform`, `random:poisson`, `random:alt/uniform_bitwise` and predicate `random:coin_toss` should work in 1.16, though the pack format in pack.mcmeta would cause the pack to be marked as incompatible.
