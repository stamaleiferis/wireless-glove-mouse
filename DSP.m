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

sport = 'COM6';
s = serial(sport);  
s.BytesAvailableFcnMode = 'terminator';
s.InputBufferSize = 24000;
%s.BytesAvailableFcnCount = 6;
set(s,'BaudRate',1000000);    %set Baud rate
s.BytesAvailableFcn = {@getValues}; %callback function when new set of data arrives
fopen(s);
figure(1)
hold on
%s.BytesAvailableFcnCount = num;   %set number of bytes that must be
%available to trigger callback

  

% while(true)
%  %a = str2num
%  %(fgetl(s));
% 
%  end   

%fclose(s); 


