function datetime_write(c_day,filename)

year = '2015';

%c_day = datenum(2015,12,01);
c_date = datestr(c_day, 'dd-mmm-yyyy');

cd(fullfile('E:\Internship\Load profile\',year,c_date))

fid = fopen(filename,'rt');
data = textscan(fid,'%q%q%*s%*s%*s%*s%*s%*s','Delimiter',{';'},'HeaderLines',6);

time_data = data{2};
date_data = data{1}; [b,m,n] = length(time_data);
date_data = date_data(m);

xls_filename = 'E:\RLM Load Profile 2015.xlsx';
xlRange1 = sprintf('A%d',row_offset);
xlswrite(xls_filename,date_data,1,xlRange1)

xlRange2 = sprintf('B%d',row_offset);
xlswrite(xls_filename,time_data,1,xlRange2)

end