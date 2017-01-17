# IDEA BOX

[Production Site](https://dashboard.heroku.com/apps/idea-box-kh)

Web application to record and track ideas. Ideas can have category tags and images associated with them. This is an individual Turing school project intended to focus on authentication and authorization. The site requires a user to login and has an admin responsible for managing category tags and images.

Tech Stack: Rails, PostgreSQL, RSpec, Bootstrap, ERB, Heroku, Capybara, bcrypt

Follow these steps to run tests or host the site locally.

1. To get started make sure you have postgres, Ruby, and rails 5  (`gem install rails`) installed on your machine.
1. Clone the repository: `git clone https://github.com/kheppenstall/idea_box.git`
1. `cd` into the directory `idea_box` and `bundle install` in the command line.
1. Run `rake db:create` and `rake db:migrate` in the command line to get your schema up to date.
1. Run `rake db:test:prepare` in the command line.
1. Run `rspec` in the command line to run the tests.
1. Run `rails s` in the command line to host the site locally and visit http://localhost:3000/ to check it out!
