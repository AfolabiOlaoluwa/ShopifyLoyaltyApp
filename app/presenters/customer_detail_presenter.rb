# frozen_string_literal: true

class CustomerDetailPresenter < ApplicationPresenter
  def first_name
    @model.first_name
  end

  def last_name
    @model.last_name
  end

  def email
    @model.email
  end

  def point_balance
    return unless @model.point_balance

    points = @model.point_balance
    ActiveSupport::NumberHelper.number_to_delimited(points)
  end

  def previous_point
    return unless @model.previous_point

    points = @model.previous_point
    ActiveSupport::NumberHelper.number_to_delimited(points)
  end
end