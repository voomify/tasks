module RunPSQL

  def current_env
    ActiveRecord::Base.configurations[Rails.env]
   end

  def db_file_path(filename)
    "#{Rails.root}/db/#{filename}"
  end
  def run_psql_file(config, filename)
    file_with_path = db_file_path(filename)
    run_pg_command(config, "psql -f #{file_with_path}")
  end

  def run_pg_command(config, command, output_file=nil)
    database = config["database"]
    username = config["username"]
    host = config["host"]
    port = config["port"]
    password = config["password"]
    pipe_to_file = output_file ? "> #{output_file}" : ""
    variables = "-v ON_ERROR_STOP=1"
    puts "Executing: #{command} -U #{username} #{host ? '-h '+host : ''} #{port ? '-p '+port.to_s : ''} #{database} #{pipe_to_file}"
    `export PGPASSWORD="#{password}"`
    `#{command} #{variables} -U #{username} #{host ? '-h '+host : ''} #{port ? '-p '+port.to_s : ''} #{database} #{pipe_to_file}`
    exit_status = $?.exitstatus
    `export PGPASSWORD=""`
    puts "exit status: #{exit_status}"
    if exit_status != 0
      raise "pg command failed"
    end
  end
end