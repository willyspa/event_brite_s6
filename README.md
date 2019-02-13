![](https://media0.giphy.com/media/2zeji2UedvZzvIZ45N/giphy.gif?cid=3640f6095c4a8a4d6b6958366767066f)

# Event PROJECT

~~ Cynthia @Yacinth ~~ William @Willyspa ~~ aliya @a1iya

## Ruby version

```ruby
ruby 2.5.1
```

# Got to Heroku website

 https://eventbritethp.herokuapp.com

# Or do like always with this steps :

## Git Clone

- Aquerir le repository en local avec clef SSH

```ruby
$ git clone git@github.com:Yacinth/EventProject.git
```

## Bundle Install

- Executer un bundle install pour pouvoir utiliser les gems du Gemfile

```ruby
$ bundle install
```

## create Database

```ruby
$ rails db:create
```

## Migration

- Verifier le statut des migrations dans le terminal

```ruby
$ rails db:migrate:statuts
```

- Si des migrations sont down, effectuer :

```ruby
$ rails db:migrate
```

## Database

- Generer la database à partir de ../migrate/seed.rb :

```ruby
$ rails db:seed
```

## Console Rails

- Pour lancer la console rails et tester la création de row:

```ruby
$ rails console
```

- Pour créer un user et lancer l'email welcome :

```ruby
$ User.create(first_name:"First_name", last_name: "Last_name", description: "Voici ma description", encrypted_password: "password",  email:"alt.yo-2ofbtykj@yopmail.com")
```

Go sur ta fausse boite mail : http://www.yopmail.com/?login=nimportekoi

### A tout de suite les correcteurs <3
