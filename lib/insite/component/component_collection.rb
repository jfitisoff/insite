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
      to_a[idx]
    end

    def collection?
      true
    end

    def first
      to_a[0]
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

        # Figure out the correct query scope to initialize the Watir collection.
        @parent.respond_to?(:target) ? obj = @parent.target : obj = @browser

        # See if there's a Watir DOM method for the class. If not, then
        # initialize using the default collection.
        if watir_class = Insite::CLASS_MAP.key(self.class)
          @target = watir_class.new(obj, @args)
        else
          @target = Watir::HTMLElementCollection.new(obj, @args)
        end
      end
    end

    def inspect
      @selector.empty? ? s = '{element: (selenium element)}' : s = @selector.to_s
      "#<#{self.class}: @parent: #{@parent}; @selector=#{s}>"
    end

    def last
      to_a[-1]
    end

    def length
      to_a.length
    end
    alias count length
    alias size length

    def to_a
      out = []
      @target.to_a.each_with_index do |elem, idx|
        out << @collection_member_type.new(
          @parent,
          @args.merge!(index: idx)
        )
      end
      out
    end
  end
end
