# frozen_string_literal: true

class EarningRulesController < ApplicationController
  include StrictQueries::Concern

  before_action :set_earning_rule, only: %i[show edit update destroy]

  def index
    @earning_rules = EarningRule.all.load
  end

  def show; end

  def new
    @earning_rule = EarningRule.new
  end

  def edit; end

  def create
    @earning_rule = EarningRule.new(earning_rule_params)

    respond_to do |format|
      if @earning_rule.save
        format.html { redirect_to root_path, notice: 'Earning rule was successfully created.' }
        format.json { render :show, status: :created, location: @earning_rule }
      else
        format.html { render :new }
        format.json { render json: @earning_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @earning_rule.update(earning_rule_params)
        format.html { redirect_to root_path, notice: 'Earning rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @earning_rule }
      else
        format.html { render :edit }
        format.json { render json: @earning_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @earning_rule.destroy
    respond_to do |format|
      format.js { redirect_to root_path, notice: 'Earning rule was successfully destroyed.' }
      format.html { redirect_to earning_rules_url, notice: 'Earning rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_earning_rule
    @earning_rule = EarningRule.find(params[:id])
  end

  def earning_rule_params
    params.require(:earning_rule).permit(:name, :point, :status)
  end
end
