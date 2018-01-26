module Insite
  module Errors
    class Insite::Errors::BrowserLibraryNotSupportedError < StandardError; end
    class Insite::Errors::PageConfigError                 < StandardError; end
    class Insite::Errors::PageInitError                   < StandardError; end
    class Insite::Errors::PageNavigationError             < StandardError; end
    class Insite::Errors::PageNavigationNotAllowedError   < StandardError; end
    class Insite::Errors::SiteInitError                   < StandardError; end
    class Insite::Errors::WrongPageError                  < StandardError; end
  end
end
