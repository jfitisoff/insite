module Watir
  class Browser
    def containers
      Watir.constants.find_all do |c|
        c.to_s =~ /Container$/
      end.map { |klass| "Watir::#{klass}".constantize }
    end

    def element_methods
      containers.map(&:instance_methods).flatten.sort
    end

    def element_classes
      [
        Watir::Element.descendants,
        Watir::ElementCollection.descendants
      ].flatten.sort { |x, y| x.to_s <=> y.to_s }
    end

    def class_map
      element_classes.map do |klass|
        [klass, "Insite::#{klass.to_s.demodulize}".constantize]
      end.to_h
    end

    def method_map
      mmap = {}
      unprocessed = []

      element_methods.each do |mth|
        begin
          k = send(mth)

          if k.is_a?(Watir::Element) || k.is_a?(Watir::ElementCollection)
            mmap[mth] = "Insite::#{k.class.to_s.demodulize}"
          else
            next
          end
        rescue => e
          unprocessed << mth
        end
      end

      unprocessed.each do |mth|
        if arr = mmap.find { |k, v| send(k).respond_to?(mth) }
          begin
            tmp = send(arr[0]).send(mth)
          rescue => e
            next
          end

          if tmp.is_a?(Watir::Element) || tmp.is_a?(Watir::ElementCollection)
            mmap[mth] = "Insite::#{tmp.class.to_s.demodulize}"
          end
        end
      end

      mmap
    end

    def generate_all
      generate_method_map
      generate_element_classes
      generate_element_instance_methods
    end

    def generate_class_map
      f = File.new("./lib/insite/element/generated/class_map.rb", 'w+')
      str = "{\n"
      str << class_map.map { |k, v| "    #{k} => #{v}," }.join("\n")
      # str << class_map.to_s.scan(/W+?,/).map {|str| "    #{str.gsub("\"", '')}\n" }.join
      str << "\n  }.freeze"
      output = <<~EOS
      module Insite
        CLASS_MAP = #{str}
      end
      EOS
      f.puts output
      f.close
    end

    def generate_element_classes
      mstr = element_classes.map do |klass|
        if klass.to_s =~ /Collection$/
          c = 'Insite::ElementCollection'
        else
          c = 'Insite::Element'
        end

        <<-EOS.gsub(/^\s{8}(?!\S|\n|$)/, '')
          class #{klass.to_s.demodulize} < #{c}
          end
        EOS
      end.join("\n")

      f = File.new("./lib/insite/element/generated/element_classes.rb", 'w+')
      f.puts "module Insite\n" + mstr + "end"
      f.close
    end

    def generate_element_instance_methods
      hsh = {}
      str = method_map.map do |k, v|
        if respond_to?(k)
          if tag = send(k).instance_variable_get(:@selector)[:tag_name]
            <<-EOS.gsub(/^\s{12}(?!\S|\n|$)/, '')
                def #{k}(*args)
                  # respond_to?(:target) ? obj = self : obj = @browser
                  #{v}.new(self, parse_args(args).merge(tag_name: "#{tag}"))
                end
            EOS
          else
            <<-EOS.gsub(/^\s{12}(?!\S|\n|$)/, '')
                def #{k}(*args)
                  # respond_to?(:target) ? obj = self : obj = @browser
                  #{v}.new(self, parse_args(args))
                end
            EOS
          end
        else
          <<-EOS.gsub(/^\s{10}(?!\S|\n|$)/, '')
              def #{k}(*args)
                # respond_to?(:target) ? obj = self : obj = @browser
                #{v}.new(self, parse_args(args))
              end
          EOS
        end
      end.join("\n")

      f = File.new("./lib/insite/element/generated/element_instance_methods.rb", 'w+')

      out = <<~EOS
      module Insite
        module ElementInstanceMethods
      #{str}
        end
      end
      EOS

      f.puts out
      f.close
    end

    def generate_method_map
      f = File.new("./lib/insite/element/generated/method_map.rb", 'w+')
      str = "{\n"
      str << method_map.to_s.scan(/:\S+?"\S+?,/).map {|str| "    #{str.gsub("\"", '')}\n" }.join
      str << "  }.freeze"
      output = <<~EOS
      module Insite
        ELEMENT_MAP = #{str}
      end
      EOS
      f.puts output
      f.close
    end
  end
end
