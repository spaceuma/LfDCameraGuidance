%% Reading Training data from mat files

% Obtaining positions of instruments and camera
% Datos de entrenamiento:
[l1, r1, c1] = readfile('pegs_13feb_1');
[l2, r2, c2] = readfile('pegs_13feb_2');
[l3, r3, c3] = readfile('pegs_13feb_3');
[l4, r4, c4] = readfile('pegs_13feb_4_1');
[l5, r5, c5] = readfile('pegs_13feb_4_2');
[l6, r6, c6] = readfile('pegs_13feb_5_1');
[l7, r7, c7] = readfile('pegs_13feb_5_2');

training_left = vertcat(l1,l2,l3,l4,l5,l6,l7)*1000;
training_right = vertcat(r1,r2,r3,r4,r5,r6,r7)*1000;
training_camera = vertcat(c1,c2,c3,c4,c5,c6,c7)*1000;

% Datos de la reproduccion
[l8, r8, c8] = readfile('pegsplay23Feb5Marz_grabado_3_0');
[l9, r9, c9] = readfile('pegsplay23Feb5Marz_grabado_3_1');

task_left = vertcat(l8,l9)*1000;
task_right = vertcat(r8,r9)*1000;
task_camera = vertcat(c8,c9)*1000;

fz = 250;
T = 1/fz;
t = 0:T:length(training_left)/fz; % pasamos las iteraciones a segundos para poder plotear luego
t(end) = [];
tr = 0:T:length(task_left)/fz; % pasamos las iteraciones a segundos para poder plotear luego
tr(end) = [];

%% plot positions
figure('color','w','Name','Training Data','NumberTitle','off')
subplot(3,3,1); plot(t,training_left(:,1),'b'); title('Left Tool: x position')
subplot(3,3,4); plot(t,training_right(:,1),'r'); title('Right Tool: x position')
subplot(3,3,7); plot(t,training_camera(:,1),'g'); title('Camera: x position')

subplot(3,3,2); plot(t,training_left(:,2),'b'); title('Left Tool: y position')
subplot(3,3,5); plot(t,training_right(:,2),'r'); title('Right Tool: y position')
subplot(3,3,8); plot(t,training_camera(:,2),'g'); title('Camera: y position')

subplot(3,3,3); plot(t,training_left(:,3),'b'); title('Left Tool: z position')
subplot(3,3,6); plot(t,training_right(:,3),'r'); title('Right Tool: z position')
subplot(3,3,9); plot(t,training_camera(:,3),'g'); title('Camera: z position')

figure('color','w','Name','Task Data','NumberTitle','off')
subplot(3,3,1); plot(tr,task_left(:,1),'b'); title('Left Tool: x position')
subplot(3,3,4); plot(tr,task_right(:,1),'r'); title('Right Tool: x position')
subplot(3,3,7); plot(tr,task_camera(:,1),'g'); title('Camera: x position')

subplot(3,3,2); plot(tr,task_left(:,2),'b'); title('Left Tool: y position')
subplot(3,3,5); plot(tr,task_right(:,2),'r'); title('Right Tool: y position')
subplot(3,3,8); plot(tr,task_camera(:,2),'g'); title('Camera: y position')

subplot(3,3,3); plot(tr,task_left(:,3),'b'); title('Left Tool: z position')
subplot(3,3,6); plot(tr,task_right(:,3),'r'); title('Right Tool: z position')
subplot(3,3,9); plot(tr,task_camera(:,3),'g'); title('Camera: z position')

%% plot section
min = 11;
i=15000*(min-1)+1;
e=15000*min;

figure('color','w','Name','Minuto 11','NumberTitle','off');
subplot(2,3,1); plot(t(i:e),training_left(i:e,1),'b',t(i:e),training_right(i:e,1),'r'); 
xlabel('seconds'); ylabel('mm'); title('Tools: x position'); %legend('left','right')
subplot(2,3,4); plot(t(i:e),training_camera(i:e,1),'g'); 
title('Camera: x position'); xlabel('seconds'); ylabel('mm');

