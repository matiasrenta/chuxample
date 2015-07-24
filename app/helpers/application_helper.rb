module ApplicationHelper
  def boolean_check_mark(boo)
    if boo
      '<i class="fa fa-check"></i>'.html_safe
    else
      ''
    end
  end

  def creating?
    ["new", "create"].include?(action_name)
  end

  def updating?
    ["edit", "update"].include?(action_name)
  end

  def listing?
    action_name == "index"
  end

  def showing?
    action_name == "show"
  end

end
