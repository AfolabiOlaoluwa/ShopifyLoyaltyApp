# frozen_string_literal: true

class EarningRulesController < AuthenticatedController#ApplicationController
  include StrictQueries::Concern

  before_action :set_earning_rule, only: %i[show edit update destroy]
  before_action :current_shop, only: %i[new]
  before_action :authenticate_user!

  def index
    @earning_rules = current_user.earning_rules.load
  end

  def show; end

  def new
    @earning_rule = current_user.earning_rules.new
  end

  def edit; end

  def create
    @earning_rule = current_user.earning_rules.new(earning_rule_params)
    @earning_rule.shop = current_shop

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

  def current_shop
    Shop.find_by(shopify_domain: cookies[:shopify_domain])
  end

  def set_earning_rule
    @earning_rule = EarningRule.find(params[:id])
  end

  def earning_rule_params
    params.require(:earning_rule).permit(:user_id, :shop_id, :name, :point, :status)
  end
end
