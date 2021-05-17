%% This is the source code for creating a logo with the letters F and S

% The first letter, which is the F, is drawn first in 2D before extrusion.

f_letter=[1,1;1,4;3,4;3.5,5;3,5;1,5;1,6;3.5,6;4,7;1,7];
plot(f_letter(:,1),f_letter(:,2));

% Write the next command line to be sure that all the 2D plots are correctly
% drawn.

hold on

% Creating semi-circles to form the s-letter

% Upper s-letter: External semi-circle

th = linspace( pi/2, 3*pi/2, 91); 
R = 1.5;  %or whatever radius you want
x1 = R*cos(th) + 0.8;
y1 = R*sin(th) + 5.5;
plot(x1,y1); axis equal;
sxy1=[x1;y1]; % Sequence of points for drawing the external semi-circle

% Upper s-letter: Internal semi-circle

th = linspace( 3*pi/2, pi/2, 91); 
%invert the angular sweep of the first semicircle and reduce the radius
R = 1;  %or whatever radius you want
x2 = R*cos(th) + 0.8;
y2 = R*sin(th) + 5.5;
plot(x2,y2); axis equal;
sxy2=[x2;y2]; % Sequence of points for drawing the internal semi-circle

% Sequence of points for merging both semi-circles through a connecting
% line

upper_s=[sxy1';0.8,4.4;sxy2']; 
plot(upper_s(:,1),upper_s(:,2));  axis equal;

% The lower par of the s-letter was created by adding another 'Extruded
% Solid' block along with another 'Rigid Transform' block, so that both
% axial and angular positions can be deliberately changed. 

% Finally, open the Simulink Model which depicts the aforementioned by running
% the following command line. Be sure of charging the respective matrices
% inside each 'Extruded Solid' block. 
open_system('Logo_Flavio') 

% After opening the file, run the simulation. You can adjust as much features 
% as desired from the Mechanics Explorer, except the color and size of the
% letters, which are modified from the Simulink Model by entering to each
% 'Extruded Solid' block for such purpose.
