TASKS_ROOT = File.expand_path(File.dirname(__FILE__))
require "#{TASKS_ROOT}/../replace_rake_tasks"
require "#{TASKS_ROOT}/../run_psql"
require 'fileutils'
# we override these tasks to use ddl file instead of ruby

namespace :db do
  namespace :schema do
    override_task :load => :environment do
      run_psql_file(current_env, "schema.sql")
    end                                                                                     

    override_task :dump => :environment do
      output_file = db_file_path("schema.sql")
      FileUtils.mv(output_file, "#{output_file}.last") if FileTest.exists?(output_file)
      run_pg_command(current_env, "pg_dump hal -c -o -O -x -s", output_file)
      puts "Schema has been updated from the database. Last schema backed up to #{output_file}.last"
    end
  end

  override_task :seed => :environment do
    run_psql_file(current_env, "seed.sql")
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

  def current_env
    ActiveRecord::Base.configurations[Rails.env]
  end

end
