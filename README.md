# README

* Ruby version
    ruby 3.2.2 (2023-03-30 revision e51014f9c0)
* System dependencies
    SQLLite DB (included with Ruby/Rails Installation)
    Rails 7.1.2


I added a CSV file that will allow someone trying to set up this project on their PC to auto-populate a db with my movies table.
I also added to the seeds.rb file some code that will allow you to run rails db:seed to auto-populate the sql-lite db with fake users (100) and fake reviews (1000).
You'll need to create the movies first though, as the reviews need to be associated with existing movies.
