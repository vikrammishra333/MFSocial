class ApplicationController < ActionController::Base
  protect_from_forgery

  def global_assets

    AssetManager.include_contrib_library [:fancybox, :jquery_tooltip]

    AssetManager.include_css [
      :application,
        :timePicker,
        :ccvalidate,
        :fullcalendar,
        :commerce,
        :home,
        :search,
        :jquery_ui,
        :reviews,
        :scaffolds,
        :providers,
        :account,
        "960_5_15_15.css",
        "jquery.tooltip.css",
        "ui.daterangepicker.css",
        "jquery.fancybox-1.3.4.css",
        "jquery.rating.css",
    ]

  end
end
