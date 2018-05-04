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
    %% read values from serial
    tline = fgetl(obj);
    vals = str2double(strsplit(tline, '|'));
    %%
    ax = vals(1) - 0.72;   % get ax value
    ay = vals(2) + 0.22;   % get ay value
    ax_vec(n) = ax; % add ax value to array
    az = vals(3);
    %ax_sum = ax_sum + ax;
    %fprintf('%d | ax: %0.5f \t ay: %0.5f \t az: %0.5f\n', n, ax,ay,az);
    %stem(n,ax);
    n = n+1;
    
    %% if ax and ay vectors are full, calculate displacement
    if length(ax_vec) == cutoff
       %calculate displacement
       vx_vec(ii) = sum(ax_vec);%trapz(ax_vec);
%        fprintf('Vx in AA is:\n');
%        display(vx_vec);
      % fprintf('Integration of VX is: %0.2f',vx_vec(ii));
       ii = ii + 1;
       %d = sum(ax_vec)/cutoff;
       %fprintf('Avg of ax: %d\n', d);
       ax_vec = [];
       n = 1;
    end
       %fprintf('Cleared array, curr length is: %d\n', length(ax_vec));
   if (ii == cutoff)
      calculate_displacement(); 
      ii = 1;
   end
       %move the mouse
    
    %% if n acceleration values have been read, move the mouse
%     if n == cutoff
%         d = ax_sum * 1;
%         fprintf('d is: %d\n',d);
%         ax_sum = 0;
%         n = 1;
%     end
end