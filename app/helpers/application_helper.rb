# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  
  def flash_class(key)
    case key
    when 'notice'
      'alert-success'
    when 'alert'
      'alert-warning'
    when 'error'
      'alert-danger'
    end
  end

  def current_year
    "#{Time.current.year}"
  end
end
