module Watir
  class Browser
    def get_common_method_names(mth)
      out = []
      (methods - Object.methods).each do |m|
        next if m.to_s == mth.to_s
        out << m if method(m.to_sym) == method(mth.to_sym)
      end
      out << mth
    end

    def get_class_for_method(mth)
      send(mth).class
    end

    def element_map
      out = {}
      Watir::Container.instance_methods.each do |mth|
        begin
          klass = get_class_for_method(mth).to_s.demodulize
          unless klass == 'String'
            klass = "Insite::#{klass}"
            out[klass] = [] unless out[klass]
            out[klass] << get_common_method_names(mth)
            out[klass] = out[klass].flatten.uniq
          end
        rescue => e
          puts mth
        end
      end
      out
    end

    def generate_all
      generate_element_map
      generate_element_classes
      generate_element_instance_methods
    end

    def generate_element_classes
      keys = element_map.sort_by { |k, v| k }.to_h.keys
      str = keys.map do |key|
        if key =~ /Collection$/
          c = 'Insite::ElementCollection'
        else
          c = 'Insite::Element'
        end

        <<~EOS
        class #{key} < #{c}
        end

        EOS
      end

      f = File.new("./lib/insite/element/generated/element_classes.rb", 'w+')
      f.puts str
      f.close
    end

    def generate_element_map
      f = File.new("./lib/insite/element/generated/element_map.rb", 'w+')
      str = element_map.to_s.sub(
        /\{/,
        "{\n\s\s\s\s"
      ).sub(
        /\}/,
        "}.freeze\n"
      ).gsub(
         /\],\s*/,
         "],\n\s\s\s\s"
      ).gsub(
         /,\s*:/,
         ",\n\s\s\s\s\s\s:"
      ).gsub(
        /\[(:[a-z, 1-9,_]+?,$)/,
        "[\n\s\s\s\s\s\s\\1"
      ).gsub(
        /(:[a-z, 1-9,_]+?),\n\s+(:[a-z, 1-9,_]+?)\],$/,
        "\\1,\n\s\s\s\s\s\s\\2\n\s\s\s\s\],"
      )
      output = <<~EOS
      module Insite
        METHOD_MAP = #{str}
      end
      EOS
      f.puts output
      f.close
    end

    def generate_element_instance_methods
      hsh = {}
      element_map.each do |k, v|
        v.each do |mth|
tmp = <<-EOS
    def #{mth}(*args)
      #{k}.new(
        @site,
        @target.send(*args.unshift(__method__))
      )
    end

EOS
          hsh[v] = tmp
        end
      end
      str = hsh.sort_by { |k, v| k }.to_h.values.join

      f = File.new("./lib/insite/element/generated/element_instance_methods.rb", 'w+')
out = <<-EOF
module Insite
  module ElementInstanceMethods
#{str}
  end
end
EOF
      f.puts out
      f.close
    end
  end
end
