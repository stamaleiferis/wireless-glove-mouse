function [ax, ay, az] = getValues(obj, ~)
    %fprintf(fgetl(obj));
    %fprintf('inside');
    persistent n;
    if isempty(n) 
        n=0;
    end
    tline = fgetl(obj);
    vals = str2double(strsplit(tline, '|'));
    ax = vals(1);
    ay = vals(2);
    az = vals(3);
    fprintf('%d | ax: %0.5f \t ay: %0.5f \t az: %0.5f\n', n, ax,ay,az);
    stem(n,ax);
    n = n+1;
end