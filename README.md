# EmailTemplate

Allows your users to edit e-mail templates.
With Devise and Active Admin support (but you don't need them to start using email_template).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_template'
```

And then execute:

```sh
$ bundle
```

Or just:

```sh
$ gem install email_template
```

## Usage

Run installer:

```sh
$ rails g email_template:install
```
    
In order to use Devise templates you need to install devise wrapper:
    
```sh
$ rails g email_template:devise_install
```
        
Then generate common devise templates for a specified scope: 
   
```sh
$ rails g email_template:devise_templates <devise_scope>
```
    
This generator produces email templates with the names:

```ruby
<devise_scope>_mailer:confirmation_instructions
<devise_scope>_mailer:reset_password_instructions
<devise_scope>_mailer:unlock_instructions
```

Run:

```sh
$ rake db:migrate
```

You can configure email_template at

    config/initializers/email_template.rb

Pull template to the base :

```ruby
MailTemplate.create(name: "template unique name",
                    subject: "Join request confirmation",
                    classes: ["activity_partner"],
                    body:
                        <<-TEXT
                          Dear \#{activity_partner.full_name} ...
                          ....
                        TEXT
)
```

In Mailer:

```ruby
class ActivityPartnerMailer < TemplateSendMailer
  def join_confirmation_self(activity_partner)
    #send_mail(template_name, mail_params = {}, template_params = {})
    send_mail("template unique name", {to: "user@example.com"}, {activity_partner_: activity_partner})
  end
end
```

## Configuration
    If you need adding some model method to token list need create in model alias with prefix,
    which you set in config(by default is 'et_').
    
    For example if you need add method 'full_name' for 'activity_partner' to token list you need do next:

```ruby
class ActivityPartner < ActiveRecord::Base
    def full_name
        [self.first_name, self.last_name].join(' ')
    end

    alias et_full_name full_name
end
```
    

## Customization

In case you need additional customization :

In Mailer:
    Simply add 'template_path' and 'template_name'

```ruby   
class MyMailer < TemplateSendMailer

  def result(tree)
    send_mail('MyMailer:result', 
    {
        to: my_email,
        template_path: 'mailers',
        template_name: 'mail'
    }, {tree: tree})
  end
end
```

In View:
    In view you will have compiled template in @data variable

```ruby
= @data.html_safe
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
