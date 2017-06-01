clc;
clear;

conn = database.ODBCConnection('day_profile','','');

%setdbprefs('DataReturnFormat','cellarray');

%datainsert(conn,'yearlySales',colnames,monthly);
%,'times','Active_power','Reactive_power'
tablename = 'day_profile';
colname1 = {'collection_dates','collection_time','active_power','reactive_power'};

% colname2= {};
% colname3={};
% colname4={};
day = datenum(2016,8,8);
data = present_data(day);
%data_cell = cellstr(char(data{1}));
%data3=char(data{3});

data_table =[data{1} data{2} data{3} data{4}];

datainsert(conn, tablename, colname1, data_table);

% datainsert(conn, tablename, colname2, data{2});
% datainsert(conn, tablename, colname3, data{3});
% datainsert(conn, tablename, colname4, data{4});
%fastinsert(conn, tablename, colname, data_table);

sqlQuery = 'SELECT * FROM day_profile';
curs = exec(conn, sqlQuery);
curs = fetch(curs);

curs.Data
close(conn)
