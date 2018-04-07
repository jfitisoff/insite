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

   # TODO: (More context when this happens.)
   # ArgumentError: wrong number of arguments (given 1, expected 0)
   # from /Users/john/.rbenv/versions/2.3.5/lib/ruby/gems/2.3.0/gems/insite-0.5.1/lib/insite/methods/dom_methods.rb:17:in `block in el'
    def el(name, &block)
      @page_elements ||= []
      @page_elements << name.to_sym

      define_method(name) do
        begin
          elem = block.call(@browser)
          begin
            elem.dup.scroll.to
          rescue => e
          end
        rescue(Watir::Exception::UnknownObjectException) => e
          tmp = page

          if tmp == @most_recent_page
            raise e
          else
            @most_recent_page = tmp
            elem = block.call(@browser)
            begin
              elem.dup.scroll.to
            rescue => e
            end
          end
        end
        elem
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
