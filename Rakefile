here = File.expand_path(File.dirname(__FILE__))

task :default => [
  # :test,
  :run]

build_command = "erector --to-html ./index.rb ./alexisms.rb ./bookmarklets/index.rb"

desc "build"
task :build do
  sh build_command
end

desc "run"
task :run do
  sh "rerun --pattern '**/*.rb' -cx -- " + build_command
end

desc "test"
task :test do
  Dir.glob("#{here}/test/*_test.rb").each do |t|
    require t
  end
end
