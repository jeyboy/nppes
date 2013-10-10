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
        [
            'add_nppes_table',
            'add_update_check_table',
            'add_license_table',
            'add_provider_address_table'
        ].each do |name|
          unless migration_exists?(name)
            migration_template(
                "active_record/#{name}.rb",
                migrate_path("#{name}.rb")
            )
            sleep(1)
          end
        end

        template 'templates/nppes.rb', 'config/initializers/nppes_settings.rb'
        generate 'delayed_job:active_record'
        template 'templates/delayed_jobs.rb', 'config/initializers/delayed_jobs.rb'
      end

      protected

      def migration_exists?(name)
        Dir.glob("#{migrate_path}/[0-9]*_*.rb").grep(/\d+_#{name}.rb$/).first
      end

      def migrate_path(name='')
        File.join('db', 'migrate', name)
      end
    end
  end
end
