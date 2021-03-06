# README

## Screenshot
![screenshot](https://github.com/chronicqazxc/links-saver/blob/master/public/image.png)

## Intention
I wrote this web application to collect the websites which I'm interesting.
You can visit [wayne-links-saver](https://wayne-links-saver.herokuapp.com/catalogs?utf8=✓&term=&commit=Search) to take a look.

## What's the next
1. Add access management.
2. Personalization.

## Deployment instructions
1. New an App
```shell
rails new links-saver --database=postgresql
```
2. Add ```Cartfile```
3. Add ```docker-compose.yml```
4. Build an Image
```shell
docker-compose build
```
5. Modify ```config/database.yml```
6. Generate container
```shell
docker-compose up
```
7. Run rake db create
```shell
docker-compose run web rake db:create
```
8. Run rake db migrate
```shell
docker-compose run web rake db:migrate
```
9. Shut down container
```shell
docker-compose down
```
10. Bundle install
```shell
docker-compose web bundle install
```
11. Generate container
```shell
docker-compose up --build
```

## Authors

Wayne Hsiao, chronicqazxc@gmail.com

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
