require 'coveralls'
Coveralls.wear_merged!

require 'simplecov'
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start do
  add_filter 'spec'
  add_filter 'examples'
end




# # Most recent
# if ENV['CIRCLE_ARTIFACTS']
#   require 'coveralls'
#   Coveralls.wear_merged!
#
#   # save to CircleCI's artifacts directory if we're on CircleCI
#   require 'simplecov'
#   dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
#
#   SimpleCov.start do
#     coverage_dir dir
#     add_filter   'spec', 'examples'
#   end
# end


# require 'coveralls'
# Coveralls.wear!
#
# # save to CircleCI's artifacts directory if we're on CircleCI
# require 'simplecov'
# if ENV['CIRCLE_ARTIFACTS']
#   dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
#   SimpleCov.coverage_dir(dir)
# end
#
# SimpleCov.start do
#   add_filter 'spec'
# end
