# require './models/book'

# get '/' do
#     books = all_books()
  
#     erb :'books/index', locals: {
#       books: books
#     }
#   end
  
#   get '/books/new' do
#     erb :'books/new'
#   end
  
#   post '/books' do
#     name = params['name']
#     image_url = params['image_url']
#     author = params['author']
#     genre = params['genre']
#     year = params['year']
    
#     create_book(name, image_url, author, genre, year)
  
#     # if the request is NOT a GET request, then we must redirect instead of using erb.
#     redirect '/'
#   end
  
#   get '/books/:id/edit' do
#     id = params['id']
#     book = get_book(id)
  
#     erb :'books/edit', locals: {
#       book: book
#     }
#   end
  
#   put '/books/:id' do
#     id = params['id']
#     name = params['name']
#     image_url = params['image_url']
#     author = params['author']
#     genre = params['genre']
#     year = params['year']

#     update_book(id, name, image_url, author, genre, year)
#     redirect '/'
#   end
  
#   delete '/books/:id' do
#     id = params['id']
    
#     delete_book(id)
#     redirect '/'
#   end

require './models/book'

get '/' do
    # books = all_books()
    owner_id = session['user_id']
    logged_books = book_owner(owner_id)
  
    erb :'books/index', locals: {
      books: logged_books
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
    owner_id = session['user_id']
    
    create_book(name, image_url, author, genre, year, owner_id)
  
    # if the request is NOT a GET request, then we must redirect instead of using erb.
    redirect '/'
  end
  
  get '/books/:id/edit' do
    id = params['id']
    book = get_book(id)
  
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

    update_book(id, name, image_url, author, genre, year)
    redirect '/'
  end
  
  delete '/books/:id' do
    id = params['id']
    
    delete_book(id)
    redirect '/'
  end

  