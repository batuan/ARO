set REGION;
set MINOTERIE;
param valueRegion{REGION} > 0;
param valueMinoterie{MINOTERIE} > 0;

param distance {REGION, MINOTERIE};

param cost_transport;

param cost{i in REGION, j in MINOTERIE} := cost_transport * distance[i,j];

var x{REGION, MINOTERIE} >= 0;

minimize cost_total_transport: sum{i in REGION, j in MINOTERIE} cost[i,j] * x[i,j];

subject to totalRegion{i in REGION}: sum{j in MINOTERIE} x[i,j] = valueRegion[i];
subject to totalMinoterie{i in MINOTERIE}: sum {j in REGION} x[j,i] = valueMinoterie[i];


data;

set REGION := R1 R2 R3;

set MINOTERIE := M1 M2 M3;

param cost_transport := 0.10;

param: valueRegion :=
    R1 275
    R2 400
    R3 300;
param: valueMinoterie :=
    M1 200
    M2 550
    M3 225;
param distance (tr):
        R1    R2    R3   :=
    M1  210   350   550
    M2  500   300   200
    M3  400   220   250;

end;
