def create_user(first_name, last_name, email)
    run_sql("INSERT INTO users(first_name, last_name, email) VALUES($1, $2, $3)", [first_name, last_name, email])  
end    