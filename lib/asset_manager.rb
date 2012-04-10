class AssetManager

  def self.include_css file
    if file.class == Array
      file.each do |f|
        include_css_file_individual f
      end
    else
      include_css_file_individual file
    end
  end

  def self.include_contrib_library library
    include_js_library library, :contrib
  end

  def self.include_local_library library
    include_js_library library, :local
  end

  def self.include_js_library library, type = :local
    Rails.logger.debug library.inspect
    if library.class == Array
      library.each do |l|
        include_js_library_individual l, type
      end
    else
      include_js_library_individual library, type
    end
  end



  def self.get_libraries
    return @@js_includes
  end

  def self.get_css
    return @@css_includes
  end

  private
  @@js_includes = []
  @@css_includes = []

  def self.include_js_library_individual library, type

    file = ""

    case type
      when :local
        if library.class == Symbol
          file = library.to_s + ".js"
        else
          file = library
        end
      when :contrib
        file = "contrib/" + @@libraries[library]
    end

    @@js_includes << file unless file.blank? or @@js_includes.include? file

  end


  def self.include_css_file_individual file

    if file.class == Symbol
      file = file.to_s + '.css'
    end

    @@css_includes << file  unless file.blank? or @@css_includes.include? file
  end


  @@libraries = {
    :date               => "date.js",
    :ajax_submit        => "ajax.submit.js",   
    :date_format        => "date_format.js",   
    :form               => "jquery.form.js",   
    :jquery_datepicker  => "jquery.ui.datepicker.js",
    :validate           => "jquery.validate.js",
    :validate_additional => "jquery.validate.additional-methods.js",
    :jquery_form        => "jquery_form.js",
    :fancybox           => "fancybox/jquery.fancybox-1.3.4.js",
    :fancybox_wheel     => "fancybox/jquery.mousewheel-3.0.4.pack.js",   
    :data_table         => "jquery.dataTables.js",
    :carousel           => "jquery_jcarousel_min.js"
  }

end
