module Insite
  class ElementCollection < Element
    attr_accessor :browser

    def ==(other)
      to_a == other.to_a
    end
    alias eql? ==

    def[](idx)
      if tmp = @target[idx]
        "Insite::#{@target.element_class_name}".constantize.new(self, tmp)
      else
        nil
      end
    end

    def collection?
      true
    end

    def first
      self[0]
    end

    def each(&block)
      to_a.each(&block)
    end

    def empty?
      length == 0
    end

    def last
      self[-1]
    end

    def length
      to_a.length
    end
    alias count length
    alias size length

    def to_a
      # TODO: Do this in a more efficient way.
      @target.to_a.map do |elem|
        "Insite::#{@target.element_class_name}".constantize.new(self, elem)
      end
    end
  end
end
