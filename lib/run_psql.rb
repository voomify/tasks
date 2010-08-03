module RunPSQL
  def run_psql_file(config, filename)
    file_with_path = "#{Rails.root}/db/sql/#{filename}"
    puts "Executing sql file: #{file_with_path}"
    database = config["database"]
    username = config["username"]
    host = config["host"]
    port = config["port"]
    `psql -f #{file_with_path} -U #{username} -h #{host} -p #{port} #{database} `
  end
end