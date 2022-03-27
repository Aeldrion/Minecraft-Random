# Random

**Random** is a utility data pack for Minecraft 1.17+ that adds functions for random number generation and randomness-based predicates.

## Functions

### `random:uniform`

Generates a random number between `$min` and `$max` using a linear congruential generator.
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $min random 0
scoreboard players set $max random 10
function random:uniform
```

Note: The resulting distribution is not truly uniform for values of `$max`-`$min`+1 that do not divide ![2^31](https://render.githubusercontent.com/render/math?math=2^31).
While this is insignificant in almost all cases, `random:true_uniform` implements a method that counters modulo-induced bias.

![Generating 10000 numbers in range 0-10](https://cdn.discordapp.com/attachments/925818091475202118/926850852709359616/unknown.png)

### `random:binomial`

Generates a random number following a binomial distribution given parameters `$trials` and `$chance`.
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $trials random 5
scoreboard players set $chance 500000
function random:binomial
```

![Generating 10000 numbers with n=5 and p=0.5](https://cdn.discordapp.com/attachments/925818091475202118/925820827851698236/unknown.png)

### `random:geometric`

Generates a random number following a geometric distribution given parameter `$chance`, the probability of each Bernoulli trial with a scale of 1,000,000,000.
The distribution is supported on {1, 2, 3, ...}
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $chance 400000000
function random:geometric
```

![Generating 10000 numbers with p=0.4](https://cdn.discordapp.com/attachments/925818091475202118/957630561965465610/unknown.png)

### `random:poisson`

Generates a random number using a Poisson distribution given the expected value `lambda` with a scale of 10.
The generated value is saved to score `$out random`.

```mcfunction
scoreboard players set $lambda random 20
function random:poisson
```

![Generating 10000 Poisson variates with lambda=2.0](https://cdn.discordapp.com/attachments/925818091475202118/926851511345119262/unknown.png)

### `random:true_uniform`

Generates a random number between `$min` and `$max` using a linear congruential generator and countering modulo-induced bias.
The generated value is saved to score `$out random`.
For low values of `$min` and `$max`, the bias is negligible and `random:uniform` should be used instead for efficiency.

```mcfunction
scoreboard players set $min random 1
scoreboard players set $max random 1000000000
function random:true_uniform
```

### `random:number_provider`

Generates a random number from storage using a syntax similar to number providers.
`type` can be `constant`, `uniform`, `binomial`, `geometric`, `exponential` or `poisson`.
The `minecraft` namespace can optionally be used.
Like vanilla number providers, `type` can be omitted if `min`/`max` or `n`/`p` are specified.

For type `constant`, the function will return the value of parameter `value`.

```mcfunction
# Constant
data merge storage random:input {type: "constant", value: 5}
function random:number_provider
```

For type `uniform`, the function will return a random number between parameters `min` and `max` (inclusive).
`type` is optional as long as `min` and `max` are specified.

```mcfunction
# Uniform
data merge storage random:input {type: "uniform", min: 1, max: 6}
function random:number_provider
```

For type `binomial`, the function will return a random number following a binomial distribution with `n` trials of probability `p`.
`type` is optional as long as `n` and `p` are specified.

```mcfunction
# Binomial
data merge storage random:input {type: "binomial", n: 10, p: 0.166666667d}
function random:number_provider
```

For type `geometric`, the function will return a random number following a geometric distribution of parameter `p`.

```mcfunction
# Geometric
data merge storage random:input {type: "geometric", p: 0.2d}
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

### `random:score_fraction`

Succeeds with a probability of `$a`/`$b`.

```mcfunction
scoreboard players set $a random 7
scoreboard players set $b random 12
execute if predicate:score_fraction run say 7/12
```

### `random:score_invert`

Succeeds with a probability of 1/`$chance`.

```mcfunction
scoreboard players set $chance random 6
execute if predicate random:score_invert run say 1/6
```

### `random:score_percentage`

Succeeds with probability `$chance` in percents. At 0, the predicate always fails; at 100, it always succeeds.

```mcfunction
scoreboard players set $chance random 5
execute if predicate random:score_percentage run say 5%
```

### `random:score_ppb`

Succeeds with probability `$chance` in parts per billion. At 0, the predicate always fails; at 1,000,000,000, it always succeeds.

```mcfunction
scoreboard players set $chance random 123456789
execute if predicate random:score_ppb run say 12.3456789%
```

## Version

This data pack was designed for Minecraft: Java Edition 1.17 and works in 1.18 and 1.19 snapshots.
The data pack format in `pack.mcmeta` is 10, but you can safely downgrade it to data pack formats used in previous game versions.

Some functions/predicates work in versions before 1.17:

| Function                 | Supported versions                                  |
|--------------------------|-----------------------------------------------------|
| `random:uniform`         | 1.13+                                               |
| `random:binomial`        | 1.17+                                               |
| `random:geometric`       | 1.17+                                               |
| `random:poisson`         | 1.13+                                               |
| `random:number_provider` | 1.15+, 1.17+ if `type` is `binomial` or `geometric` |

| Predicate                 | Version |
|---------------------------|---------|
| `random:coin_toss`        | 1.15+   |
| `random:score_inverse`    | 1.17+   |
| `random:score_percentage` | 1.17+   |
| `random:score_ppb`        | 1.17+   |

Minecraft Random does not work in Minecraft: Bedrock Edition.
