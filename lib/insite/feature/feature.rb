module Insite
  class Feature
    attr_reader :args, :page, :page_elements, :browser

    include Insite::CommonMethods

    class << self
      attr_accessor :alias, :page_elements

      include Insite::WatirMethods
      include Insite::WidgetMethods
    end # Self.

    def initialize(site, **args)
      if site.is_a? RecurlySite::Page # TODO: Bandaid.
        @site  = site.site
        @page  = site
      elsif site.is_a? RecurlySite
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
