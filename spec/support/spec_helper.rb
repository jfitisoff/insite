# CircleCI
if ENV['CIRCLE_ARTIFACTS']
  require 'simplecov'
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
  # SimpleCov.start
  SimpleCov.start do
    add_filter 'spec'
    add_group  'lib'
  end
  require 'coveralls'
  Coveralls.wear_merged!
end
