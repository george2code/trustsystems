module DashboardHelper

  # Sub-menu class
  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  # Sub-menu class depends from Controller
  def current_class_controller?(controller_name)
    return 'active' if controller.controller_name == controller_name
    ''
  end

end