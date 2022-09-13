def all_books
    run_sql("SELECT * FROM books ORDER BY id")
end

def create_book(name, image_url, author, genre, year)
    run_sql("INSERT INTO books(name, image_url, author, genre, year) VALUES($1, $2, $3, $4, $5)", [name, image_url, author, genre, year])
  end
  def get_book(id)
    run_sql("SELECT * FROM books WHERE id = $1", [id])[0]
  end

  def update_book(id,name, image_url, author, genre, year)
    run_sql("UPDATE books SET name = $2, image_url = $3, author = $4, genre = $5, year = $6 WHERE id = $1", [id,name, image_url, author, genre, year])
end

  def delete_book(id)
    run_sql("DELETE FROM books WHERE id = $1", [id])
  end