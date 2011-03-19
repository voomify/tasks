module RunPSQL
  def db_file_path(filename)
    "#{Rails.root}/db/#{filename}"
  end
  def run_psql_file(config, filename)
    file_with_path = db_file_path(filename)
    puts "Executing sql file: #{file_with_path}"
    run_pg_command(config, "psql -f #{file_with_path}")
  end

  def run_pg_command(config, command, output_file=nil)
    database = config["database"]
    username = config["username"]
    host = config["host"]
    port = config["port"]
    password = config["password"]
    pipe_to_file = output_file ? "> #{output_file}" : ""
    `export PGPASSWORD="#{password}";#{command} -U #{username} -h #{host} #{port ? '-p '+-port : ''} #{database} #{pipe_to_file};export PGPASSWORD=""`
  end
end