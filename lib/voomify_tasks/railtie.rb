require 'voomify_tasks'
require 'rails'
module Voomify
  module Tasks
    class Railtie < Rails::Railtie      
      rake_tasks do
        load "tasks/enviornments.rake"
        load "tasks/databases.rake"
      end
    end
  end
end
