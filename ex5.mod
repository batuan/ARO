param number_mois, integer, >0;
param temp := number_mois - 1;

set mois := 1..number_mois;

param cost_production_unitaire{1..number_mois};
param demande{mois};
param capacite_production{mois};
param tax;
param cost_stocker{i in 1..number_mois} := tax * cost_production_unitaire[i];
param maximum_stocker;
param minimum_stocker;
param actuellement_stocker;

var x{i in 1..number_mois}, integer, <= capacite_production[i], >= 0;
# Frigora permet de stocker un maximum de 6000 unit́es et avoir un minimum de 1500 unit́es en stock a` la fin de chaque mois
var v{i in mois}, integer,  >= minimum_stocker, <= maximum_stocker;

minimize cout_production_et_stock: sum{i in mois} x[i] * cost_production_unitaire[i] + sum{i in mois} v[i] * cost_stocker[i];

# example: v[3] = x[1]+[x2]+x[3] + 2750 - 1000 - 4500 - 6000;
subject to stocker_in {i in 1..number_mois}: actuellement_stocker - sum {j in 1..i} demande[j] + sum{j in 1..i} x[j] = v[i]; #

data;
param number_mois := 6;
param cost_production_unitaire := 1 240, 2 250, 3 265, 4 285, 5 280, 6 285;
param demande := 1 1000, 2 4500, 3 6000, 4 5500, 5 3500, 6 4000;
param capacite_production := 1 4000, 2 3500, 3 4000, 4 4500, 5 4000, 6 3500;
param tax := 0.015;
param maximum_stocker := 6000;
param minimum_stocker := 1500;
param actuellement_stocker := 2750;

end;