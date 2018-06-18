module Insite
  class Element
    attr_reader :target, :site

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    include Insite::ElementInstanceMethods
    extend  Forwardable

    def self.collection?
      false
    end

    def attributes
      nokogiri.xpath("//#{selector[:tag_name]}")[0].attributes.values.map do |x|
        [x.name, x.value]
      end.to_h
    end

    def classes
      attribute('class').split
    end

    def collection?
      false
    end

    def initialize(parent, *args)
      @parent   = parent
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser

      if args[0].is_a?(Insite::Element) || args[0].is_a?(Insite::ElementCollection)
        @target   = args[0].target
        @selector = @target.selector
        @args     = @selector
      elsif  args[0].is_a?(Watir::Element) || args[0].is_a?(Watir::ElementCollection)
        @args     = nil
        @selector = @target.instance_variable_get(:@selector)
        @args     = @selector
      else
        if @parent.is_a? Component
          @args   = parse_args(args)
          @target = Insite::CLASS_MAP.key(self.class).new(@parent, @args)
        else
          @args   = parse_args(args).merge(
            tag_name: Insite.class_to_tag(self.class)
          )
          @target = Insite::CLASS_MAP.key(self.class).new(@browser, @args)
        end
      end
    end

    # def initialize(site, element)
    #   @site    = site
    #   @browser = @site.browser
    #   @target  = element
    #
    #   # Temporary replacement for custom wait_until.
    #   # TODO: Continue looking at scolling solutions.
    #   if @target.present? && @target.respond_to?(:scroll)
    #     @target.scroll.to
    #     t = ::Time.now + 2
    #     while ::Time.now <= t do
    #       break if @target.present?
    #       sleep 0.1
    #     end
    #   end
    #
    #   @target
    # end

    def inspect
      if @target.selector.present?
        s = @selector.to_s
      else
        s = '{element: (selenium element)}'
      end
      "#<#{self.class}: located: #{!!@target.element}; @selector=#{s}>"
    end

    # For page component code.
    def method_missing(mth, *args, &block)
      if @target.respond_to? mth
        out = @target.send(mth, *args, &block)
      elsif @target.class.descendants.any? { |x| x.instance_methods.include? mth }
        out = @target.to_subtype.send(mth, *args, &block)
      else
        super
      end

      if out == @target
        self
      elsif out.is_a?(Watir::Element) || out.is_a?(Watir::ElementCollection)
         Insite::CLASS_MAP[out.class].new(@parent, out)
      else
        out
      end
    end

    def respond_to_missing?(mth, include_priv = false)
      @target.respond_to?(mth, include_priv) || super
    end

#     def to_subtype
# binding.pry
#       Insite::CLASS_MAP[@target.class].new(@parent, @selector)
#     end
  end

end
