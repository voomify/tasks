require 'replace_rake_tasks'
require 'run_psql'
# we override thes``````````````````````````e tasks to use ddl file instead of ruby

namespace :db do
  namespace :schema do
    override_task :load => :environment do
      run_psql_file(ActiveRecord::Base.configurations[Rails.env], "schema.sql")
    end                                                                                     

    override_task :dump => :environment do
      puts 'This is a NOOP. The schema is defined in /db/sql/schema.sql.'
    end
  end

  override_task :seed => :environment do
    run_psql_file(ActiveRecord::Base.configurations[Rails.env], "seed.sql")
  end

  namespace :test do

    override_task :purge do
    end

    override_task :load => :environment do
      run_psql_file(ActiveRecord::Base.configurations["test"], "schema.sql")
    end
  end

private

  include RunPSQL

end
