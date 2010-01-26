
require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'selenium/rake/tasks' 

 
$LOAD_PATH.unshift("lib")

require 'selenium-extjs'

desc 'Test Selenium-ExtJS.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

 desc 'Console.'
 task :shell do |t|
   exec 'irb -r ./lib/selenium-extjs.rb'
 end

Selenium::Rake::RemoteControlStartTask.new do |rc|
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
  rc.background = true
  rc.wait_until_up_and_running = true
  rc.jar_file = "server/selenium-server.jar"
  rc.additional_args << "-singleWindow -browserSessionReuse"
end

Selenium::Rake::RemoteControlStopTask.new do |rc|
  rc.host = "localhost"
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
end


spec = Gem::Specification.new do |s|
  s.name = "selenium-extjs"
  s.version = SeleniumExtJs::VERSION
  s.email = "raios.catodicos@gmail.com"
  s.version = "0.0.1"
  s.author = "Ronald Andreu Kaiser"
  s.email = "raios.catodicos@gmail.com"
  s.homepage = "http://github.com/cathoderay/selenium-extjs"
  s.platform = Gem::Platform::RUBY
  s.summary = "A framework in ruby to test your extjs applications with selenium "
  s.files = FileList["{lib}/**/*"].to_a
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.rdoc"]  
  s.require_paths = ["lib"]
end

 
Rake::GemPackageTask.new spec do |pkg|
  # pkg.need_tar = true
  # pkg.need_zip = true
end
 
desc "Generate a gemspec file for GitHub"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end
