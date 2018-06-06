require_relative 'site'

%w(autocomplete checkbox datepicker form-field input radio
  select slider slide-toggle menu sidenav toolbar card divider
  expansion grid-list list stepper tabs tree button button-toggle
  badge chips icon progress-spinner progress-bar bottom-sheet
  dialog snackbar tooltip paginator sort table
).each do |component|
  %w(overview api examples).each do |category|
    klass = Class.new(MaterialAngularIO::Page) do
      set_url "/components/#{component}/#{category}"
    end

    Object.const_set(
      "#{component.gsub('-', '_')}_#{category}_page".camelcase,
      klass
    )
  end
end
