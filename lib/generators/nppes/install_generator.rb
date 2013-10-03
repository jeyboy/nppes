module Nppes
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include ::Rails::Generators::Migration

      def self.next_migration_number(dirname)
        Time.now.strftime('%Y%m%d%H%M%S')
      end

      source_root File.expand_path('../../', __FILE__)

      desc 'Creates initializer and migration.'
      def copy_initializer
        migration_template(
            'active_record/base_npi_data.rb',
            migrate_path('add_nppes_table.rb')
        )
        sleep(1)
        migration_template(
            'active_record/update_check.rb',
            migrate_path('add_update_check_table.rb')
        )

        #sleep(1)
        #migration_template(
        #    'active_record/license.rb',
        #    migrate_path('add_license_table.rb')
        #)

        template 'templates/nppes.rb', 'config/initializers/nppes_settings.rb'
        generate 'delayed_job:active_record'
        template 'templates/delayed_jobs.rb', 'config/initializers/delayed_jobs.rb'
      end

      protected

      def migrate_path(name='')
        File.join('db', 'migrate', name)
      end
    end
  end
end
