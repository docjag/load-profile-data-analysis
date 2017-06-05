sday = datenum (2015,10,23); eday = datenum(2015,12,31);
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
            f_date = datestr(f_date, 'dd-mmm-yyyy');
            
            if startsWith(f, 'Station')
                disp(f);
                count = count + 1;
            else
                disp('kono station nai');
            end
            
            if strcmpi(f_date, c_date)
            %    sprintf('matched %s', c_date)
            else
             %   sprintf('not matched %s', c_date);
                %count = count + 1;
            end
        end
    end
end