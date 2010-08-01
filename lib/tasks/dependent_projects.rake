def call_dependent_project_tasks(projects, commands, calls_task=nil)
  commands.each do |tasks|
    call_recursive_dependent_project_tasks(projects, tasks.split(':'), calls_task)
  end
end


def noop_project_tasks(commands)
  commands.each do |tasks|
    noop_recursive_project_tasks(tasks.split(':'))
  end
end

def sub_directories
  FileList.new('./**') do |f|
    f.to_a.each do |item|
      f.exclude(item) unless (File.directory?(item) || item == '.' || item == '..')
    end
  end
end

private

def call_recursive_dependent_project_tasks(projects, commands, calls_task, index=0)
  if(index<commands.size-1)
    namespace commands[index].to_sym do
      call_recursive_dependent_project_tasks(projects, commands, calls_task, index+1)
    end
  else
    task commands[index].to_sym do
        errors = []
        projects.each do |project|
          system(%(cd #{project} && #{$0} #{calls_task!=nil && calls_task || commands.join(':')})) || errors << project
        end
        fail("Errors in #{errors.join(', ')}") unless errors.empty?
      end
  end
end

def noop_recursive_project_tasks(commands, index=0)
  if(index<commands.size-1)
    namespace commands[index].to_sym do
      noop_recursive_project_tasks(commands, index+1)
    end
  else
    task commands[index].to_sym do
          # This is a no-op
    end
  end
end
