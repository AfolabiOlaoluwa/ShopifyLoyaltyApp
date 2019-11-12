# frozen_string_literal: true

module ApplicationHelper
  def flash_messages_for(object)
    render(partial: 'shared/flash_messages', locals: { object: object })
  end

  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  def text_formatter(value, true_color = 'success', false_color = 'danger')
    case value
    when true
      content_tag(:span, 'Active', class: "btn-sm tag-#{true_color}")
    when false
      content_tag(:span, 'Inactive', class: "btn-sm tag-#{false_color}")
    end
  end
end
