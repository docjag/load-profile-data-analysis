clc;
clear;

conn = database.ODBCConnection('day_profile','','');

tablename = 'day_profile';
colname1 = {'collection_dates','collection_time','active_power','reactive_power'};

day = datenum(2016,8,8);
data = present_data(day);

data_table =[data{1} data{2} data{3} data{4}];

datainsert(conn, tablename, colname1, data_table);

sqlQuery = 'SELECT * FROM day_profile';
curs = exec(conn, sqlQuery);
curs = fetch(curs);

curs.Data
close(conn)