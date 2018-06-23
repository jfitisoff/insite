module Insite
  module Errors
    class Insite::Errors::BrowserClosedError              < StandardError; end
    class Insite::Errors::BrowserLibraryNotSupportedError < StandardError; end
    class Insite::Errors::BrowserNotAvailableError        < StandardError; end
    class Insite::Errors::BrowserNotOpenError             < StandardError; end
    class Insite::Errors::BrowserNotValidError            < StandardError; end
    class Insite::Errors::BrowserResponseError            < StandardError; end
    class Insite::Errors::ComponentReferenceError         < StandardError; end
    class Insite::Errors::PageConfigError                 < StandardError; end
    class Insite::Errors::PageInitError                   < StandardError; end
    class Insite::Errors::PageNavigationError             < StandardError; end
    class Insite::Errors::PageNavigationNotAllowedError   < StandardError; end
    class Insite::Errors::SiteInitError                   < StandardError; end
    class Insite::Errors::WrongPageError                  < StandardError; end
  end
end
