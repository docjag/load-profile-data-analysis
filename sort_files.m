sday = datenum (2015,01,01); eday = datenum(2015,12,31);
prof_dir = 'E:\Internship\Load profile';

year = '2015';

count = 0;

for c_day = sday:eday
    %c_day = datenum(2015,10,23);
    cd(fullfile(prof_dir, year));
    c_date = datestr(c_day,'dd-mmm-yyyy');
    
    if exist(c_date,'file')==7

        cd(fullfile(prof_dir,year,c_date));
        
        files = dir(fullfile(prof_dir, year, c_date));
        
        for i = 3:length(files)
            
            f = files(i).name;
            split_f = strsplit(f, {'_EDM_','000000.csv'});
            f_date = split_f(2);
            f_date = datenum(f_date, 'yyyymmdd');
            dest_date = datestr(f_date, 'dd-mmm-yyyy');
            dest_date = char(dest_date);
            
            split_date = strsplit(dest_date, '-');
            dest_year = char(split_date(3));
            
            
            if strcmpi(dest_date, c_date) == 0
                cd(fullfile(prof_dir, dest_year));
                
                count = count + 1;
                
                if exist (dest_date,'file')== 7
                   
                    movefile(fullfile(prof_dir, year,c_date,f), fullfile(prof_dir, dest_year, dest_date))
                    
                else
                    mkdir(dest_date)
                    movefile(fullfile(prof_dir, year,c_date,f), fullfile(prof_dir, dest_year, dest_date))
                end
            end
        end
    end
end