module BusinessHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "TrustSystems"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # Sub-menu class
  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

end