cols = ['AA1';'AB1';'AC1';'AD1';'AE1'];
col_cells = cellstr(cols);


%%%%% this part should be in the else inside the for loop %%%

% n = 29
% for i = 1: n

  %if col_offset > XXX && col_offset < YYY
 
 
  
  else
    % subtract 24 from i because you need the index 1,2,3,4,5
    % when i = 25, ind = 25 - 24 = 1, col_cells(1) = 'AA1'
    % when i = 26, ind = 26 -24 = 2, col_cells(1) = 'AB1'
    % when i = 27, ind = 27 - 24 = 3, col_cells(1) = 'AC1'
    % when i = 28, ind = 28 - 24 = 4, col_cells(1) = 'AD1'
    % when i = 25, ind = 29 - 24 = 5, col_cells(1) = 'AE1'
    
    
    ind = i - 24  
    
    xlsRange = col_cells(ind);
    
    end
    