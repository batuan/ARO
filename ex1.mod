set Obligation;
param revenu_annuel{Obligation};
param maturite{Obligation}, binary; # 1 means Long, 0 mean Courte
param risque{Obligation}, binary; # 1 mean Eleve, 0 mean Faible
param exoneration_fiscale{Obligation}, binary; # 1 mean Oui, 0 mean Non
param financier;
param ratio_court_term;
param ratio_risque;
param ratio_exoneres;
param ratio_exoneres_revenu;
var x{Obligation}, >=0;

maximize revenu_annuel_max: sum{i in Obligation} x[i]*revenu_annuel[i];
subject to total_financier: sum{i in Obligation} x[i] = financier;
subject to court_term: sum{i in Obligation : maturite[i]=0} x[i] >= financier * ratio_court_term;
subject to risque_term: sum{i in Obligation:  risque[i]=1} x[i] <= financier * ratio_risque;
subject to exoneres_term: sum{i in Obligation: exoneration_fiscale[i] = 1} x[i] >= financier * ratio_exoneres;
subject to exoneres_revenu_term: sum{i in Obligation: exoneration_fiscale[i] = 1} x[i] * revenu_annuel[i] >=  ratio_exoneres_revenu * sum {j in Obligation} x[j] * revenu_annuel[j];

data;

set Obligation := A B C D E;
param revenu_annuel := A 0.1, B 0.04, C 0.07, D 0.06, E 0.08;
param maturite := A 1, B 0, C 1, D 1, E 0;
param risque := A 1, B 0, C 0, D 0, E 1;
param exoneration_fiscale := A 0, B 1, C 0, D 1, E 0;
param financier := 100000;
param ratio_court_term := 0.5;
param ratio_risque := 0.5;
param ratio_exoneres := 0.4;
param ratio_exoneres_revenu := 0.3;

end;
