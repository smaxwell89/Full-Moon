data MentalHealth;
set MentalHealth;
Season = '.';
if Month = 'Jan' or Month = 'Feb' or Month = 'Dec' then Season = 1;
if Month = 'Mar' or Month = 'Apr' or Month = 'May' then Season = 2;
if Month = 'Jun' or Month = 'Jul' or Month = 'Aug' then Season = 3;
if Month = 'Sep' or Month = 'Oct' or Month = 'Nov' then Season = 4;
run;
proc means n mean std data=MentalHealth;
class Month Moon;
var Admission;
run;
proc means n mean std data=MentalHealth;
class Month;
var Admission;
run;
proc means n mean std data=MentalHealth;
class Moon;
var Admission;
run;
proc means n mean std data=MentalHealth;
class Season;
var Admission;
run;
proc means n mean std data=MentalHealth;
class Season Moon;
var Admission;
run;
proc glm data=MentalHealth;
class Season Moon;
model Admission = Season Moon Season*Moon;
run;
proc glm data=MentalHealth;
class Season Moon;
model Admission = Season Moon;
means Season / tukey;
run;