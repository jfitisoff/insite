module Insite
  class Element
    attr_reader :target, :site

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    # extend  Insite::ComponentMethods
    # include Insite::ComponentInstanceMethods
    extend  Forwardable

    def initialize(site, element)
      @site    = site
      @browser = @site.browser
      @target  = element

      # Temporary replacement for custom wait_until.
      # TODO: Continue looking at scolling solutions.
      if @target.present?
        @target.scroll.to
        t = ::Time.now + 2
        while ::Time.now <= t do
          break if @target.present?
          sleep 0.1
        end
      end

      @target
    end

    # For page component code.
    def method_missing(sym, *args, &block)
      if @target.respond_to? sym
        @target.send(sym, *args, &block)
      else
        super
      end
    end
  end

end
