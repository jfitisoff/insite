module Insite
  class ComponentCollection
    attr_reader :args, :collection_member_type, :browser, :indentifiers, :site, :target
    include Enumerable
    include Insite::ElementInstanceMethods

    def each(&block)
      to_a.each(&block)
    end

    def initialize(parent, dom_type, *args)
      @parent   = parent
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser
      @collection_member_type = self.class.instance_variable_get(:@collection_member_type)
      @selector = @collection_member_type.selector

      if dom_type.is_a?(Insite::Element) || dom_type.is_a?(Insite::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = dom_type
      elsif dom_type.is_a?(Watir::Element) || dom_type.is_a?(Watir::ElementCollection)
          @dom_type = nil
          @args     = nil
          @target   = dom_type
      elsif [::String, ::Symbol].include? dom_type.class
        @dom_type = dom_type
        @args     = args

        if @parent.is_a? Component
          @target = @parent.send(dom_type, *args)
        else
          @target = @browser.send(dom_type, *args)
        end
      else
        raise "Unhandled exception."
      end
    end

    def method_missing(sym, *args, &block)
      if @target.respond_to? sym
        tmp = @target.send(sym, *args, &block)
      elsif [].respond_to? sym
        tmp = @target.to_a.send(sym, *args, &block)
      else
        super
      end
    end

    def to_a
      @target.to_a.map do |elem|
        @collection_member_type.new(self, elem)
      end
    end
  end
end
