require 'voomify_tasks'
require 'rails'
module Voomify
  module Tasks
    class Railtie < Rails::Railtie      
      rake_tasks do
        load "tasks/enviornments.rake"
      end
    end
  end
end
