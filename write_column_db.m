path = 'C:\Users\SAZZAD\Desktop\STUDY_BOX_SUMMER_17\Lab-Distr. Grid Simulation\Task 3\Sincal Task 3';

% Name of network / .sin file (without ".sin")
netz_name = 'Task 3';

% Compile the required strings
dbpath = [path, filesep, netz_name, '_files\database.mdb'];


conurl = ['jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=' dbpath];
conn = database('','','','sun.jdbc.odbc.JdbcOdbcDriver', conurl);


element_id_DCI = exec(conn,'SELECT Element_ID FROM DCInfeeder');

element_id_DCI = fetch(element_id_DCI);

element_id_DCI= element_id_DCI.Data;


tablename = 'DCInfeeder';
colNamesDCInfeeder = {'DC_power'};

p = {0.1};

data_DCInfeeder = {p;p;p;p;p;p;p;p;p;p};

update(conn,tablename,colNamesDCInfeeder,data_DCInfeeder)

close(conn)