# frozen_string_literal: true

module ApplicationHelper
  def flash_class(key)
    case key
    when "notice" then "green-500"
    when "alert" then "yellow-500"
    when "error" then "red-500"
    end
  end
end
