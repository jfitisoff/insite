class ElementContainer
  attr_reader :target

  include Insite::CommonMethods

  class << self
    include Insite::WatirMethods
    include Insite::WidgetMethods
    # # # Implement the same argument parsing the Watir::HTMLElement does because we're
    # # # doing a pass-through.
    # # private
    # # def parse_args(args)
    # #   case args.length
    # #   when 2
    # #     return { args[0] => args[1] }
    # #   when 1
    # #     obj = args.first
    # #   return obj if obj.kind_of? Hash
    # #   when 0
    # #     return {}
    # #   end
    # # end
    # # public
    # #
    # WATIR_METHODS.each do |mth|
    #   define_method(mth) do |name=nil, *args|
    #     el(name) { |b| b.send(mth, parse_args(args.flatten)) }
    #   end
    # end
    #
    # # For ElementContainer.
    # def el(name, &block)
    #   @page_elements ||= []
    #   @page_elements << name.to_sym
    #
    #   define_method(name) do
    #     begin
    #       block.call(@target)
    #     rescue(Watir::Exception::UnknownObjectException) => e
    #       tmp = page
    #
    #       if tmp == @most_recent_page
    #         raise e
    #       else
    #         @most_recent_page = tmp
    #         block.call(@target)
    #       end
    #     end
    #   end
    # end
  end # self

  def initialize(element)
    @target = element
  end

  # def nokogiri
  #   Nokogiri::HTML(html)
  # end

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
