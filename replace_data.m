function newdata=replace_data(day)

data = present_data(day);

prof_dir='C:\Users\sazz_khan\Desktop\internship\New folder\profileonemonth\profileonemonth\';

for i=1:96
    if isnan(data{3}(i)) == 1
       
       nan_idx=find(isnan(data{3}));
       
       prev_day_dir=strcat(datestr(day-datenum(0,0,7)));
       
       cd(prof_dir);
       
       if exist(prev_day_dir,'file')==7
            
           data1=previousdata(day);
           
           data{3}(nan_idx)=data1{3}(nan_idx);
           
           disp('NAN in Present data has been replaced by previous week data');
        
       else
           
            while nan_idx > 1
                data{3}(nan_idx)=data{3}(nan_idx - 1);
                nan_idx = nan_idx - 1;
            end
                            
            
            disp('NAN in Present data has been replaced by previous row value');
        
       end
       
    

        
    else
        
        disp('NaN not found')
    end
    
    
end

    data{3}=num2str(data{3},2);
    data{4}=num2str(data{4},2);
    newdata=data;

end