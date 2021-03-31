require 'bundler'
Bundler::GemHelper.install_tasks

require "rake/testtask"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test

namespace :doc do
  begin
    require 'yard'
  rescue LoadError
    # ignore
  else
    YARD::Rake::YardocTask.new do |task|
      task.files   = ['HISTORY.mkd', 'LICENSE.mkd', 'lib/**/*.rb']
      task.options = [
        '--protected',
        '--output-dir', 'doc/yard',
        '--tag', 'format:Supported formats',
        '--tag', 'authenticated:Requires Authentication',
        '--tag', 'rate_limited:Rate Limited',
        '--markup', 'markdown',
      ]
    end
  end
end
