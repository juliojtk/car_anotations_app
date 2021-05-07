final createTable = '''
CREATE TABLE carTable(
id INTEGER NOT NULL PRIMARY KEY, 
carName VARCHAR(200) NOT NULL, 
board VARCHAR(50) NOT NULL, 
color VARCHAR(100) NOT NULL, 
partPrice DOUBLE, 
segPrice DOUBLE, 
finishDate VARCHAR(100), 
description VARCHAR(250), 
isSeviceOk VARCHAR(10)
)
''';

final insert = '''
INSERT INTO carTable (carName, board, color, partPrice, segPrice, finishDate, description, isSeviceOk)
VALUES ('Pietro','JHI-45-39','Prata','10000,00', '200,00', '10/10/2021', 'teste', 'S')
''';