subplot(2,3,2); plot(t(i:e),training_left(i:e,2),'b',t(i:e),training_right(i:e,2),'r'); 
xlabel('seconds'); ylabel('mm'); title('Tools: y position'); %legend('left','right')
subplot(2,3,5); plot(t(i:e),training_camera(i:e,2),'g'); 
title('Camera: y position'); xlabel('seconds'); ylabel('mm');

subplot(2,3,3); plot(t(i:e),training_left(i:e,3),'b',t(i:e),training_right(i:e,3),'r'); 
xlabel('seconds'); ylabel('mm'); title('Tools: z position'); %legend('left','right')
subplot(2,3,6); plot(t(i:e),training_camera(i:e,3),'g'); 
title('Camera: z position'); xlabel('seconds'); ylabel('mm');

%% ploteado sobre el espacio en lugar de sobre el tiempo
i = 15000;
e = 30000;
figure('color','w')
subplot(2,2,1); plot(training_left(i:e,1),training_left(i:e,2),'b',training_right(i:e,1),training_right(i:e,2),'r')
hold on; plot(training_camera(i:e,1), training_camera(i:e,2), 'g');

%% zoom out gesture

figure('color','w','Name','zoom out gesture','NumberTitle','off')
subplot(2,1,1); plot(t,training_left(:,3),'b',t,training_right(:,3),'r');
title('Tools position (z-axis)'); legend('Left tool', 'Right tool')
xlabel('seconds'); ylabel('mm');
subplot(2,1,2);  plot(t,training_camera(:,3),'g'); title('Camera position (z-axis)')
xlabel('seconds'); ylabel('mm');


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
%               Para las herramientas: z € (-316, -400)
%               Para la camara:        z € (-141, -369)
%                                      x € (798, 910)
%                                      y € (-26, 64)
%
%  Marcar los gestos en las gráficas con rectángulos de colores
%  Comportamiento normal: seguir las herramientas
% Y luego este comportamiento se modifica de acuerdo a un conjunto de "gestos"
%       1) Zoom out: cuando las DOS herramientas se van hacia arriba. Si
%       solo se va una no se hace el zoom out. Se ve muy bien al menos en
%       los minutos 2, 4, 5, 8. (plotear grafico entero pero solo de la z,
%       arriba la x y la y, y abajo la z, o todo junto a ver como queda).
%       2) Zoom in: se hace un zoom cuando las dos herramientas están muy
%       juntas. Buscar como representar esto, quizas representando juntas
%       la x y la y de ambas herramientas
%       3) Seguimiento de las herramientas: ver si solo se sigue la
%       herramienta en movimiento, o como se realiza el seguimiento. 


%% Velocities (suponemos datos recogidos a 100 Hz)
for i = 1:1:length(training_left)-1
    vleft_x = (training_left(i+1,1)-training_left(i,1))/T;
    vleft_y = (training_left(i+1,2)-training_left(i,2))/T;
    vleft_hor(i) = sqrt(vleft_x^2 + vleft_y^2);
    vleft_z(i) = (training_left(i+1,3)-training_left(i,3))/T;
    
    vright_x = (training_right(i+1,1)-training_right(i,1))/T;
    vright_y = (training_right(i+1,2)-training_right(i,2))/T;
    vright_hor(i) = sqrt(vright_x^2 + vright_y^2);
    vright_z(i) = (training_right(i+1,3)-training_right(i,3))/T;
    
    vcamera_x = (training_camera(i+1,1)-training_camera(i,1))/T;
    vcamera_y = (training_camera(i+1,2)-training_camera(i,2))/T;
    vcamera_hor(i) = sqrt(vcamera_x^2 + vcamera_y^2);
    vcamera_z(i) = (training_camera(i+1,3)-training_camera(i,3))/T;    
end

% plot velocities
figure('color','w')
subplot(3,2,1); plot(vleft_hor,'b'); title('Left Tool horizontal velocity')
subplot(3,2,3); plot(vright_hor,'r'); title('Right Tool horizontal velocity')
subplot(3,2,5); plot(vcamera_hor,'g'); title('Camera horizontal velocity')

subplot(3,2,2); plot(vleft_z,'b'); title('Left Tool vertical velocity')
subplot(3,2,4); plot(vright_z,'r'); title('Right Tool vertical velocity')
subplot(3,2,6); plot(vcamera_z,'g'); title('Camera vertical velocity')