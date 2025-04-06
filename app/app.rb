require 'sinatra'
require 'sqlite3'

DB = SQLite3::Database.new ENV['DB_PATH'] || 'app.db'

# Página inicial com o formulário
get '/' do
  erb :formulario
end

get '/usuarios' do
  @usuarios = DB.execute("SELECT id, nome, sexo, email FROM usuarios")
  erb :usuarios
end

# Processa o formulário (POST request)
post '/salvar' do
  nome = params[:nome]  # Captura o nome enviado pelo formulário
  sexo = params[:sexo]  # Captura o sexo enviado pelo formulário 
  email = params[:email]  # Captura o email enviado pelo formulário

  #Salvar no banco de dados
  DB.execute("INSERT INTO usuarios (nome, sexo, email) VALUES (?, ?, ?)", [nome, sexo, email])

  "Dados salvos com sucesso! Nome: #{nome}, Sexo: #{sexo}, Email: #{email}"
end


