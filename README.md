# README

Uses `devise` and `bootstrap`. **Need to add versions here**

To set up:
* after cloning, navigate to directory in the terminal and run the following commands:

* `bundle install`

* `postgres`

* The above command runs the postgres server (?) from that terminal window so you will need to open a new tab in your terminal window. Then run:

* `rake db:setup`

* `rails s`

* type 'localhost:3000' in the URL

### Known Bugs
* When you click to generate a PDF the page does not render due to an environment conflict (help?). However, if you go to the navigation bar and delete `.pdf` from the URL, you will see clearly the actual invoice.

### Fixed Bugs
