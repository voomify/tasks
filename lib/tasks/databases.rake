require 'replace_rake_tasks'

# we override these tasks to use ddl file instead of ruby

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
  
  def run_psql_file(config, filename)
    file_with_path = "#{Rails.root}/db/sql/#{filename}"
    puts "Executing sql file: #{file_with_path}"
    database = config["database"]
    username = config["username"]
    `psql -f #{file_with_path} #{database} -U #{username}`
  end


end
