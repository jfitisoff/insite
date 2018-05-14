# module Insite
#   class Feature
#     attr_reader :args, :page, :page_elements, :browser
#
#     include Insite::CommonMethods
#
#     class << self
#       attr_accessor :alias, :page_elements
#
#       include Insite::DOMMethods
#       include Insite::ComponentMethods
#     end # Self.
#
#     def initialize(site, **args)
#       if self.class.ancestors.include?(Insite::DefinedPage)
#       # if site.is_a? Insite:DefinedPage # TODO: Bandaid.
#         @site  = site.site
#         @page  = site
#       elsif site.class.ancestors.include?(Insite)
#         @site  = site
#         @page  = site.page
#       end
#
#       @args    = args
#       @page    = page
#       @browser = @site.browser
#       @page_elements = @site.page_elements
#     end
#   end
# end
