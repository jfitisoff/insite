module Insite
  module DOMMethods
    DOM_METHODS.each do |mth|
      define_method(mth) do |name=nil, *args, &block|
        if block
          element_container(name, mth, *args, &block)
        else
          el(name) { |b| b.send(mth, parse_args(args.flatten)) }
        end
      end
    end

    def el(name, &block)
      @page_elements ||= []
      @page_elements << name.to_sym

      define_method(name) do
        begin
          block.call(@browser)
        rescue(Watir::Exception::UnknownObjectException) => e
          tmp = page

          if tmp == @most_recent_page
            raise e
          else
            @most_recent_page = tmp
            block.call(@browser)
          end
        end
      end
    end

    # Duplicates Watir DOM element argument parsing for element methods.
    private
    def parse_args(args)
      case args.length
      when 2
        return { args[0] => args[1] }
      when 1
        obj = args.first
      return obj if obj.kind_of? Hash
      when 0
        return {}
      end
    end
    public
  end
end
