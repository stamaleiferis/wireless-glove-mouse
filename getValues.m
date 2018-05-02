function [ax, ay, az] = getValues(obj, ~)
    %% import and initialize variables
    global mouse; 
    global ax_vec;
    global ay_vec;
    global n;
    global cutoff
    global ax_sum;
    %% read values from serial
    tline = fgetl(obj);
    vals = str2double(strsplit(tline, '|'));
    %%
    ax = vals(1);   % get ax value
    %ax_vec(n) = ax; % add ax value to array
    ay = vals(2);   % get ay value
    az = vals(3);
    ax_sum = ax_sum + ax;
    %fprintf('%d | ax: %0.5f \t ay: %0.5f \t az: %0.5f\n', n, ax,ay,az);
    %stem(n,ax);
    n = n+1;
    
    %% if ax and ay vectors are full, calculate displacement
%     if length(ax_vec) == cutoff
%        %calculate displacement
%        d = sum(ax_vec);
%        fprintf('!!!%d\n', d);
%        ax_vec = [];
%        fprintf('Cleared array, curr length is: %d', length(ax_vec));
%        %move the mouse
%     end
    %% if n acceleration values have been read, move the mouse
    if n == cutoff
        d = ax_sum * 1;
        fprintf('d is: %d\n',d);
        ax_sum = 0;
        n = 1;
    end
end