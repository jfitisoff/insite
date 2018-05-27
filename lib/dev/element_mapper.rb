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
        <<-EOS.gsub(/^\s{8}(?!\S|\n|$)/, '')
            def #{k}(*args)
              #{v}.new(
                @site,
                @target.send(*args.unshift(__method__))
              )
            end
        EOS
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

# ==============



# module Watir
#   class Browser
#     def get_aliased_method_names(klass, mth)
#       out = []
#       (klass.methods - Object.methods).each do |m|
#         next if m.to_s == mth.to_s
#         out << m if method(m.to_sym) == method(mth.to_sym)
#       end
#       out #<< mth
#     end
#
#     def get_common_method_names(mth)
#       out = []
#       (methods - Object.methods).each do |m|
#         next if m.to_s == mth.to_s
#         out << m if method(m.to_sym) == method(mth.to_sym)
#       end
#       out << mth
#     end
#
#     def get_class_for_method(mth)
#       send(mth).class
#     end
#
#     # def element_methods
#     #   [
#     #     Watir::Container,
#     #     Watir::CellContainer,
#     #     Watir::RowContainer
#     #   ].map(&:instance_methods).flatten.sort
#     # end
#
#     def element_map
#       out = {}
#       Watir::Container.instance_methods.each do |mth|
#         begin
#           klass = send(mth).class
#           unless klass.to_s == 'String'
#             klass_name = "Insite::#{klass.to_s.demodulize}"
#             out[klass_name] = [] unless out[klass_name]
#             out[klass_name] << get_common_method_names(mth)
#             out[klass_name] = out[klass_name].flatten.uniq
#           end
#         rescue => e
#           puts mth
#         end
#       end
#       out
#     end
#
#     def tag_map
#       Insite::METHOD_MAP.values.flatten.sort.map do |mth|
#         klass_instance = send(mth)
#         new_class_name = klass_instance.class.to_s.sub('Watir::', 'Insite::')
#         if klass_instance.respond_to?(:selector)
#           [
#             klass_instance.selector[:tag_name],
#             new_class_name.constantize
#           ]
#         else
#           next
#         end
#       end.compact.deleteto_h
#     end
#
#     def generate_all
#       generate_element_map
#       generate_tag_map
#       generate_element_classes
#       generate_element_instance_methods
#     end
#
#     def generate_element_classes
#       keys = element_map.sort_by { |k, v| k }.to_h.keys
#       str = keys.map do |key|
#         if key =~ /Collection$/
#           c = 'Insite::ElementCollection'
#         else
#           c = 'Insite::Element'
#         end
#
#         <<~EOS
#         class #{key} < #{c}
#         end
#
#         EOS
#       end
#
#       f = File.new("./lib/insite/element/generated/element_classes.rb", 'w+')
#       f.puts str
#       f.close
#     end
#
#     def generate_element_map
#       f = File.new("./lib/insite/element/generated/element_map.rb", 'w+')
#       str = element_map2.to_s.sub(
#         /\{/,
#         "{\n\s\s\s\s"
#       ).sub(
#         /\}/,
#         "}.freeze\n"
#       ).gsub(
#          /\],\s*/,
#          "],\n\s\s\s\s"
#       ).gsub(
#          /,\s*:/,
#          ",\n\s\s\s\s\s\s:"
#       ).gsub(
#         /\[(:[a-z, 1-9,_]+?,$)/,
#         "[\n\s\s\s\s\s\s\\1"
#       ).gsub(
#         /(:[a-z, 1-9,_]+?),\n\s+(:[a-z, 1-9,_]+?)\],$/,
#         "\\1,\n\s\s\s\s\s\s\\2\n\s\s\s\s\],"
#       )
#       output = <<~EOS
#       module Insite
#         METHOD_MAP = #{str}
#       end
#       EOS
#       f.puts output
#       f.close
#     end
#
#     def generate_element_instance_methods
#       hsh = {}
#       element_map.each do |k, v|
#         v.each do |mth|
# tmp = <<-EOS
#     def #{mth}(*args)
#       #{k}.new(
#         @site,
#         @target.send(*args.unshift(__method__))
#       )
#     end
#
# EOS
#           hsh[v] = tmp
#         end
#       end
#       str = hsh.sort_by { |k, v| k }.to_h.values.join
#
#       f = File.new("./lib/insite/element/generated/element_instance_methods.rb", 'w+')
# out = <<-EOF
# module Insite
#   module ElementInstanceMethods
# #{str}
#   end
# end
# EOF
#       f.puts out
#       f.close
#     end
#
#     def generate_tag_map
#       f = File.new("./lib/insite/element/generated/tag_map.rb", 'w+')
#       str = "{\n"
#       str << tag_map.to_s.scan(/"\S+?"\S+?,/).map {|str| "    #{str}\n" }.join
#       str << "  }.freeze"
#       output = <<~EOS
#       module Insite
#         TAG_MAP = #{str}
#       end
#       EOS
#       f.puts output
#       f.close
#     end
#   end
# end
