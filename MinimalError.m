%-------   Minimal Error method for  Gompertz model     -------%  

function [a r R2]=MinimalError(ak,rk)
global ti T N
t=linspace(1,T,T);   

%----                   first iteration                    ----% 
k=1; 
Nk=exp( ak )*exp( log( N(1)/exp( ak ) )*exp( -rk*(t-ti) ) );
R2k=1-sum( (N-Nk).^2 )/sum( (N-mean(N)).^2 );  R2=R2k;

r=rk; a=ak; R2=R2k; 
fprintf('%10.7f\t',k,r,a,R2,rk,ak,R2k,sum( abs( (N-Nk)./N ) )/T);   
fprintf('\n\n');

while(R2<=R2k || R2k<1)
k=k+1;
%---           Partial derivative of a and b               ---% 
dak=Nk.*( 1-exp( -rk*(t-ti) ) );
drk=-Nk.*(t-ti).*log( N(1)/exp( ak ) ).*exp( -rk*(t-ti) );

%---     sum (N-Nk)*dKk  and  sum (N-Nk)*drk               ---%
sumak=sum( (N-Nk).*dak );   sumrk=sum( (N-Nk).*drk ); 

%---               We calculate  wk                        ---%         
wk=( sum( (N -Nk )'.^2 )/(T-ti) ) / ( sumak^2+ sumrk^2 );

%---           To the minimal error method                 ---%
ak=ak+1/1*wk*sumak;     rk=rk+wk*sumrk;

%---                Approximate solution                    ---%  
Nk=exp( ak )*exp( log( N(1)/exp( ak ) )*exp( -rk*(t-ti) ) );

%---                 We calculate  R^2                    ---%
R2k=1-sum( (N-Nk).^2 )/sum( (N-mean(N)).^2 );
if (R2<R2k)
r=rk; a=ak; R2=R2k;  erro=sum( abs( (N-Nk)./N ) )/T;
end
%---                Print of errors                        ---%
fprintf('%10.15f\t',k,R2,abs(R2k),wk);  
fprintf('\n\n');
end
