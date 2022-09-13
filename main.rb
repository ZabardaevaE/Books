
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

get '/books/:id/edit' do
  id = params['id']
  book = run_sql("SELECT * FROM books WHERE id = $1", [id])[0]

  erb :'books/edit', locals: {
    book: book
  }
end

put '/books/:id' do
  id = params['id']
  name = params['name']
  image_url = params['image_url']
  author = params['author']
  genre = params['genre']
  year = params['year']
 


  run_sql("UPDATE books SET name = $2, image_url = $3, author = $4, genre = $5, year = $6 WHERE id = $1", [id,name, image_url, author, genre, year])
  redirect '/'
end

delete '/books/:id' do
  id = params['id']
  run_sql("DELETE FROM books WHERE id = $1", [id])
  redirect '/'
end





    





