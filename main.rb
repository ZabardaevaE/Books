
require 'sinatra'
require 'pg'

def run_sql(sql, sql_params = [])
  db = PG.connect(dbname: 'books_db')
  results = db.exec_params(sql, sql_params)
  db.close
  results
end

get '/' do
  books = run_sql("SELECT * FROM books")

  erb :'books/index', locals: {
    books: books
  }
end

get '/books/new' do
  erb :'books/new'
end

post '/books' do
  name = params['name']
  image_url = params['image_url']
  author = params['author']
  genre = params['genre']
  year = params['year']
  run_sql("INSERT INTO books(name, image_url, author, genre, year) VALUES($1, $2, $3, $4, $5)", [name, image_url, author, genre, year])

  redirect '/'
end




    





