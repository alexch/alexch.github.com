here = File.expand_path(File.dirname(__FILE__))

task :default => [:test, :run]

build_command = "erector --to-html ./index.rb ./bookmarklets/index.rb"

task :build do
  sh build_command
end

task :run do
  sh "rerun --pattern '**/*.rb' -cx -- " + build_command
end

task :test do
  Dir.glob("#{here}/test/*_test.rb").each do |t|
    require t
  end
end
