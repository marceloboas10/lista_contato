const createTable = '''
CREATE TABLE contatos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(50) NOT NULL,
  telefone CHAR(16) NOT NULL,
  email VARCHAR(60) NOT NULL,
  url_avatar VARCHAR(300) NOT NULL
)
''';

const insert1 = '''
  INSERT INTO contatos(
    nome, telefone, email, url_avatar) VALUES("Jhon","(16)99133-3456","jhon@terra.com.br","https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_1280.jpg")
''';

const insert2 = '''
  INSERT INTO contatos(
    nome, telefone, email, url_avatar) VALUES("Sammy","(16)99132-1345","sammy@gmail.com","https://cdn.pixabay.com/photo/2017/03/05/23/14/girl-2120196_640.jpg")
''';

const insert3 = '''
  INSERT INTO contatos(
    nome, telefone, email, url_avatar) VALUES("Bob","(16)99134-7654","bob@hotmail.com","https://cdn.pixabay.com/photo/2015/06/06/22/38/baby-799956_640.jpg")
''';
