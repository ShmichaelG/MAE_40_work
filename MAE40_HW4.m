clear; syms s R L C Vin Vd Vm Vo b0 a1 a0        
% x={ Vo;  Vm; IR;  IC;    IL}       
A  =[  0   -1   0    0     L*s;    
      -1    0   0  1/(C*s)  0;    
      -1    0   R    0      0;    
       0    0   1    1      1;   
       1    1   0    0      0];   
b  =[ 0; 0;  0; 0; Vd/s];
x=A\b;
x(1);
Vd=0.5; L=10e-6; C=4.7e-6; R=250;
a1 = 1/C*R; a0 = -1/C*L;    b0 = Vd*a0; 
F=RR_tf([b0],[1 a1 a0 0]);
RR_bode(F)
