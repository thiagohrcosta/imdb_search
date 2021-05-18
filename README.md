

# IMDB Search

![main banner](https://res.cloudinary.com/dloadb2bx/image/upload/v1620151377/imdb1_ekazm3.png)


## Technologies
This project was created with:

 - [Ruby](https://www.ruby-lang.org/pt/)
 - [Rails](https://rubygems.org/gems/rails)
 - [ERB](https://ruby-doc.org/stdlib-2.7.1/libdoc/erb/rdoc/ERB.html) (for template system with Ruby)
 - [Pry-byebug](https://rubygems.org/gems/pry-byebug/versions/3.4.0?locale=pt-BR) (for debugging)
 - [Bootstrap](https://getbootstrap.com/)
 - [Pg_Search](https://rubygems.org/gems/pg_search/versions/1.0.5?locale=pt-BR)
 - [Postgresql](https://www.postgresql.org/)

## Typing parcial words
![map](https://res.cloudinary.com/dloadb2bx/image/upload/v1620151467/imdb2_nle0at.png)

     def index
        if params[:query]
          @movies = Movie.search_by_title_and_synopsis(params[:query])
        else
          @movies = Movie.all
        end
      end


 Adding the code above and below, users can find movies by typing only parcials words of a title.

    class Movie < ApplicationRecord
      belongs_to :director

      include PgSearch
      pg_search_scope :search_by_title_and_synopsis,
        against: [:title, :synopsis],
        using: {
          tsearch: { prefix: true }
        }

      pg_search_scope :global_search,
        against: [ :title, :synopsis ],
        associated_against: {
          director: [ :first_name, :last_name ]
        },
        using: {
          tsearch: { prefix: true }
        }

      multisearchable against: [ :title, :synopsis ]

    end

![gif](https://res.cloudinary.com/dloadb2bx/image/upload/v1621362443/imdb4_fnq7jz.gif)

## CSS Grid

To display flats on index page was used CSS grid:
![CSS Grid](https://res.cloudinary.com/dloadb2bx/image/upload/v1620151468/imdb3_jw6pxr.png)
   ```
.box-flex{
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 16px;
  margin: 10px;
}

.box-flat{
  margin: 10px 0;
  background-color:  #7868e6;
  border: 1px solid #E8E8E8;
  box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
}
```

## How to run this project
Download or clone it. . Then run in the main folder the command `rails server`. If needed, run `bundle install` to check if all gems are correctly installed. Then open the project on `localhost:3000/movies`


## What user can do?
As user you can manipulate all **CRUD** operations like:

 - Insert a movie on database;
 - Search for a movie by title;

## Development routine

 **April 4**

     - Project created;
     - Adding bootstrap, jquery, popper;
     - Adding font-awesome, simple_form;
     - Models and Controllers created;
     - Database created;
     - Seeds some content on database;
     - Adding routes;
     - Adding Pg_Search gem;
     - Adding a migration to insert poster on movies;
     - Adding CSS to main page.

