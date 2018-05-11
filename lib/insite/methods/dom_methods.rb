module Insite
  module DOMMethods
    Insite::METHOD_MAP.each do |k, v|
      # Create class-level methods for defining class-level methods for defining
      # DOM elements (1:1 match for Watir browser DOM methods.)
      v.each do |mth|
        # Class-level method to define DOM elements.
        define_method(mth) do |name=nil, *args, &block|
          @page_elements ||= [name.to_sym]

          # For now, do some mumbo jumbo to determine the right class name and
          # look at handling in the method map a little later.
          class_str = Insite::METHOD_MAP.find do |k, v|
            Insite::METHOD_MAP[k].include?(mth)
          end.first.to_s.demodulize

          # If a block is given when making the class-level method call to define
          # the page element, create a new, modified version of the element class
          # that's nested within the page class.
          if block_given?
            klass = Class.new("Insite::#{class_str}".constantize) do
              self.class_eval(&block) if block_given?
            end

            # cname = name.to_s.camelcase
            puts "block_given: #{self}"
            self.const_set(name.to_s.camelcase, klass) unless self.const_defined? name.to_s.camelcase
          end

          # Instance method that's generated on the object when the class-level
          # method is invoked.
          if block_given?
            define_method(name) do |*args, &block|
              name.to_s.camelcase.constantize.new(
                @site,
                @browser.send(*args.unshift(mth))
              )
            end
          else
            define_method(name) do |*args, &block|
              "Insite::#{class_str}".constantize.new(
                @site,
                @browser.send(*args.unshift(mth))
              )
            end
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
end
