final createTable = '''
CREATE TABLE Pessoa(
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(200) NOT NULL
,contato VARCHAR(200) NOT NULL
,foto VARCHAR(300) NOT NULL
,referencia VARCHAR(300) NOT NULL
,data VARCHAR(300) NOT NULL
''';


final insert1 = '''
INSERT INTO Pessoa(nome,contato,data,referencia,foto)VALUES(
'Mona Lisa',11999999999,31/05/2021,Ref-512178,https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png,true)
''';

final insert2 = '''
INSERT INTO Pessoa(nome,contato,data,referencia,foto)VALUES(
'Picasso',11999999999,31/05/2021,Ref-512178,https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png,true)
''';