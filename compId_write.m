function compId_write()

cd('E:\Internship\Load profile\2015\31-Dec-2015')

files = dir('E:\Internship\Load profile\2015\31-Dec-2015');

col_offset = 67;
ind = 1;
col_names = letter_index();

P = cellstr('Active Power');
Q = cellstr('Reactive Power');

for i = 3:length(files)
    
    filename = files(i).name;
    
    split_filename = strsplit(filename,'_EDM_');
    compId = split_filename(1);
    
    xls_filename = 'E:\RLM Load Profile 2015.xlsx';
    
    if col_offset <= 90
        
        
        xlRange1 = sprintf('%c1',col_offset);
        xlswrite(xls_filename,compId,1,xlRange1);
        
        xlRange_active = sprintf('%c2',col_offset);
        xlswrite(xls_filename,P,1,xlRange_active);
        
        xlRange_reactive = sprintf('%c2',col_offset + 1);
        xlswrite(xls_filename,Q,1,xlRange_reactive);
        
        col_offset = col_offset + 2;
        
    else
        
        xlRange2 = strcat(col_names{ind},'1');
        xlswrite(xls_filename,compId,1,xlRange2);
        
        
        xlRange_active = strcat(col_names{ind},'2');
        xlswrite(xls_filename,P,1,xlRange_active);
        
        xlRange_reactive = strcat(col_names{ind+1},'2');
        xlswrite(xls_filename,Q,1,xlRange_reactive);
        ind = ind + 2;
        
    end
end 