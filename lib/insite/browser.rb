require_relative "methods/common_methods"
require_relative "element/generated/element_instance_methods"
require_relative "component/component_instance_methods"

module Insite
  class Browser
    attr_reader :target, :site #, :watir

    include Insite::ElementInstanceMethods
    include Insite::ComponentInstanceMethods

    def initialize(site)
      @site = site
      @target = site.browser
    end

    # Duplicates Watir DOM element argument parsing for element methods.
    private
    def parse_args(*args)
      args = args.flatten if args.is_a?(Array)
      case args.length
      when 2
        return { args[0] => args[1] }
      when 1
        obj = args.first
      when 0
        return {}
      end
    end
    public
  end
end
