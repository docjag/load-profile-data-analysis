clear all;
clc;

sday = datenum(2015,12,01); eday = datenum(2015,12,02);

comp_id = company_Id();

%compId_write();
col_names = letter_index();

prof_dir = 'E:\Internship\Load profile\2015';
xls_filename = 'E:\RLM Load Profile 2015.xlsx';

row_offset = 4;

for c_day = sday:eday
    
    ind = 1;
    cd(prof_dir);
    c_date = datestr(c_day,'dd-mmm-yyyy');
    
    col_offset = 65;
    
    if exist(c_date,'file')==7

        files = dir(fullfile(prof_dir, c_date));
        filename = files(3).name;
        datetime_write(c_day, filename, row_offset);
        
    
        for j = 1:29
            
            col_offset = col_offset + j*2;
        
            for i = 3:length(files)
            
            
                cd(fullfile(prof_dir, c_date));
                filename = files(i).name;
                f_id = strsplit(filename,'_EDM_');
                f_id = f_id(1);
            
                fid1 = fopen(filename,'rt');
                data = textscan(fid1,'%*q%*q%s%*s%*s%s%*s%*s','Delimiter',{';'},'HeaderLines',6);
            
                P = data{1}; P = strrep(P,',','.'); P = str2double(P);
                Q = data{2}; Q = strrep(Q,',','.'); Q = str2double(Q);        
            
                if strcmpi(f_id, comp_id{j})
                    
                    if col_offset <= 90
                            
                        xlRange1 = sprintf('%c%d',col_offset, row_offset)
                        
                    else
                        
                        ind = col_offset - 90 
                        r= sprintf('%d', row_offset)
                        xlRange1 = [col_names{ind} r]
                        
                    end
                    
                    xlswrite(xls_filename,P,1,xlRange1);
                        
                end
                    
                    %col_offset
                    
            end
            
            fclose(fid1);
            
        end
        
        row_offset = row_offset + length(P);
    end    
end
