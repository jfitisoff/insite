module Insite
  class ElementCollection < Element
    attr_accessor :browser
    attr_reader :collection_member_type, :selector

    def ==(other)
      to_a == other.to_a
    end
    alias eql? ==

    def[](idx)
      if tmp = @target[idx]
        "Insite::#{@target.element_class_name}".constantize.new(self, index: idx)
      else
        nil
      end
    end

    def collection?
      true
    end

    def initialize(parent, *args)
      @collection_member_type = self.class.to_s.gsub('Collection', '').constantize
      @parent   = parent
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser

      if args[0].is_a?(Insite::Element) || args[0].is_a?(Insite::ElementCollection)
        @args     = nil
        @target   = args[0].target
        @selector = @target.selector
      elsif  args[0].is_a?(Watir::Element) || args[0].is_a?(Watir::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = args[0]
        @selector = @target.instance_variable_get(:@selector)
      else
        @args     = args

        if @parent.is_a? Component
          @target = @parent.send(parse_args(args))
        else
          @target = @browser.send(parse_args(args))
        end
      end
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
      out = []
      @target.to_a.each_with_index do |elem, idx|
        out << @collection_member_type.new(self, index: idx)
      end
      out
    end
    # def to_a
    #   # TODO: Do this in a more efficient way.
    #   @target.to_a.map do |elem|
    #     "Insite::#{@target.element_class_name}".constantize.new(self, elem)
    #   end
    # end
  end
end
