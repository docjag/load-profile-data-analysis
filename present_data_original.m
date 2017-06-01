function data=present_data(day)
%day=t1:1:t2;
day_dir=strcat(datestr(day));
cd('C:\Users\sazz_khan\Desktop\internship\New folder\profileonemonth\profileonemonth\');
if exist(day_dir,'file')==7
   cd(fullfile('C:\Users\sazz_khan\Desktop\internship\New folder\profileonemonth\profileonemonth',day_dir));
   k = datestr(day,'yyyymmdd');
    
	% Create a mat filename, and load it into a structure 	
    f=fullfile(strcat('DE0000288617900000000000277888R01_EDM_',char(k),'000000.csv'));
    
    if exist(f, 'file')==2
        fid = fopen(f,'rt');
		%{dd.mm.yyyy}D
        data_imp = textscan(fid,'%q%q%s%*s%*s%s%*s%*s',96,'Delimiter',{';'},'HeaderLines',6);
        
        data_imp{3}=strrep(data_imp{3},',','.');
        data_imp{4}=strrep(data_imp{4},',','.');
        
        data_imp{3}=str2double(data_imp{3});
        data_imp{4}=str2double(data_imp{4});
        
        
        data=data_imp;
        fclose(fid);
        %fprintf('file %s imported safely.\n',f);
	else
		fprintf('Warning..!!:File %s does not exist.\n',f);
    end
    
else
    disp('folder could not be found\n')
end