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

##Requests

Request to base by NPI:

```ruby
@npi = Nppes::NpIdentifier.where(npi: 'NPI as integer').first
```
Have next fields: npi, owner_id, owner_type, npi_deactivation_reason_code, npi_deactivation_date, npi_reactivation_date,
 first_name, middle_name, last_name, prefix, suffix, gender_code, entity_type_code
Have next helpers:
Gender name helper:
```ruby
@npi.decoded_gender
```

Entity type name helper:
```ruby
@npi.decoded_entity_type
```

Deactivation reason helper:
```ruby
@npi.decoded_deactivation_reason
```

Result of request has next relations:

** Addresses

```ruby
@npi.np_addresses
```
Have next fields: address1, address2, city, state, country, zip, phone
Have next helpers:
Country name helper:
```ruby
@npi.np_licenses.first.decoded_country
```
State name helper:
```ruby
@npi.np_licenses.first.decoded_state
```

** Licenses
```ruby
@npi.np_licenses
```

Have next fields: taxonomy_code, license_number, state
Have next helpers:
Speciality title by taxonomy code:
```ruby
@npi.np_licenses.first.decoded_speciality
```
State name:
```ruby
@npi.np_licenses.first.decoded_state
```

## License

MIT License. Copyright 2011-2013.
