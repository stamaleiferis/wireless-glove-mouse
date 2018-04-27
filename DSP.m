%import java.awt.Robot;
%import java.awt.event.*;
%robot = java.awt.Robot;
%sport = '/dev/cu.usbmodem1D1142';
%sport = '/dev/cu.usbmodem1412';
sport = '/dev/cu.usbmodem1A122';
s = serial(sport);  
s.BytesAvailableFcnMode = 'terminator';

%s.BytesAvailableFcnCount = 6;
set(s,'BaudRate',9600);
s.BytesAvailableFcn = {@getValues};
fopen(s);
%s.BytesAvailableFcnCount = num;   %set number of bytes that must be
%available to trigger callback

  

% while(true)
%  %a = str2num
%  %(fgetl(s));
% 
%  end   

fclose(s); 


