# link-shortener

A website similar to tinyurl, where you can create a custom short url that redirects to another URL.

Made with Ruby on Rails.

Users can create, view, edit, and delete shortened links. 
Only a link's creator can edit or delete it.

Auth is implemented with just `bcrypt` (no auth framework)

## Dependencies

* ruby 3.3.5
* sqlite3 3.43.2
* rails 7.2.1.1

## Setup

```shell
bundle install
bin/rails db:migrate
```

## Run Locally

```shell
bin/rails server
```