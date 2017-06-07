function comp_id = company_Id()

cd('E:\Internship\Load profile\2015\31-Dec-2015')

files = dir('E:\Internship\Load profile\2015\31-Dec-2015');

for i = 3:length(files)
    
    comp_id{i-2} = files(i).name;
    
end