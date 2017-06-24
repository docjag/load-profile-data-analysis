function comp_id = company_Id()

cd('E:\Internship\Load profile\2015\31-Dec-2015')

files = dir('E:\Internship\Load profile\2015\31-Dec-2015');

for i = 3:length(files)
    
    c_id = files(i).name;
    c_id = strsplit(c_id,'_EDM_');
    comp_id{i-2} = c_id(1);
end