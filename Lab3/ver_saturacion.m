t = (0:0.01:9.9)';
u_val = 4;
ut = [t, u_val*ones(size(t))];

assignin('base', 't_ext', t);
assignin('base', 'u_ext', u_val*ones(size(t)));

out = sim('ejemplo2', 'StopTime', '9.9', ...
          'LoadExternalInput', 'on', ...
          'ExternalInput', '[t_ext, u_ext]');

y = out.yout;
tt = out.tout;
error_senal = u_val - y;
error_saturado = min(max(error_senal, -1), 1);

figure
subplot(2,1,1)
plot(tt, error_senal, 'b', tt, error_saturado, 'r--')
legend('Error real', 'Error después de saturación')
xlabel('Tiempo (s)'); ylabel('Amplitud')
title('Efecto de la saturación en la señal de error (u=4)')
grid on

subplot(2,1,2)
plot(tt, y)
xlabel('Tiempo (s)'); ylabel('Amplitud')
title('Salida del sistema y(t)')
grid on