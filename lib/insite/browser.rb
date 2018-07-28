require 'forwardable'
require_relative "methods/common_methods"
require_relative "element/generated/element_instance_methods"
require_relative "component/component_instance_methods"

module Insite
  class Browser
    attr_reader :target, :site

    include Insite::ElementInstanceMethods
    include Insite::ComponentInstanceMethods
    extend Forwardable

    def_delegators :@target, :back, :browser, :driver, :cookies, :close, :ensure_context,
                   :execute_script, :exist?, :exists?, :forward, :goto, :html,
                   :name, :ready_state, :refresh, :screenshot, :selector_string,
                   :send_keys, :status, :title, :text, :url, :wait, :wait_until,
                   :wait_until_present, :wait_while, :wait_while_present, :wd,
                   :uniq
# TODO: Window methods

    def initialize(site)
      @site = site
      @target = site.browser
    end

    def inspect
      "#<#{self.class}: url=\"#{self.url}\" title=\"#{self.title}\">"
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
