module ApplicationHelper
  def boolean_check_mark(boo)
    if boo
      '<i class="fa fa-check"></i>'.html_safe
    else
      ''
    end
  end
end
