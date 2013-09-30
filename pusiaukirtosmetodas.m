function saknis = pusiaukirtosmetodas(func,x1,x2,filter,tol)
% Pusiaukirtos metodu surandamas funkcijos f(x) nulis intervale (x1,x2).
% IVEDIMO PARAMETRAI:
% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.0001).
if nargin < 5; tol = 0.0001; end 
% f-ja nargin nurodo input reiksmiu kieki, jei kiekis mazesnis uz 5
% priskiriama kintamojam zingsnio ilgio reiksme.
if nargin < 4; filter = 0; end
% f-ja nargin nurodo input reiksmiu kieki, jei kiekis mazesnis uz 4
% priskiriama kintamojo filtro reiksme=0.
f1 = func(x1);
if f1 == 0.0; saknis = x1; return; end
f2 = func(x2);
if f2 == 0.0; saknis = x2; return; end
%yra tikrinama ar pirmo ir antrojo  intervalo tasku reiksmes yra nenuliai.
% tikrinami tam kad nereiktu daryt programos toliau jei jie jau yra sprendiniai
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
%tikrina ar f-jos itervalu tasku sandauga didesne uz nuli. jei taip sis sprendimo metodas nutraukiams.
% f-ja error ismeta pranesima. negrazindama duomenu tik simboliu eilute.
end
n = ceil(log2(abs(x2 - x1)/tol));
%absoliutine paklaida dalinama is .
% f-ja ceil apvalina i didesne pusia sveikaji skaiciu. Randamas sveikasis skaicius
% nurodantis kiek kartu bus atlikta f-ja.
for i = 1:n
x3 = 0.5*(x1 + x2);
f3 = func(x3);
if (filter == 1) && (abs(f3) > abs(f1)) && (abs(f3) > abs(f2))
saknis = NaN; return
end
if f3 == 0.0
saknis = x3; return
end
if f2*f3 < 0.0
x1 = x3; f1 = f3;
else
x2 = x3; f2 = f3;
end
end
%dalijama per pusia ir ieskomas taskas kertantis x asi.
saknis = (x1 + x2)/2;

end