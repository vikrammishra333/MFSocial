class ApplicationController < ActionController::Base
  #before_filter  :global_assets
  protect_from_forgery

  def global_assets

    AssetManager.include_contrib_library [:fancybox, :jquery_tooltip]

    AssetManager.include_css [
      :application,        
        :jquery_ui,       
        :account,        
        "jquery.tooltip.css",
        "jquery.fancybox-1.3.4.css",
        "jquery.rating.css",
    ]

  end
end
