module Insite
  module DOMMethods
    Insite::METHOD_MAP.each do |k, v|
      # Create class-level methods for defining
      # DOM elements (1:1 match for Watir browser DOM methods.)
      v.each do |mth|
        # Class-level method to define page elements in a page class.
        define_method(mth) do |name=nil, *args, &block|
          @page_elements ||= [name.to_sym]
          c = Insite::METHOD_MAP.find { |k, v| Insite::METHOD_MAP[k].include?(mth) }
          c = c.first.to_s.demodulize
          base_class = "Insite::#{c}".constantize

          if block
            new_class_name = "#{c}For#{name.to_s.camelcase}"
            unless self.class.const_defined? new_class_name
              klass = Class.new(base_class) do
                @predefined_selector = parse_args(args)
                class_eval(&block) if block
              end
              const_set(new_class_name, klass)
            end

            define_method(name) do
              if @site && @browser
                klass.new(@site, parse_args(args))
              end
            end
          else
            define_method(name) do
              if @site && @browser
                base_class.new(@site, parse_args(args))
              end
            end
          end
        end
      end

      # # TODO: (More context when this happens.)
      # # ArgumentError: wrong number of arguments (given 1, expected 0)
      # # from /Users/john/.rbenv/versions/2.3.5/lib/ruby/gems/2.3.0/gems/insite-0.5.1/lib/insite/methods/dom_methods.rb:17:in `block in el'
      # def el(name, &block)
      #   @page_elements ||= []
      #   @page_elements << name.to_sym
      #
      #   define_method(name) do
      #     begin
      #       elem = block.call(@browser)
      #       begin
      #         elem.dup.scroll.to
      #       rescue => e
      #       end
      #     rescue(Watir::Exception::UnknownObjectException) => e
      #       tmp = page
      #
      #       if tmp == @most_recent_page
      #         raise e
      #       else
      #         @most_recent_page = tmp
      #         elem = block.call(@browser)
      #         begin
      #           elem.dup.scroll.to
      #         rescue => e
      #         end
      #       end
      #     end
      #     elem
      #   end
      # end

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
end
