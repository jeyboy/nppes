**Nppes** provides methods for building and refreshing the National Plan and Provider Enumeration System database.
Gem background operations are based on delayed_job_active_record(https://github.com/collectiveidea/delayed_job_active_record) gem.

## Installation

Add it to your Gemfile:

```ruby
gem 'nppes'
```

Run the following command to install it:

```console
bundle install
```

Run the generator:

```console
rails generate nppes:install
```

Run the migrations:

```console
rake db:migrate
```

## Using
Run the following for initialization of DB:
```console
rake nppes:init_base
```

This command runs cycle check for updates in the background:
```console
rake nppes:auto_update
```
This command checks for update once:
```console
  rake nppes:update
```

## Service commands
Run delayed job (Always run automatically):
```console
rake nppes:start_background_env
```

Stop delayed job:
```console
rake nppes:stop_background_env
```

## License

MIT License. Copyright 2011-2013.
