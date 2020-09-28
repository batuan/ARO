set INGREDIENTS;
set MELANGE;

param total_poid;
param type_voudrais{INGREDIENTS};
param nombresDeMelange{i in INGREDIENTS} := total_poid * type_voudrais[i];

param type_in_intergredient{INGREDIENTS, MELANGE};


param cost{MELANGE};
var x{MELANGE} >= 0;


minimize cost_melange: sum {i in MELANGE} cost[i] * x[i];
subject to total_ingredients {j in INGREDIENTS}: sum {i in MELANGE} x[i] * type_in_intergredient[j,i] >= nombresDeMelange[j];
subject to total_x: sum {i in MELANGE} x[i] = total_poid;
data;

set INGREDIENTS := Mais Graines Mineraux;

set MELANGE := MELANGE1 MELANGE2 MELANGE3 MELANGE4;

param total_poid := 4000;

param type_voudrais :=
    Mais     0.2
    Graines  0.15
    Mineraux 0.25;

param cost :=
    MELANGE1  0.50
    MELANGE2  0.60
    MELANGE3  0.64
    MELANGE4  0.30;


param type_in_intergredient(tr) :
              Mais Graines Mineraux :=
  MELANGE1    0.3  0.1    0.2
  MELANGE2    0.05 0.3    0.15
  MELANGE3    0.2  0.15   0.20
  MELANGE4    0.1  0.1    0.3;

