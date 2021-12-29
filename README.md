# Random

**Random** is a utility data pack for Minecraft 1.17+ that adds functions for random number generation and predicates for evaluation of random events.

## Functions

### `random:uniform`

Generates a random number between `$min` and `$max` using a linear congruential generator.
The generated value is saved to score `$out random`.

```mcfunction
data merge storage random:input {min: 27, max: 61}
scoreboard players set $min random 1
scoreboard players set $max random 6
function random:uniform
```

### `random:binomial`

Generates a random number using a binomial distribution given parameters `$trials` and `$chance`.
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $trials random 10
scoreboard players set $chance 166666667
function random:binomial
```

### `random:exponential`

Generates a random number using an exponential distribution given the rate `lambda` with a scale of 100.
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $lambda random 100
function random:exponential
```

### `random:poisson`

Generates a random number using a Poisson distribution given the expected value `lambda` with a scale of 10.
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $lambda random 50
function random:poisson
```

### `random:number_provider`

Generates a random number from storage using a syntax similar to number providers. `type` can be `constant`, `uniform`, `binomial`, `exponential` or `poisson`. The `minecraft` namespace can optionally be used. Like vanilla number providers, `type` can be omitted if `min`/`max` or `n`/`p` are specified.

For type `constant`, the function will return the value of parameter `value`.

```mcfunction
# Constant
data merge storage random:input {type: "constant", value: 5}
function random:number_provider
```

For type `uniform`, the function will return a random number between parameters `min` and `max` (inclusive). `type` is optional as long as `min` and `max` are specified.

```mcfunction
# Uniform
data merge storage random:input {type: "uniform", min: 1, max: 6}
function random:number_provider
```

For type `binomial`, the function will return a random binomial variate with `n` trials of probability `p`. `type` is optional as long as `n` and `p` are specified.

```mcfunction
# Binomial
data merge storage random:input {type: "binomial", n: 10, p: 0.166666667d}
function random:number_provider
```

For type `exponential`, the function will return an exponential variate with rate `lambda`. Unlike `random:exponential`, no scale is expected for input.

```mcfunction
# Exponential
data merge storage random:input {type: "exponential", lambda: 1.0f}
function random:number_provider
```

For type `poisson`, the function will return a Poisson variate of expected value `lambda`. Unlike `random:poisson`, no scale is expected for input.

```mcfunction
# Poisson
data merge storage random:input {type: "poisson", lambda: 5.0f}
function random:number_provider
```

### `random:choose`

Chooses a random tag from storage list `random:input List` and saves it to storage tag `random:output Tag`.

```mcfunction
data modify storage random:input List set value ["green", "yellow", "orange", "pink"]
function random:choose
tellraw @a {"nbt": "Tag", "storage": "random:output"}
```

## Predicates

### `random:coin_toss`

Has a 50% chance of evaluating to true.

```mcfunction
execute if predicate random:coin_toss run say hi!
```

```mcfunction
# Simulating a coin toss
execute store result score <player> <objective> if predicate random:coin_toss
execute if score <player> <objective> matches 0 run say Heads
execute if score <player> <objective> matches 1 run say Tails
```

### `random:score_invert`

Succeeds with a probability of 1/`$chance`.

```mcfunction
scoreboard players set $chance random 6
execute if predicate random:score_invert run say 
```

### `random:score_percentage`

Succeeds with probability `$chance` in percents. At 0, the predicate always fails; at 100, it always succeeds.

```mcfunction
scoreboard players set $chance random 5
execute if predicate random:score_percentage run say Only 5% of players can see this secret message!
```

### `random:score_ppb`

Succeeds with probability `$chance` in parts per billion. At 0, the predicate always fails; at 1,000,000,000, it always succeeds.

```mcfunction
scoreboard players set $chance random 123456789
execute if predicate random:score_ppb run say Only 12.3456789% of players can see this not so secret message!
```

## Version

This data pack was designed for Minecraft: Java Edition 1.17 and works in 1.18.

Some functions/predicates work in versions before 1.17:

| Function                 | Supported versions                   |
|--------------------------|--------------------------------------|
| `random:uniform`         | 1.13+                                |
| `random:binomial`        | 1.17+                                |
| `random:exponential`     | 1.13+                                |
| `random:poisson`         | 1.13+                                |
| `random:number_provider` | 1.15+, 1.17+ if `type` is `binomial` |

| Predicate                 | Version |
|---------------------------|---------|
| `random:coin_toss`        | 1.15+   |
| `random:score_inverse`    | 1.17+   |
| `random:score_percentage` | 1.17+   |
| `random:score_ppb`        | 1.17+   |

Minecraft Random does not work in Minecraft: Bedrock Edition.
