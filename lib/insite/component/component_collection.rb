module Insite
  class ComponentCollection
    attr_reader :args, :collection_member_type, :browser, :indentifiers, :site, :target
    class_attribute :selector, default: {}
    self.selector  = self.selector.clone

    include Enumerable

    def ==(other)
      to_a == other.to_a
    end
    alias eql? ==

    def[](idx)
      tmp = @target[idx]
      tmp ? @collection_member_type.new(@site, tmp) : nil
    end

    def collection?
      true
    end

    def first
      self[0]
    end

    def each(&block)
      to_a.each(&block)
    end

    def empty?
      length == 0
    end

    def initialize(parent, *args)
      @parent   = parent
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser
      @collection_member_type = self.class.instance_variable_get(:@collection_member_type)
      @selector = @collection_member_type.selector

      if args[0].is_a?(Insite::Element) || args[0].is_a?(Insite::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = args[0].target
      elsif  args[0].is_a?(Watir::Element) || args[0].is_a?(Watir::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = args[0]
      else
        @args     = args

        if @parent.is_a? Component
          @target = @parent.send(:elements, *args)
        else
          @target = @browser.send(:elements, *args)
        end
      end
    end

    def inspect
      @selector.empty? ? s = '{element: (selenium element)}' : s = @selector.to_s
      "#<#{self.class}: @parent: #{@parent}; @selector=#{s}>"
    end

    def last
      self[-1]
    end

    def length
      to_a.length
    end
    alias count length
    alias size length

    def to_a
      @target.to_a.map do |elem|
        @collection_member_type.new(self, elem)
      end
    end
  end
end
