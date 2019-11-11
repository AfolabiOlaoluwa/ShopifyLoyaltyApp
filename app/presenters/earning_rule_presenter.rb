# frozen_string_literal: true

class EarningRulePresenter < ApplicationPresenter
  def name
    @model.name
  end

  def point
    @model.point
  end

  def status
    @model.status
  end
end