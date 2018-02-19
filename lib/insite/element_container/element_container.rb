class ElementContainer
  attr_reader :target, :site

  include Insite::CommonMethods
  extend  Forwardable

  class << self
    include Insite::DOMMethods
  end # self

  def initialize(site, element)
    @site    = site
    @browser = @site.browser
    @target  = element

    # Temporary replacement for custom wait_until.
    # TODO: Continue looking at scolling solutions.
    if @target.present?
      @target.scroll.to
      t = Time.now + 2
      while Time.now <= t do
        break if @target.present?
        sleep 0.1
      end
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
