cd('E:\Internship\New Task')
load('khan.mat')

% station(1) = s1039v; 460 ; 10000
% 
% station(2) = s640v;   230 ; 5000
% 
% station(3) = s667v;   230 ; 5000
% 
% station(4) = s677v;   460 ; 10000
% 
% station(5) = s679v;   230 ; 5000
% 
% station(6) = s697v;   230 ; 5000
% 
% station(7) = s700v;   230 ; 5000


station = s677v;
station_name = varname(s677v);
station_freq = s677fr;
nom_freq = 10000;
nom_voltage = 460;

%n = 161280/(4*60*24); %total number of days
n = 28;



% Voltage between phase a and b
Vab = station(:,1)/100;
Vab(Vab == 0) = nom_voltage;% Replace zeros

% Take 10 mean average
V_ab = reshape(Vab,40,[]); %10 mins = 40 readings
V_ab = mean(V_ab);

% Voltage between phase b and c
Vbc = s1039v(:,2)/100;
Vbc(Vbc == 0) = 460;% Replace zeros

% Take 10 mean average
V_bc = reshape(Vbc,40,[]); %10 mins = 40 readings
V_bc = mean(V_bc);

% Voltage between phase c and a
Vca = s1039v(:,3)/100;
Vca(Vca == 0) = 460;% Replace zeros

% Take 10 mean average
V_ca = reshape(Vca,40,[]); %10 mins = 40 readings
V_ca = mean(V_ca);
 

t1 = datenum(2017,5,1,00,00,00);
del_t = datenum(0,0,0,0,10,00);
t2 = t1 + n - del_t; %change n(no. of days) for changing time duration for the plot

t = t1:del_t:t2;length(t)
figure('Name',['Station ',station_name(1:5)]);
plot(t,V_ab(1:length(t)),'r',t,V_bc(1:length(t)),'k',t,V_ca(1:length(t)),'y');
datetick('x','dd:mm:yy','keepticks','keeplimits')
xlabel('time duration');ylabel('Voltage (V)');
legend('Vab','Vbc','Vca');
title('Three phase Line to Line Voltages');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Unbalance Factor calculation ---CIGRE Definition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num_beta = Vab.^4 + Vbc.^4 + Vca.^4;
den_beta = (Vab.^2 + Vbc.^2 + Vca.^2).^2;

beta = num_beta./den_beta;

num = (1-sqrt(3-6*beta));

den = (1 +sqrt(3-6*beta));

Unbalance_factor = sqrt(num./den);

t1 = datenum(2017,5,1,00,00,00);
del_t = datenum(0,0,0,0,0,15);
t2 = t1 + n - del_t;

t = t1:del_t:t2;length(t);
figure('Name',['Station ',station_name(1:5)]);
plot(t,Unbalance_factor(1:length(t)),'r');
datetick('x','dd:mm:yy','keepticks','keeplimits')
xlabel('time duration');ylabel('CIGRE Unbalance Factor');
title('Unbalance factor according to CIGRE definition');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Unbalance Factor calculation ---PVUR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Va = Vab./sqrt(3);
Vb = Vbc./sqrt(3);
Vc = Vca./sqrt(3);

Vavg = (Va + Vb + Vc)./3;

num = max([abs(Va - Vavg),abs(Vb - Vavg),abs(Vc - Vavg)]);

PVUR = num./Vavg;

t1 = datenum(2017,5,1,00,00,00);
del_t = datenum(0,0,0,0,0,15);
t2 = t1 + n - del_t;

t = t1:del_t:t2;length(t);
figure('Name',['Station ',station_name(1:5)]);
plot(t,PVUR(1:length(t)),'r');
datetick('x','dd:mm:yy','keepticks','keeplimits')
xlabel('time duration');ylabel('PVUR (%)');
title('PVUR');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Unbalance Factor calculation ---PVUR1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vmax = max([Va, Vb, Vc]);

Vmin = min([Va, Vb, Vc]);

PVUR1 = (Vmax - Vmin)./Vavg;

t1 = datenum(2017,5,1,00,00,00);
del_t = datenum(0,0,0,0,0,15);
t2 = t1 + n - del_t;

t = t1:del_t:t2;length(t);
figure('Name',['Station ',station_name(1:5)]);
plot(t,PVUR1(1:length(t)),'r');
datetick('x','dd:mm:yy','keepticks','keeplimits')
xlabel('time duration');ylabel('PVUR1 (%)');
title('PVUR1');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Frequency plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


f = station_freq(:);
f(f == 0) = nom_freq;

t1 = datenum(2017,5,1,00,00,00);
del_t = datenum(0,0,0,0,0,15);
t2 = t1 + n - del_t;

t = t1:del_t:t2;length(t);
figure('Name',['Station ',station_name(1:5)]);
plot(t,f(1:length(t)),'r');
datetick('x','dd:mm:yy','keepticks','keeplimits')
xlabel('time duration');ylabel('Frequency (Hz)');
title('Frequency');