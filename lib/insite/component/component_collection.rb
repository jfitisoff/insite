module Insite
  class ComponentCollection
    attr_reader :args, :collection_member_type, :browser, :indentifiers, :site, :target


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
