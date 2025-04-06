require 'sqlite3'

db = SQLite3::Database.new ENV['DB_PATH'] || 'app.db'


db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    sexo TEXT,
    email TEXT
  );
SQL

puts "Tabela criada com sucesso!"
