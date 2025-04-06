FROM ruby:3.2

# Instala dependências do SQLite3
RUN apt-get update && apt-get install -y libsqlite3-dev

WORKDIR /app

COPY Gemfile ./
RUN bundle install
# Copia tudo, incluindo a pasta views
COPY . .  


EXPOSE 4567

# Executa o setup do banco antes de iniciar o servidor
CMD ruby setup_db.rb && ruby app.rb -o 0.0.0.0

