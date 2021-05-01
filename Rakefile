require "bundler"
Bundler::GemHelper.install_tasks

require "standard/rake"

require "rake/testtask"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task default: [:test, :standard, :yard]

begin
  require "yard"
  YARD::Rake::YardocTask.new
rescue LoadError
  # ignore
end
