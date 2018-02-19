module Insite
  class Feature
    attr_reader :args, :page, :page_elements, :browser

    include Insite::CommonMethods

    class << self
      attr_accessor :alias, :page_elements

      include Insite::DOMMethods
      include Insite::WidgetMethods
    end # Self.

    def initialize(site, **args)
      if site.is_a?  # TODO: Bandaid.
        @site  = site.site
        @page  = site
      elsif site.class.ancestors.include?(Insite)
        @site  = site
        @page  = site.page
      end

      @args    = args
      @page    = page
      @browser = @site.browser
      @page_elements = @site.page_elements
    end
  end
end

# TODO: For legacy code, should be removed.
class PageFeature < Insite::Feature
end
