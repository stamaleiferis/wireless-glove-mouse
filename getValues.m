function [ax, ay, az] = getValues(obj, event)
    %fprintf(fgetl(obj));
    %fprintf('inside');
    tline = fgetl(obj);
    vals = str2double(strsplit(tline, '|'));
    ax = vals(1);
    ay = vals(2);
    az = vals(3);
    fprintf('ax: %0.5f \t ay: %0.5f \t az: %0.5f\n', ax,ay,az);
end