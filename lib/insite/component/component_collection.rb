module Insite
  class ComponentCollection
    attr_reader :args, :collection_member_type, :browser, :indentifiers, :site, :target
    class_attribute :selector, default: {}
    self.selector  = self.selector.clone

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    include Insite::ElementInstanceMethods
    extend  Insite::ComponentMethods
    include Insite::ComponentInstanceMethods
    include Enumerable

    def self.collection?
      true
    end

    def ==(other)
      to_a == other.to_a
    end
    alias eql? ==

    def[](idx)
      tmp = @target[idx]
      tmp ? @collection_member_type.new(@parent, index: idx) : nil
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

        @args = parse_args(args)
        # See if there's a Watir DOM method for the class. If not, then
        # initialize using the default collection.
        if watir_class = Insite::CLASS_MAP.key(self.class)
          @target = watir_class.new(@parent, @args)
        else
          @target = Watir::HTMLElementCollection.new(@parent, @args)
        end

        # if @parent.is_a? Component
        #   @args   = parse_args(args)
        #   @target = Insite::CLASS_MAP.key(self.class).new(@parent, @args)
        # else
        #   if tag = Insite.class_to_tag(self.class)
        #     @args.merge!(tag_name: tag)
        #   end
        #
        #   @target = Insite::CLASS_MAP.key(self.class).new(@browser, @args)
        # end
        # if @parent.is_a? Component
        #   @args   = parse_args(args)
        #   @target = Insite::CLASS_MAP.key(self.class).new(@parent, @args)
        # else
        #   if tag = Insite.class_to_tag(self.class)
        #     @args.merge!(tag_name: tag)
        #   end
        #
        #   @target = Insite::CLASS_MAP.key(self.class).new(@browser, @args)
        # end
        # @args     = args
        #
        # if @parent.is_a? Component
        #   @target = @parent.send(:elements, *args)
        # else
        #   @target = @browser.send(:elements, *args)
        # end
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
      out = []
      @target.to_a.each_with_index do |elem, idx|
        out << @collection_member_type.new(self, index: idx)
      end
      out
    end
  end
end
