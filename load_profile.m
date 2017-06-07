clear all;
clc;

compId_write();

prof_dir = 'E:\Internship\Load profile\2015';
xls_filename = 'E:\RLM Load Profile 2015.xlsx';

row_offset = 4;

for c_day = sday:eday
    
    cd(fullfile(prof_dir));
    c_date = datestr(c_day,'dd-mmm-yyyy');
    
    if exist(c_date,'file')==7

        cd(fullfile(prof_dir, c_date));
        files = dir(fullfile(prof_dir, c_date));
        filename = files(1).name;
        datetime_write(c_day, filename);
        
        col_offset = 65;
        
        for i = 3:length(files)
            
            filename = files(i).name;
            fid = fopen(filename,'rt');
            data = textscan(fid,'%*q%*q%s%*s%*s%s%*s%*s','Delimiter',{';'},'HeaderLines',6);
            
            P = data{1}; P = strrep(P,',','.'); P = str2double(P);
            Q = data{2}; Q = strrep(Q,',','.'); Q = str2double(Q);        
            
            comp_id = company_Id();
            
            
             
               
                for j = 1:29
                
                
                    if strcmpi(filename, comp_id{j})
                        
                        if col_offset<= 90
                        
                            xlRange1 = sprintf('%c%d',col_offset, row_offset);
                            
                        else
                            xlRange1 = 
                        end
                        
                        xlswrite(xls_filename,P,1,xlRange1)
                    end
                end
            end
        end