require_relative '../component/component_methods.rb'
require_relative '../component/component_instance_methods.rb'

module Insite
  class Element
    attr_reader :target, :site

    class << self
      attr_reader :predefined_selector
    end

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    include Insite::ElementInstanceMethods
    extend  Insite::ComponentMethods
    include Insite::ComponentInstanceMethods
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

    def initialize(query_scope, *args)
      query_scope.respond_to?(:target) ? obj = query_scope : obj = query_scope.site
      @query_scope   = obj

      @site     = query_scope.class.ancestors.include?(Insite) ? query_scope : query_scope.site
      @browser  = @site.browser

      if args[0].is_a?(Insite::Element) || args[0].is_a?(Watir::Element)
        @target   = args[0].target
        @selector = @target.selector.dup
        @args     = @selector
      elsif  args[0].is_a?(Insite::ElementCollection) || args[0].is_a?(Watir::ElementCollection)
        @args     = nil
        @selector = @target.instance_variable_get(:@selector).dup
        @args     = @selector
      else
        if [Insite::Element, Insite::HTMLElement].include?(self.class)
          @args = parse_args(args.dup)
        elsif tag = parse_args(args)[:tag_name]
          @args = parse_args(args.dup)
        elsif Insite.class_to_tag(self.class)
          @args = parse_args(args.dup).merge(
            tag_name: Insite.class_to_tag(self.class)
          )
        else
          @args = parse_args(args.dup)
        end

        # Figure out the correct query scope.
        @non_relative = @args.delete(:non_relative) || false
        if @non_relative
          @query_scope = query_scope.site
        else
          query_scope.respond_to?(:target) ? obj = query_scope : obj = query_scope.site
          @query_scope = obj
        end
        @selector = @args

        if watir_class = Insite::CLASS_MAP.key(self.class)
          @target = watir_class.new(@query_scope.target, @args)
        else
          @target = Watir::HTMLElement.new(@query_scope.target, @args)
        end
      end
    end

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
         Insite::CLASS_MAP[out.class].new(@query_scope, out)
      else
        out
      end
    end

    def present?
      sleep 0.1
      begin
        if @query_scope
          if @query_scope.respond_to?(:present?) && @query_scope.present? && @target.present?
            true
          else
            false
          end
        else
          if @target.present?
            true
          else
            false
          end
        end
      rescue => e
        false
      end
    end

    def respond_to_missing?(mth, include_priv = false)
      @target.respond_to?(mth, include_priv) || super
    end
  end

end
