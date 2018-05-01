b,a]=butter(2,f/Fs,'low'); 
[d,c]=butter(2,f/Fs,'high');
a=filter(b,a,signal);
v=cumtrapz(t,a);
v=filter(d,c,v);
s=cumtrapz(t,v);
where:
f- signal frequency.
Fs- sampling frequency
signal - acceleration signal (input)
a - acceleration vector without noise (after filtering)
v,s,t - velocity, displacement and time vectors