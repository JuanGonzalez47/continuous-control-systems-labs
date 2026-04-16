% %Analisis de agregar polos o ceros y sus implicaciones
% s = tf('s');
% G1 = 1 / (s*(s+2));
% G2 = 1 / (s*(s+2)*(s/5 + 1));
% G3 = (s/3 + 1) / (s*(s+2)*(s/5 + 1));
% rlocus(G3);

% rltool
s=tf('s');
g=1/(s*(s+1.4)) %wn se ha considerado wn=1
rltool

% zeta_vals = 0.5:0.1:1.2;
% t = 0:0.1:15;
% figure; hold on; grid on;
% for z = zeta_vals
%     sys = tf(1, [1, 2*z, 1]);
%     [y, t_axis] = step(sys, t);
%     plot(t_axis, y, 'DisplayName', ['\zeta = ', num2str(z)]);
% end
% title('Respuesta al Escalón variando \zeta');
% legend show;