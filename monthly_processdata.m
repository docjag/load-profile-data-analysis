function data=monthly_processdata(stime,etime)

delta=datenum(0,0,1);

for day=stime:delta:etime
    %idx=find(date,day);
        
        date=stime:1:etime;
        n=length(date);
        
        for i=1:1:n
            while day==date(i)
                
                data{i}=replace_data(day);
                
                break  
            end
                  
              
              
        end
              
              
              
end


end