# README

## Questions:
* which fields do a user need -[name]
* should a project have a name? -yes
* which statuses do a project need? -[created, in_progress, accepted, rejected]
* do we need user login? -yes
* how to implement user login? -simple loing, user enters they name
* where all the comments will be displayed? -on the project show page
* should changing of the status be a new comment? -yes

## Installation:
* go to projects folder
* `bundle install`
* run `rake db:create; rake db:migrate; rake db:seed`
* run `rails server`
* go to `http://localhost:3000/`
* pick any user name to login
* click any project from the list
* on the project details page you can add a new comment or update projects status

