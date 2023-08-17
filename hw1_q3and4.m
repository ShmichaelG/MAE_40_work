% Second-order low-pass LC filter: Solve for Vo as a function of Vi
clear, close all, syms s Vi Vs C L R R1 R2 Rd Cd
Rd = sqrt(L/C);  Cd = 4*C;   %Question 4 values of Rd and Cd

% x={I_L, I_C,  I_Rd,  I_Cd, Vo}  <-- unknown vector
A  =[ 1   -1    -1      0    0;     % I_L - I_C - I_Rd = 0
      0    0     1     -1    0;     % I_Rd - I_Cd = 0
     L*s   0     0      0    1;     % L*s*I_L + Vo = Vi
      0   -1     0      0   C*s;    % C*s*Vo - I_C = 0
      0    0  -Rd*Cd*s -1   Cd*s];  % Cd*s*Vo - I_Rd*Rd*Cd*s - I_Cd = 0
b  =[ 0; 0; Vi; 0; 0];
 x=A\b;    
Vo_LPF2_undamped=simplify(x(5))

omega4=10; zeta=0.1; F_LPF2_undamped=RR_tf([2*omega4^2 zeta*omega4^4],[2 5*zeta*omega4^2 2*omega4^2 zeta*omega4^4]);
figure(2), RR_bode(F_LPF2_undamped);
