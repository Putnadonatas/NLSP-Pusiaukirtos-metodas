function saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - f-ja kaip m failas arba anonimine f-ja.
% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.0001).
% dx = zingsnio ilgis kreipiantis i sklaidos metoda (b-a)/n
%Paleidmas:
%saknis = pusiaukirtosmetodas(@f-jos_vardas,x1,x2,filter,tol)
saknusk = 0;
a_pirm=a;
while 1
 [x1,x2] = skaidosmetodas(func,a,b,dx);
 if isnan(x1) 
    disp('Daugiau sprendiniu nera');
    break
 else
   a = x2;
   saknis = pusiaukirtosmetodas(func,x1,x2,0,tol);
    if ~isnan(saknis)
         saknusk = saknusk + 1;
		 if saknis<b
           saknys(saknusk) = saknis;
		  end;
end
end
end
x = a_pirm:0.1:b;
y = func(x);
plot(x,y);
hold on;
 x_saknis =saknis;
 y_saknis =func(x_saknis);
 scatter(x_saknis,y_saknis,'*r');
 