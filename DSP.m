import java.awt.Robot;
import java.awt.event.*;
global mouse; 
global ax_vec;
global vx_vec;
global ax_sum;
global ay_vec;
global n;
global cutoff;
global factor; %takes into account dt and mouse move factor
global ii;
global d_count;
global X;
global Y;
global sr;
global fy;
global by;
global fx;
global bx;
global m1;
global m2;
global l;
global r;
l=0;
r=0;
m1=0;%left button has been pressed or not
m2=0;%right button has been pressed or not
sr=get(0, 'screensize');
fy=(-1)*sr(4)/1.4;
by=sr(4)/2;
fx=(1)*sr(3)/1.4;
bx=sr(3)/2;
mouse = java.awt.Robot;
ax_vec = [];
vx_vec = [];
ax_sum = 0;
ay_vec = 0;
n = 1;
cutoff = 5;
factor = 1;
ii = 1;
d_count = 0;
X=0;
Y=0;
sport = 'COM12';
baudRate = 115200;
s = serial(sport);  
s.BytesAvailableFcnMode = 'terminator';
s.InputBufferSize = 24000;
%s.BytesAvailableFcnCount = 6;
set(s,'BaudRate',baudRate);    %set Baud rate
s.BytesAvailableFcn = {@getValues}; %callback function when new set of data arrives
fopen(s);
%figure(1)
%hold on
%s.BytesAvailableFcnCount = num;   %set number of bytes that must be
%available to trigger callback

  

% while(true)
%  %a = str2num
%  %(fgetl(s));
% 
%  end   

%fclose(s); 


