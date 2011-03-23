# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{voomify_tasks}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Russell Edens"]
  s.date = %q{2011-03-23}
  s.description = %q{This gem contains common tasks for the voomify rails projects}
  s.email = %q{russell@voomify.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "lib/replace_rake_tasks.rb",
    "lib/run_psql.rb",
    "lib/tasks/dependent_projects.rake",
    "lib/tasks/enviornments.rake",
    "lib/tasks/sql_schema_seeds_databases.rake",
    "lib/voomify_tasks.rb",
    "lib/voomify_tasks/railtie.rb"
  ]
  s.homepage = %q{http://www.github.com/voomify/voomify/gems/tasks}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Common Voomify tasks.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

