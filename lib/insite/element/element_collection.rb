module Insite
  class ElementCollection < Element
    attr_accessor :browser
    attr_reader :collection_member_type, :selector

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

    def self.collection_member_type
      self.class.to_s.gsub('Collection', '')
    end

    def initialize(parent, *args)
      @collection_member_type = self.class.to_s.gsub('Collection', '').constantize

      # Figure out the correct query scope.
      parent.respond_to?(:target) ? obj = parent : obj = parent.site
      @parent   = obj
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser
      if args[0].is_a?(Insite::Element) || args[0].is_a?(Insite::ElementCollection)
        @target   = args[0].target
        @args     = @target.selector.dup
        @selector = @args
      elsif  args[0].is_a?(Watir::Element) || args[0].is_a?(Watir::ElementCollection)
        @target   = args[0]
        @args     = @target.instance_variable_get(:@selector).dup
        @selector   = @args
      else
        if [Insite::ElementCollection,
             Insite::HTMLElementCollection
           ].include?(self.class) || !Insite.class_to_tag(@collection_member_type)
          @args     = parse_args(args)
          @selector = @args
          @target   = Watir::HTMLElementCollection.new(@parent.target, @args)
        else
          @args   = parse_args(args).merge(
            tag_name: Insite.class_to_tag(@collection_member_type)
          )
          @selector = @args
          @target   = Insite::CLASS_MAP.key(self.class).new(@parent.target, @args)
        end
      end
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
          @args.merge(index: idx)
        )
      end
      out
    end
  end
end
