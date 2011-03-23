module RunPSQL
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
    variables = "-v PGPASSWORD=\"#{password}\" -v ON_ERROR_STOP=1"
    puts "Executing: #{command} -U #{username} #{host ? '-h '+host : ''} #{port ? '-p '+port.to_s : ''} #{database} #{pipe_to_file}"
    `#{command} #{variables} -U #{username} #{host ? '-h '+host : ''} #{port ? '-p '+port.to_s : ''} #{database} #{pipe_to_file}`
    puts "exit status: #{$?.exitstatus}"
    if $?.exitstatus != 0
      raise "pg command failed"
    end
  end
end