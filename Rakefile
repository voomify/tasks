namespace :gem do
  begin
    require 'jeweler'
    gem_name = 'voomify_tasks'
    
    Jeweler::Tasks.new do |gem|
      gem.name = gem_name
      gem.summary = 'Common Voomify tasks.'
      gem.files = Dir['{lib}/**/*', '{tasks}/**/*']
      gem.author = 'Russell Edens'
      gem.email =  'russell@voomify.com'
      gem.description = 'This gem contains common tasks for the voomify rails projects'
      gem.homepage = 'http://www.github.com/voomify/voomify/gems/tasks'      
      # other fields that would normally go in your gemspec also be included here
    end
    Jeweler::GemcutterTasks.new
  rescue
    puts 'Jeweler or one of its dependencies is not installed.'
  end

   task :uninstall do
    sh "gem uninstall #{gem_name}"
   end

  task :reinstall =>[:uninstall,:install]

end

task :spec