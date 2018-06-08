class MatSelect < MaterialAngularIO::Component
  select_by tag_name: 'mat-select'

  def options(*args)
    mat_options(parse_args(args).merge!(css: "[#{ngcontent}='']"))
  end

  def option(*args)
    mat_option(parse_args(args).merge!(css: "[#{ngcontent}='']"))
  end

  def select(*values)
    values.each { |val| option(text: process_value(val)) }.click
  end
end
