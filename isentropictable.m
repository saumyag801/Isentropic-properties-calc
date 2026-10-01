clear all
close all
clc
% isentropic tables
% this programme creates ientropic gas tables
%for gama = 1.4
gama= 1.4;
disp('   M        P/P0         T/T0        Rho/Rho0        A/A*       a/a*         M*         mu       nu')
for M = 0:0.01:5
    dummy1 = 1+((gama-1)/2)*M^2;
    TbyT0 = 1/dummy1;
    PbyP0 = 1/((dummy1)^(gama/(gama-1)));
    rhobyrho0 = 1/((dummy1)^(1/(gama-1)));
    dummy2 = 2/(gama+1);
    dummy3 = (gama+1)/(2*(gama-1));
    AbyAcrt = (1/M)*(dummy1*dummy2)^(dummy3);
    abya0 = sqrt(TbyT0);
    Mstar = M*sqrt((1/dummy2)/(dummy1));
    mu = (180/pi)*asin(1/M);
    nu = (180/pi)*(sqrt(2*dummy3)*atan(sqrt((M^2-1)/(2*dummy3)))...
                   -atan(sqrt(M^2-1)));
    fprintf('%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t%f\t \n',M,PbyP0,TbyT0,rhobyrho0,AbyAcrt,abya0,Mstar,mu,nu);
end