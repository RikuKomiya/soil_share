module ApplicationHelper
  def title(title)
    render partial: 'shared/title', locals: {title: title}
  end
end
