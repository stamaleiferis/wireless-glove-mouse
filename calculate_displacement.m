function calculate_displacement()
global mouse; 
global ax_vec;
global vx_vec;
global ax_sum;
global ay_vec;
global n;
global ii;
global d_count;

displacement = sum(vx_vec);%trapz(vx_vec);
vx_vec = [];
stem(d_count,displacement);
d_count = d_count + 1;
fprintf('Displacement is: %0.2f\n', displacement);
%fprintf('Vx is:\n');
%display(vx_vec);



end