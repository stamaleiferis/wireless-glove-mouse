function [ax, ay, az] = getValues(obj, ~)
    %% import and initialize variables
    global mouse; 
    global ax_vec;
    global vx_vec;
    global ay_vec;
    global n;
    global cutoff
    global ax_sum;
    global ii;
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
    %% read values from serial
    tline = fgetl(obj);
    vals = str2double(strsplit(tline, '|'));
    %%
    ax = vals(1)/16384 - 0.06;   % get ax value
    ay = vals(2)/16384;   % get ay value
    ax_vec(n) = ax; % add ax value to array
    l=vals(4);
    r=vals(5);
    %clickleft = (vals(4)>155);
    %clickright = (vals(5)>200);
    if (~l && m1==0)
        mouse.mousePress(java.awt.event.InputEvent.BUTTON3_DOWN_MASK);
        m1=1;
       
    elseif(l && m1==1)
        mouse.mouseRelease(java.awt.event.InputEvent.BUTTON3_DOWN_MASK);
        m1=0; 
    end
    if (~r && m2==0)
        mouse.mousePress  (java.awt.event.InputEvent.BUTTON1_DOWN_MASK);
        m2=1;
    elseif(r && m2==1)
        mouse.mouseRelease(java.awt.event.InputEvent.BUTTON1_DOWN_MASK);
        m2=0; 
    end   
    %ax_sum = ax_sum + ax;
    %fprintf('%d | ax: %0.5f \t ay: %0.5f \t az: %0.5f\n', n, ax,ay,az);
    %fprintf('Left is clicked %d, Left was clicked: %d || Right is clicked: %d, was clicked %d\n',l, m1, r, m2);
    %stem(n,ax);
    %n = n+1;
    
    %% new method
    %X=-100*ay+X;
    %Y=100*ax+Y;
    X=-fx*ay+bx;
    Y=-fy*ax+by;
    mouse.mouseMove(X,Y);
%% old method    
%     %% if ax and ay vectors are full, calculate displacement
%     if length(ax_vec) == cutoff
%        %calculate displacement
%        vx_vec(ii) = sum(ax_vec);%trapz(ax_vec);
% %        fprintf('Vx in AA is:\n');
% %        display(vx_vec);
%       % fprintf('Integration of VX is: %0.2f',vx_vec(ii));
%        ii = ii + 1;
%        %d = sum(ax_vec)/cutoff;
%        %fprintf('Avg of ax: %d\n', d);
%        ax_vec = [];
%        n = 1;
%     end
%        %fprintf('Cleared array, curr length is: %d\n', length(ax_vec));
%    if (ii == cutoff)
%       calculate_displacement(); 
%       ii = 1;
%    end
       %move the mouse
    
    %% if n acceleration values have been read, move the mouse
%     if n == cutoff
%         d = ax_sum * 1;
%         fprintf('d is: %d\n',d);
%         ax_sum = 0;
%         n = 1;
%     end
end