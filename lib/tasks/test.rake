namespace :test do
  Rails::SubTestTask.new(:lib => "test:prepare") do |t|
    t.libs << "test"
    t.pattern = 'test/lib/**/*_test.rb'
  end

end

lib_task = Rake::Task["test:lib"]
test_task = Rake::Task[:test]
test_task.enhance { lib_task.invoke }
