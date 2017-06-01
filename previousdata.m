function data1=previousdata(day)

% day=t1:1:t1;
%day=day-7;

data1=present_data(day-datenum(0,0,7));

fprintf('previous week data extracted\n');

end