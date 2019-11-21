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
    @model.point_balance
  end
end