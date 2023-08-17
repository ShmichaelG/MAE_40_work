% Second-order low-pass LC filter: Solve for Vo as a function of Vi
clear, close all, syms s Vi Vs C L R R1 R2

% x={I_L, I_C, I_R, Vo}  <-- unknown vector
A  =[ 1  -1   -1   0;    % I_L - I_C - I_R = 0
     L*s  0    0   1;    % L*s*I_L + Vo = Vi
     0   -1    0  C*s;  % C*s*Vo - I_C = 0
     0    0    R  -1];   % I_R*R - Vo = 0
b  =[ 0; Vi; 0; 0];
x=A\b;
Vo_LPF2_undamped=simplify(x(4))
omega4=10; zeta=0.1; F_LPF2_undamped=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(1), RR_bode(F_LPF2_undamped);        %Bode plot for omega4 = 10 , zeta = 0.1

omega4=10; zeta=0.5; F_LPF2_undamped=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(2), RR_bode(F_LPF2_undamped);        %Bode plot for omega4 = 10 , zeta = 0.5

omega4=10; zeta=1; F_LPF2_undamped=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(3), RR_bode(F_LPF2_undamped);        %Bode plot for omega4 = 10 , zeta = 1
