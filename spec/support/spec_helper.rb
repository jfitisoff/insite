# CircleCI
if ENV['CIRCLE_ARTIFACTS']
  require 'simplecov'
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
  SimpleCov.start

  require 'coveralls'
  Coveralls.wear_merged!
end
