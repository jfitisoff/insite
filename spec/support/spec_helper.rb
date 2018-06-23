require 'coveralls'
Coveralls.wear_merged!

# save to CircleCI's artifacts directory if we're on CircleCI
require 'simplecov'
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start
