% ejemplo2m.m
t = (0:0.1:9.9)';  % 100 puntos, vector columna

figure
hold on

for i = 1:7
    ut = [t, i*ones(size(t))];
    
    % Asignar en workspace base para que Simulink lo lea
    assignin('base', 't_ext', t);
    assignin('base', 'u_ext', i*ones(size(t)));
    
    out = sim('ejemplo2', ...
              'StopTime', '9.9', ...
              'LoadExternalInput', 'on', ...
              'ExternalInput', '[t_ext, u_ext]');
    
    tt = out.tout;
    yy = out.yout;
    yint = interp1(tt, yy, t, 'linear', 'extrap');
    y0(1:length(yint), i) = yint;
end

sy   = size(y0);
y0ss = y0(sy(1), :);
SP   = 100 * (max(y0) - y0ss) ./ y0ss;

plot(t, y0); grid on
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Respuesta con saturación — entradas 1 a 7')
legend(arrayfun(@(x) sprintf('u=%d',x), 1:7, 'UniformOutput', false))
