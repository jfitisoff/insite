class ElementContainer
  attr_reader :target, :site

  include Insite::CommonMethods
  extend  Forwardable

  class << self
    include Insite::WatirMethods
    # include Insite::WidgetMethods
  end # self

  def initialize(site, element)
    @site    = site
    @browser = @site.browser
    @target  = element


    # TODO: Continue looking at scolling solutions.
    if @target.present?
      @target.scroll.to
      wait_until(2) { break if @target.present?; sleep 0.2 }
    end

    @target
  end

  # For page widget code.
  def method_missing(sym, *args, &block)
    if @target.respond_to? sym
      if @target.is_a? Watir::ElementCollection
        @target.map { |x| self.class.new(x) }.send(sym, *args, &block)
      else
        @target.send(sym, *args, &block)
      end
    else
      super
    end
  end
end
