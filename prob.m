E=40; 
D=11; 
N=25; 
Frecventa=1/E; 
t=0:0.002:4*E-0.002; 
w0=2*pi*Frecventa; 
x=0.5+0.5*square(2*pi*t/E,27.5); 
for k = -N:N 
    xf = x; 
    X(k+26) = trapz(t,xf); 
end
x_sgnnou(1:length(t)) = 0; 
for i = 1:length(t);
for k = -N:N
x_sgnnou(i) = x_sgnnou(i) + 1/4*(1/E)*X(k+N+1)*exp(j*k*w0*t(i));
end
end 
figure(1);
plot(t,x); 
title('x(t) si armonicile semnalului esantionat');
hold on 
plot(t,x_sgnnou,'r:'); 
xlabel('Timp (s)');
ylabel('Amplitudine');

Fr = -N*Frecventa:Frecventa:N*Frecventa; 
figure(2); 
stem(Fr,abs(X)); 
title('Spectrul lui x(t)');
xlabel('Frecventa (Hz)'); 
ylabel('|X|'); 

