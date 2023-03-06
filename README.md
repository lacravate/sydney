# Pennylane Tech test

## The pitch (as in Pennylane's quentindemetz's github page)

It's dinner time ! Create an application that helps users find the most relevant recipes that they can prepare with the ingredients that they have at home

## Solution

`sydney`, a one-table, one-model, one-service, one-controller, service and model Rspec tested, vanilla Ruby 3 Rails 7 app.

[http://pennylane.lacravate.fr/](http://pennylane.lacravate.fr/)

## Install

Database is amongst the ones suggested : MySQL, for which you need a prior install.
Then the usual :
```
rails db:create
rails db:migrate
rails db:seed
```

For Rails, The usual will do :
```
gem install rails -v"~>7"
rails new sydney -d mysql
```

No extra gems are installed.

## Database structure

One table : `recipes`.

Here's what mysql console can tell about it :
```
+------------------------+--------------+------+-----+---------+----------------+
| Field                  | Type         | Null | Key | Default | Extra          |
+------------------------+--------------+------+-----+---------+----------------+
| id                     | bigint       | NO   | PRI | NULL    | auto_increment |
| author                 | varchar(255) | YES  |     | NULL    |                |
| rate                   | int          | YES  |     | NULL    |                |
| difficulty             | varchar(255) | YES  |     | NULL    |                |
| budget                 | varchar(255) | YES  |     | NULL    |                |
| prep_time              | varchar(255) | YES  |     | NULL    |                |
| total_time             | varchar(255) | YES  |     | NULL    |                |
| people_quantity        | int          | YES  |     | NULL    |                |
| searchable_ingredients | text         | YES  |     | NULL    |                |
| name                   | varchar(255) | YES  |     | NULL    |                |
| cook_time              | varchar(255) | YES  |     | NULL    |                |
| created_at             | datetime(6)  | NO   |     | NULL    |                |
| updated_at             | datetime(6)  | NO   |     | NULL    |                |
+------------------------+--------------+------+-----+---------+----------------+

```

## User stories

### Welcome screen
Given a non-registered 
When user access the app
Then he lands on a welcome page, with an empty form, and no recipes list

### Successful Search
Given a non-registered already landed on the welcome screen
When the user types in the ingredients as indicated in the designated form and
  When the submitted ingredients can be found in recipes in the database
Then he gets a list of recipes topped at 25 results in the list

### Successful Search with more than 25 results
Given a non-registered already landed on the welcome screen
When the user types in the ingredients as indicated in the designated form and
  When the submitted ingredients can be found in recipes in the database and
  When the submitted ingredients call for more than 25 results in the list
Then he gets a list of recipes topped at 25 results in the list
  and a message explaining the list was pruned and call for more ingredients

### Unsuccessful Search
Given a non-registered already landed on the welcome screen
When the user types in the ingredients as indicated in the designated form and
  When the submitted ingredients can't be found in recipes in the database
Then he gets a message explaining no matching recipes could be found

### Recipe show
Given a non-registered who already landed submitted a form resulting in a list of recipes
When the user selects a recipe and clicks on the link
Then he lands on a page with a practical and understandable display of the recipe

