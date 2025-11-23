# Sets
set FOOD;     # Set of available foods
set NUTR;     # Set of nutrients

# Parameters
param cost {FOOD};        # Cost per unit of each food
param f_min {FOOD} >= 0;  # Minimum amount of each food to buy
param f_max {FOOD} >= 0;  # Maximum amount of each food to buy

param amt {FOOD, NUTR};   # Amount of each nutrient in each food

param n_min {NUTR} >= 0;  # Minimum required amount of each nutrient
param n_max {NUTR} >= 0;  # Maximum allowed amount of each nutrient

# Variables
var Buy {f in FOOD} >= f_min[f], <= f_max[f];  # Amount of each food to buy

# Objective Function
minimize total_cost: sum {f in FOOD} cost[f] * Buy[f];

# Constraints
subject to nutrient_min {n in NUTR}:
   sum {f in FOOD} amt[f, n] * Buy[f] >= n_min[n];

subject to nutrient_max {n in NUTR}:
   sum {f in FOOD} amt[f, n] * Buy[f] <= n_max[n];