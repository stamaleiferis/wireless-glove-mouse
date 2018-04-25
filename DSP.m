import java.awt.Robot;
import java.awt.event.*;
robot = java.awt.Robot;
s = serial('COM5');  
set(s,'BaudRate',9600);  
fopen(s);  
interval = 1000000;  
passo = 1;
t = 1;
x1 = 0;
m1=0;
while(t<interval)
 a = str2num(fgetl(s));
 %x1 = [x1,a];
 %plot(x1);
 %drawnow;        %show serial port data on plot
 if(a==1 && m1==0)
     robot.mousePress  (java.awt.event.InputEvent.BUTTON1_MASK);
     m1=1;
 elseif(a==0 && m1==1)
     robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
     m1=0;
 t = t+passo;
 end   
end
fclose(s);  
