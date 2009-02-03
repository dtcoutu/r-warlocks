$:.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib')
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty -r lib/tasks/structured_html_formatter.rb --format StructuredHtmlFormatter"
  #  --format html --out cucumber_results.html
end
task :features => 'db:test:prepare'