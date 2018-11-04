%% Reading Training data from mat files

% Obtaining positions of instruments and camera
[l1, r1, c1] = readfile('pegs_13feb_1');
[l2, r2, c2] = readfile('pegs_13feb_2');
[l3, r3, c3] = readfile('pegs_13feb_3');
[l4, r4, c4] = readfile('pegs_13feb_4_1');
[l5, r5, c5] = readfile('pegs_13feb_4_2');
[l6, r6, c6] = readfile('pegs_13feb_5_1');
[l7, r7, c7] = readfile('pegs_13feb_5_2');

leftTool = vertcat(l1,l2,l3,l4,l5,l6,l7)*1000;
rightTool = vertcat(r1,r2,r3,r4,r5,r6,r7)*1000;
camera = vertcat(c1,c2,c3,c4,c5,c6,c7)*1000;

% Velocities (suponemos datos recogidos a 100 Hz)
fz = 250;
T = 1/fz;
t = 0:T:length(leftTool)/fz; % pasamos las iteraciones a segundos para poder plotear luego
t(end) = [];

for i = 1:1:length(leftTool)-1
    vleft_x = (leftTool(i+1,1)-leftTool(i,1))/T;
    vleft_y = (leftTool(i+1,2)-leftTool(i,2))/T;
    vleft_hor(i) = sqrt(vleft_x^2 + vleft_y^2);
    vleft_z(i) = (leftTool(i+1,3)-leftTool(i,3))/T;
    
    vright_x = (rightTool(i+1,1)-rightTool(i,1))/T;
    vright_y = (rightTool(i+1,2)-rightTool(i,2))/T;
    vright_hor(i) = sqrt(vright_x^2 + vright_y^2);
    vright_z(i) = (rightTool(i+1,3)-rightTool(i,3))/T;
    
    vcamera_x = (camera(i+1,1)-camera(i,1))/T;
    vcamera_y = (camera(i+1,2)-camera(i,2))/T;
    vcamera_hor(i) = sqrt(vcamera_x^2 + vcamera_y^2);
    vcamera_z(i) = (camera(i+1,3)-camera(i,3))/T;    
end

%% plot velocities
figure('color','w')
subplot(3,2,1); plot(vleft_hor,'b'); title('Left Tool horizontal velocity')
subplot(3,2,3); plot(vright_hor,'r'); title('Right Tool horizontal velocity')
subplot(3,2,5); plot(vcamera_hor,'g'); title('Camera horizontal velocity')

subplot(3,2,2); plot(vleft_z,'b'); title('Left Tool vertical velocity')
subplot(3,2,4); plot(vright_z,'r'); title('Right Tool vertical velocity')
subplot(3,2,6); plot(vcamera_z,'g'); title('Camera vertical velocity')

%% plot positions
figure('color','w')
subplot(3,3,1); plot(t,leftTool(:,1),'b'); title('Left Tool: x position')
subplot(3,3,4); plot(t,rightTool(:,1),'r'); title('Right Tool: x position')
subplot(3,3,7); plot(t,camera(:,1),'g'); title('Camera: x position')

subplot(3,3,2); plot(t,leftTool(:,2),'b'); title('Left Tool: y position')
subplot(3,3,5); plot(t,rightTool(:,2),'r'); title('Right Tool: y position')
subplot(3,3,8); plot(t,camera(:,2),'g'); title('Camera: y position')

subplot(3,3,3); plot(t,leftTool(:,3),'b'); title('Left Tool: z position')
subplot(3,3,6); plot(t,rightTool(:,3),'r'); title('Right Tool: z position')
subplot(3,3,9); plot(t,camera(:,3),'g'); title('Camera: z position')

%% plot section
min = 11;
i=15000*(min-1)+1;
e=15000*min;

figure('color','w','Name','Minuto 11','NumberTitle','off');
subplot(2,3,1); plot(t(i:e),leftTool(i:e,1),'b',t(i:e),rightTool(i:e,1),'r'); 
xlabel('seconds'); ylabel('mm'); title('Tools: x position'); %legend('left','right')
subplot(2,3,4); plot(t(i:e),camera(i:e,1),'g'); 
title('Camera: x position'); xlabel('seconds'); ylabel('mm');

subplot(2,3,2); plot(t(i:e),leftTool(i:e,2),'b',t(i:e),rightTool(i:e,2),'r'); 
xlabel('seconds'); ylabel('mm'); title('Tools: y position'); %legend('left','right')
subplot(2,3,5); plot(t(i:e),camera(i:e,2),'g'); 
title('Camera: y position'); xlabel('seconds'); ylabel('mm');

subplot(2,3,3); plot(t(i:e),leftTool(i:e,3),'b',t(i:e),rightTool(i:e,3),'r'); 
xlabel('seconds'); ylabel('mm'); title('Tools: z position'); %legend('left','right')
subplot(2,3,6); plot(t(i:e),camera(i:e,3),'g'); 
title('Camera: z position'); xlabel('seconds'); ylabel('mm');

%% ploteado sobre el espacio en lugar de sobre el tiempo
i = 15000;
e = 30000;
figure('color','w')
subplot(2,2,1); plot(leftTool(i:e,1),leftTool(i:e,2),'b',rightTool(i:e,1),rightTool(i:e,2),'r')
hold on; plot(camera(i:e,1), camera(i:e,2), 'g');

%% Comentarios sobre los datos de entrenamiento
% longitud de datos = 178.000 (unos 11 minutos de tarea)
% 1 minuto = 15.000 datos
% El espacio de trabajo es un rectangulo con los siguientes vertices:
%
%       (780,100) ------------------------ (780, -10)
%                 |                      |                 y <---|
%                 |                      |                       |
%                 |                      |                       v x
%                 |                      |    
%      (900, 100) ------------------------ (900, -10)
%
%               Para las herramientas: z � (-316, -400)
%               Para la camara:        z � (-141, -369)
%                                      x � (798, 910)
%                                      y � (-26, 64)
%
%  Marcar los gestos en las gr�ficas con rect�ngulos de colores
%  Comportamiento normal: seguir las herramientas
% Y luego este comportamiento se modifica de acuerdo a un conjunto de "gestos"
%       1) Zoom out: cuando las DOS herramientas se van hacia arriba. Si
%       solo se va una no se hace el zoom out. Se ve muy bien al menos en
%       los minutos 2, 4, 5, 8. (plotear grafico entero pero solo de la z,
%       arriba la x y la y, y abajo la z, o todo junto a ver como queda).
%       2) Zoom in: se hace un zoom cuando las dos herramientas est�n muy
%       juntas. Buscar como representar esto, quizas representando juntas
%       la x y la y de ambas herramientas
%       3) Seguimiento de las herramientas: ver si solo se sigue la
%       herramienta en movimiento, o como se realiza el seguimiento. 