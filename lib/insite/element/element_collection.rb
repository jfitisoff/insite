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

end
