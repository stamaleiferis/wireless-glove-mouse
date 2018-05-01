%import java.awt.Robot;
%import java.awt.event.*;
%robot = java.awt.Robot;
%sport = '/dev/cu.usbmodem1D1142';
%sport = '/dev/cu.usbmodem1412';
sport = 'COM5';
s = serial(sport);  
s.BytesAvailableFcnMode = 'terminator';

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


