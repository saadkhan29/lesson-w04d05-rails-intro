# Introduction to Rails

![Rails Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png)

### Lesson Objectives
_After this lesson, students will be able to:_

- Initialize a Rails project
- Use a MySQL db with Rails
- Run a migration to create a table
- Run migrations to create and rename columns
- Make models and query them with ActiveRecord

<br>
<hr>


### What is Rails?
[Rails is a server-side web application framework written in Ruby](https://en.wikipedia.org/wiki/Ruby_on_Rails).


#### It features:
- Open Source - free to use, anyone can contribute
- Vast collection of open source code available within Rails community
- MVC framework (Model View Controller)
- RESTful application design
<!-- - Built-in server-side rendering with .erb (**E**mbedded **R**u**B**y) -->
- Built-in ORM (Object Relational Mapping  programming technique for converting
   data between incompatible type systems using OOP.
   - Example: converting data that is in rows/columns/tables into JSON), called Active Record, based on [Active Record Pattern](https://en.wikipedia.org/wiki/Active_record_pattern) **
- Encourages Agile web development
- Strong focus on testing, and utilizing testing for documentation


Rails is a server environment just like Node. The big difference is that Rails favors **convention** over **configuration**.

Rails can get things up and running quickly and effectively -- as long you do it _exactly the way Rails tell you to_. For example

* Rails wants you to name your models and controllers a certain way, otherwise it won't work.
* Rails requires you to run a small program called a migration in order to change any database fields.

Node, by comparison is a blank slate where all things are possible. The tradeoff, with Rails, is ease of use for large-scale applications. Whether this is a straightjacket or a wonderful gift is up to you as a developer.

<br>
<hr>


#### Rails Philosophies:
- DRY (Don't Repeat Yourself)
- Convention over configuration

We've seen a lot of similar things in our previous units. That's because Rails emergence and popularity influenced web development as a whole, and many new frameworks continue to use many of the successful patterns and features that Rails developed.

Something we haven't seen yet, is a new philosophy called `Convention over Configuration`

- Express is a minimalist framework, where you add in each piece of functionality that you need. Therefore you must also configure everything. There are some recommended patterns, but you can really build the app any way you want.

- Rails provides you with tons of functionality. However, in order to utilize this right-out-of-the-box functionality you must follow all of the Rails conventions.
  - This means proper pluralization and capitalization will make or break your app (literally)

#### Express vs. Rails in our course


| Comparison |Express| Rails |Comments |
|:----------:|:-----:|:-----:|:-------:|
|Language|JavaScript| Ruby | Still need JS on the front end|
|Database| MongoDB| MySQL |MongoDB is considered NoSQL, while MySQL is SQL|
|ODM/ORM| Mongoose| Active Record |Active Record will convert our SQL into JSON|
|Third Party Code|NPM| Gem/ bundler/ bundler install|By default Gems are installed globally by default, npm packages, by default, are local|
|server-side rendering|EJS or Handlebars| [erb](https://www.stuartellis.name/articles/erb/)|server-side rendering|
|run the server |nodemon| rails s| You'll see something called puma running in terminal|


<br>
<hr>

# Installing Rails
```ruby
gem install rails
```

<br>
<hr>
#  &#x2600; BUILD A NEW RAILS APP

To start a new rails app, you **do not** have to make a directory. 

We are going to build an app called

### `intro_app`

The command to build our rails app with postgres is the following:

```bash
rails new intro_app -d mysql
```

In English:

Hey `rails` make a `new` project called `intro_app` and set the database `-d` to `mysql`.


What's all this stuff, One more time?

* `rails new` will make a new project directory and populate it with folders and files
* The name of our app is `intro_app`. 
* With the `-d` flag we specify which type of database to use. In our case, we use `mysql`


you may need to enter your computer pwd

You can learn more about the `rails new` command by running
`rails new --help`

```
cd intro_app
code .
```

💥💥 Made a mistake typing `rails new`? Just remove the folder that was created and re-run the command. It is far faster to do that than go into the config files and update stuff💥💥

<br>

Terminal feedback will look something like this:

![](https://i.imgur.com/vliTe0q.png) Etc...

<br>
<hr>

# &#x1F449; CREATE DATABASE

`rails db:create` creates your mysql database based on the name of your Rails app.

![](https://i.imgur.com/DIlpKJY.png)

![](https://i.imgur.com/GjPRN2F.png)

We can check that the database was created by typing

```
rails dbconsole
```

This will open up our postgres CLI.

Close it again with `\q`.


<br>
<hr>

# Rails Server

Now we can run `rails s` from the command line to start our server. Go to `localhost:3000` in the browser and you should see this: 


![](https://i.imgur.com/cjBrX5j.png)

<br>

![](https://i.imgur.com/EjvruMO.png)

<br>
<hr>

## Files and Folders

`cd intro_app`

`code .`

![](https://i.imgur.com/sA1UmdB.png)

There are many files and folders that Rails makes for us. This is in stark contrast to Express that give us . . . a package.json.

|   |Express| Rails|Comments|
|:-:|:-----:|:----:|:-------:|
|project meta-data| package.json | Gemfile | Rails 5.x has a `package.json` by default as well, but that's for extra stuff, not the main meta-data file|
| Server | Express | Puma/Rack |Puma is the server, Rack deals with the middleware, these are configured and arranged pretty differently from Express, so you won't see a `server` file in the root|
|Controllers| controllers | app/controllers | part of MVC |
| Models | models | app/models | part of MVC |
|Views|we used ejs (handlebars is another common one), but we also used Angular| erb, BUT! We won't use it, when we're ready we'll jump into using React|part of MVC|

We don't need to look inside these nooks and crannies. The idea is that Rails will do a bunch of stuff for us inside of these 'black boxes'. This is in contrast to Express where we see everything, including all the middleware config.

Rails gives you all this stuff and you just have to play along with it.

Almost everything you will ever do will be in the `app` folder.

You'll do a bit in the `db` folder, in the `config` folder, and the `Gemfile`.

### For today we're focused only on two directories: `app/models` and `db`

&#x1F535; **Here's what we are going to do today:**


- Step One: make a static About Me page
- Step Two: make a database with table and columns
- Step Three: make a model and interact with it

This is all we will do. There are very specific processes for doing these things. Once these foundations are built, we can begin to free ourselves up a bit.

<br>
<hr>

# &#x26A0; STEP ONE
## Create a static About Me page

For starters, let's create a static about me page for you to put links to your GitHub, portfolio, contact info, etc. It's gonna look like this:

<br>

![](https://i.imgur.com/ksjrSBa.png)

We're gonna use some basic error driven development to let Rails guide us in developing our **About Me** page. Pay close attention to the order. The steps are to create a:
    
- route
- controller
- method
- view

#### Create an `/about` Route

1. Navigate to `http://localhost:3000/about` and you should see this:

    ![](https://i.imgur.com/9ikX0Dz.png)
    
    Rails is looking for an **/about** route. Let's build one.

    <br>

1. In the `config/routes.rb` file, let's create a root route (which we'll change later) and a basic route for **/about**:

```ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about", to: "application#about"
end
```

<br>

#### Create a `def about` method

Refresh your browser and you should see the following error:

![](https://i.imgur.com/blP5HED.png)

The **/about** route is looking for an **about** method in our **ApplicationController** so let's build one.

<br>

![](http://i.imgur.com/2BtC2Zx.gif)
<details>
<summary>**CFU** How are routes constructed? For example:<br>
`get "about", to: "application#about"`
</summary>
HTTP verb + Controller + method
</details>

<br>

Let's add an `about` method to our `app/controllers/application_controller.rb`. While we're here, create an instance variable containing your name.

```ruby
class ApplicationController < ActionController::Base
  def about
    @name = "Marc"
  end  
end
```


<br>

#### Create an About View

Refresh your page and you should see a "missing template" error.

![](https://i.imgur.com/QSbzmUN.png)

<br>

In `app/views` create an `application` folder and create an `about.html.erb` file. Add the following: 

```html
<h1><%= @name %>'s About Page</h1>
```

<br>

![](http://i.imgur.com/2BtC2Zx.gif)

- How does Rails know where to find a view for a specific controller and method?
- What are these tags called- `<%= %>` and `<% %>`? What's the difference between? 

<br>

#### Add a `root` route

We can assign a specific controller/view to the root route `localhost:3000` like so:

```ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#about"
  get "about", to: "application#about"
end
```

<br>

![](http://i.imgur.com/2BtC2Zx.gif)

- You should be able to see this view at both `http://localhost:3000/about` and `http://localhost:3000/`. Why?




<br>
<hr>



# &#x1F449; CREATE A TODO MODEL

A `Model` is the `M` in `MVC`. It represents the data layer of our Rails app. Rails has a handy command line tools that will build a model file and a migration file for us (more on migrations in a second). Run this from the command line:

```ruby
rails g model todo title:string completed:boolean
```
![](https://i.imgur.com/CbkwS1M.png)

- This command creates a migration file and a model file for us.
- Models are always singular. We're telling Rails what an individual `todo` looks like. Rails will look for a `todos` table in the database.
- We can pass in the columns and datatypes as arguments.
- **MAKE SURE** you do not put spaces between the colons!
- If you do not specify the datatype, Rails will assume you want a string. `rails g model todo title completed:boolean` would also work.

<br>
<hr>
 

# &#x1F449; MIGRATIONS

We create our database tables and give them columns through **Migrations**. In SQL this is a **table** that has **columns**. We are going to make a ToDo app with very simple data.


&#x1F535; Open the `db` folder. Check out the `migrate` folder. For the most part we will not interact with it directly, but rather will do so by generating and running **migrations**.

> Migrations are a convenient way for you to alter your database in a structured and organized manner.

> Migrations, using Ruby, are database-language independent.


* The migration generated a `migrate` folder in the `db` folder.
* Inside it is the migration file we created.
* The migration file we just made will allow us to create a table with the columns we want.

The numbers are just a timestamp. All migration files are kept here in sequence so that we have a permanent record of all alterations to our database.

[Why do we use migrations?](http://guides.rubyonrails.org/v3.2.8/migrations.html)


Our file should look like this. The column names are `symbols`

![](https://i.imgur.com/CJQr6At.png)

<br><hr>

# &#x1F449;  Run the migration

We have created the migration, and we have told it what we want it to do. All that's left is to execute it.

When we run the migration it will create/alter our database.

Run the migration with `rails db:migrate`. This command will run every file in the migrate folder in order.

![](https://i.imgur.com/pWz6AGY.png)


### schema.rb

Running the migration screated a `schema.rb` file. This is the schema for all your data.

![](https://i.imgur.com/KbhxUby.png)

#### DO NOT TOUCH THE SCHEMA.RB

*Not to be touched*. *DO NOT MODIFY IT*

Same goes for your migrations. Once you've run a migration *DO NOT TOUCH IT*

<br>

### Check the database itself:

```sql
$ rails dbconsole
```

Opens up a psql shell

See the columns created for the todos table:

```sql
SELECT * FROM todos;
```

![](https://i.imgur.com/qT7EuOf.png)

Quit with `\q`.

Now that our database has been constructed with tables and columns for the tables, let's get some data in there.

### &#x2714; Step 1 complete: making a database with a table and columns

<br>
<hr>


# &#x1F449; ACTIVE RECORD

Active Record, as an ORM Framework, gives us several mechanisms, the most important being the ability to:

- represent models and their data
- represent associations between these models
- represent inheritance hierarchies through related models
- validate models before they get persisted to the database
- perform database operations in an object-oriented fashion
- Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic.

With ActiveRecord, we do not have to write raw SQL queries, and can instead write Ruby to query the database.

We can open up a console and just write ActiveRecord queries directly.

## Rails console

Open Rails console

```
rails console
```

OR

```
rails c
```

![](https://i.imgur.com/4uRBFpl.png)

* We can see that our `Todo` model exists and that we can perform ActiveRecord queries on it, and we can see the SQL statement used to query the database:

```ruby
Todo.all
```

![](https://i.imgur.com/s6MbslU.png)

There are no Todos yet, but the query works!

```ruby
Todo.count
```

![](https://i.imgur.com/Lp6mWi5.png)

Zero todos.

### Create and Save new Todos

- `.new` (creates a new ActiveRecord object template, but doesn't save it to the DB)
- `.save` (saves a new ActiveRecord object template to the database)
- `.create` (calls `.new` + `.save`)


```ruby
todo = Todo.new(title: "First todo", completed: true)
todo.save
```

```ruby
Todo.create(title: "Something", completed: false)
```

![](https://i.imgur.com/lZOqs5V.png)


### Query Todos

- `.find` (finds by id)

```ruby
Todo.find(1)
```

![](https://i.imgur.com/MjTMsad.png)

- `.where` (takes a key value pairs as arguments to search by)

```ruby
Todo.where(title: "Something", completed: false)
```

![](https://i.imgur.com/QkiKLyK.png)


### Update Todos

- `.update` (takes key value pairs as arguments, with the fields to update)

```ruby
todo = Todo.find(1)
todo.update(completed: true)
```

![](https://i.imgur.com/B7A9nlZ.png)

Or chain the commands together:

```ruby
Todo.find(1).update(completed: false)
```

### Delete Todos

- `.destroy` can either be called on an ActiveRecord object or takes the id of an ActiveRecord object

```ruby
Todo.destroy(1)
```

![](https://i.imgur.com/E83FDGb.png)

OR

```ruby
Todo.find(1).destroy
```

We will be using these Active Record queries within Rails.


&#x1F535; **Activity (9 mins)**

Using rails console `rails c`:

1. Create a new Todo
2. Query Todo to see how many there are in the db
3. Create another Todo
4. Update the second Todo
5. Query Todo to see all of them
5. Delete the first Todo

Type `exit` to leave Rails Console


### &#x2714; Step Two complete: making a model and interacting with it

<br>
<hr>



## Aside
Rails has conventions on how to pluralize and singularize words.

If you would like to check the singular or plural of a word, you can do it by running `rails c` (to quit, type `quit`

![rails c pluralize, singularize ](https://i.imgur.com/RiV71w5.png)

<br>
<hr>

# REVIEW

1. New Rails project ✔
2. Create the database ✔
3. Create a migration to make a table ✔
4. Insert column fields to the migration file ✔
5. Run the migration -- table and schema made ✔
6. Create a model ✔
7. Test the model with ActiveRecord ✔



<br>
<hr>
