# Overrides key methods of the Devise Sessions controller
class SessionsController < Devise::SessionsController
  include Devise::Controllers::InternalHelpers
  before_filter :load_js
  def load_js
     AssetManager.include_contrib_library [:fancybox]

    AssetManager.include_css [
      :application,
        "jquery.fancybox-1.3.4.css",
        "jquery.rating.css",
    ]
  end
end
