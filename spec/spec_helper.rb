ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("task")



RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end
