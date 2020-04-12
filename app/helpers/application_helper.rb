module ApplicationHelper
  def title(title)
    render partial: 'shared/title', locals: {title: title}
  end

  def fetch_errors(resource,attribute)
    render partial: 'shared/form_error', locals: {resource: resource, attribute: attribute}
  end

  def error_class(resource, attribute)
    if resource.errors.messages[attribute].present?
      " is-invalid"
    else
      ""
    end
  end
end
