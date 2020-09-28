param number_of_periode, integer, >0;

set agence := 1..number_of_periode;

param number_agence_min{agence};

var x{agence}, integer >= 0;

minimize total_agence: sum {i in agence} x[i];

param temp := number_of_periode - 1;

subject to  min_of_periode1: x[1] >= number_agence_min[1];

subject to  min_of_agence {i in 1..temp}: x[i] + x[i+1] >= number_agence_min[i+1];

data;
param number_of_periode := 6;
param number_agence_min :=
1 9
2 21
3 25
4 16
5 30
6 12;

end;