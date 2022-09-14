CREATE DATABASE books_db;
\c books_db
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    name TEXT,
    author TEXT,
    image_url TEXT,
    genre TEXT,
    year INTEGER
);


INSERT INTO books(name, author, image_url, genre, year)
VALUES('The Mousetrap', 'Agatha Christie','https://images.unsplash.com/photo-1518380817578-3e32a02eea74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YWdhdGhhJTIwY2hyaXN0aWUlMjBtb3VzZXRyYXB8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'crime fiction', 1952);

INSERT INTO books(name, author, image_url, genre, year)
VALUES('The Great Gatsby', 'F. Scott Fitzgerald', 'https://images.unsplash.com/photo-1615413833480-6e8427dbcc5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGhlJTIwZ3JlYXQlMjBnYXRzYnl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', 'tragedy', 1925);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  book_id INTEGER
);

ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE (user_id, book_id);

ALTER TABLE books ADD COLUMN owner TEXT;
