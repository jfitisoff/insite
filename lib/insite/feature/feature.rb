module Insite
  class Feature
    attr_reader :page, :page_elements, :browser

    include Insite::CommonMethods

    class << self
      attr_accessor :alias, :page_elements

      include Insite::WatirMethods
      include Insite::WidgetMethods
    end # Self.

    def initialize(page)
      @page    = page
      @browser = @page.browser
      @page_elements = self.class.page_elements
    end
  end
end

# TODO: For legacy code, should be removed.
class PageFeature < Insite::Feature
end
