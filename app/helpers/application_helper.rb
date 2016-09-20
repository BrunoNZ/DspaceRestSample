module ApplicationHelper

  def previsous_page_status page
    page == 0 ? 'disabled' : 'enabled'
  end

  def next_page_status objects
    (objects.empty? || objects.size < 25) ? 'disabled' : 'enabled'
  end

  def min_numbered_page page
    page-2 < 0 ? 0 : page-2
  end

  def max_numbered_page(page,objects)
    (objects.empty? || objects.size < 25) ? page : page+2
  end
end
