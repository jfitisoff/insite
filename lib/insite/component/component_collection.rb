module Insite
  class ComponentCollection
    attr_reader :args, :collection_member_type, :browser, :indentifiers, :query_scope, :site, :target
    class_attribute :selector, default: {}
    self.selector  = self.selector.clone

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    include Insite::ElementInstanceMethods
    extend  Insite::ComponentMethods
    include Insite::ComponentInstanceMethods
    include Enumerable

    # Returns true if the class represents a collection, false if not.
    # @return [true, false]
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

    def initialize(query_scope, *args)
      @site     = query_scope.class.ancestors.include?(Insite) ? query_scope : query_scope.site
      @browser  = @site.browser
      @collection_member_type = self.class.instance_variable_get(:@collection_member_type)
      @selector = @collection_member_type.selector

      if args[0].is_a?(Insite::Element) || args[0].is_a?(Watir::Element)
        @dom_type = nil
        @args     = nil
        @target   = args[0].target
      elsif  args[0].is_a?(Insite::ElementCollection) || args[0].is_a?(Watir::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = args[0]
      else

        @args     = parse_args(args)
        @selector = @args

        @non_relative = @args.delete(:non_relative) || false
        if @non_relative
          @query_scope = query_scope.site
        else
          query_scope.respond_to?(:target) ? obj = query_scope : obj = query_scope.site
          @query_scope = obj
        end

        if watir_class = Insite::CLASS_MAP.key(self.class)
          @target = watir_class.new(@query_scope.target, @args)
        else
          @target = Watir::HTMLElementCollection.new(@query_scope.target, @args)
        end
      end
    end

    def inspect
      @selector.empty? ? s = '{element: (selenium element)}' : s = @selector.to_s
      "#<#{self.class}: @query_scope: #{@query_scope}; @selector=#{s}>"
    end

    def last
      to_a[-1]
    end

    def length
      to_a.length
    end
    alias count length
    alias size length

    def text
      to_a.map(&:text)
    end

    def to_a
      out = []
      @target.to_a.each_with_index do |elem, idx|
        out << @collection_member_type.new(
          @query_scope,
          @args.merge!(index: idx)
        )
      end
      out
    end
  end
end
