module Nppes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include ::Rails::Generators::Migration
      #def self.next_migration_number(dirname)
      #  Time.now.strftime('%Y%m%d%H%M%S')
      #end

      desc 'Creates initializer and migration.'
      def copy_initializer
        migration_template(
            '../active_record/migration.rb',
            File.join('db', 'migrate', 'add_nppes_table.rb')
        )
        #
        #unless migration_exists?('add_mails_template')
        #  STDOUT << 'migration'
        #  template 'active_record/migration.rb', "db/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S').to_i}_add_mails_template.rb"
        #end
        #
        #STDOUT << 'config'
        template 'templates/email_templates.rb', 'config/initializers/email_template.rb'
        #
        #if Gem::Specification::find_all_by_name('activeadmin').any?
        #  STDOUT << 'admin'
        #  template 'templates/active_admin/emails.rb', 'app/admin/email_templates.rb'
        #end
        #
        #if Gem::Specification::find_all_by_name('devise').any?
        #  STDOUT << 'devise mailer'
        #  template 'templates/devise/custom_devise_mailer.rb', 'app/mailers/custom_devise_mailer.rb'
        #end
      end
    end
  end
end
