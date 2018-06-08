module Insite
  class Element
    attr_reader :target, :site

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    include Insite::ElementInstanceMethods
    extend  Forwardable

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
      @selector.empty? ? s = '{element: (selenium element)}' : s = @selector.to_s
      "#<#{self.class}: located: #{!!@target.element}; @selector=#{s}>"
    end

    # For page component code.
    def method_missing(mth, *args, &block)
      if @target.respond_to? mth
        @target.send(mth, *args, &block)
      elsif @target.class.descendants.any? { |x| x.instance_methods.include? mth }
        @target.to_subtype.send(mth, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(mth, include_priv = false)
      @target.respond_to?(mth, include_priv) || super
    end
  end

end
