module Insite
  class ElementCollection < Element

    # For page component code.
    def method_missing(sym, *args, &block)
      if @target.respond_to? sym
        tmp = @target.send(sym, *args, &block)
      elsif [].respond_to? sym
        tmp = @target.to_a.send(sym, *args, &block)
      else
        super
      end
    end
  end

  def to_a
    # TODO: Do this in a more efficient way.
    @target.to_a.map do |elem|
      "Insite::#{@target.element_class_name}".constantize.new(self, elem)
    end
  end
end
