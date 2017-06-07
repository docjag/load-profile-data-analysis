function col_names = letter_index()

ind = 1;
for i = 65:66
    
    for j = 65:90
        
        
        col_names{ind} = [char(i) char(j)];
        
        if i == 66 && char(j) == 'H'
            break
        end
        ind = ind + 1;
    end
    
end