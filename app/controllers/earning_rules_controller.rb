class EarningRulesController < ApplicationController
  before_action :set_earning_rule, only: [:show, :edit, :update, :destroy]

  # GET /earning_rules
  # GET /earning_rules.json
  def index
    @earning_rules = EarningRule.all
  end

  # GET /earning_rules/1
  # GET /earning_rules/1.json
  def show
  end

  # GET /earning_rules/new
  def new
    @earning_rule = EarningRule.new
  end

  # GET /earning_rules/1/edit
  def edit
  end

  # POST /earning_rules
  # POST /earning_rules.json
  def create
    @earning_rule = EarningRule.new(earning_rule_params)

    respond_to do |format|
      if @earning_rule.save
        format.html { redirect_to @earning_rule, notice: 'Earning rule was successfully created.' }
        format.json { render :show, status: :created, location: @earning_rule }
      else
        format.html { render :new }
        format.json { render json: @earning_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /earning_rules/1
  # PATCH/PUT /earning_rules/1.json
  def update
    respond_to do |format|
      if @earning_rule.update(earning_rule_params)
        format.html { redirect_to @earning_rule, notice: 'Earning rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @earning_rule }
      else
        format.html { render :edit }
        format.json { render json: @earning_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earning_rules/1
  # DELETE /earning_rules/1.json
  def destroy
    @earning_rule.destroy
    respond_to do |format|
      format.html { redirect_to earning_rules_url, notice: 'Earning rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_earning_rule
      @earning_rule = EarningRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def earning_rule_params
      params.require(:earning_rule).permit(:name, :point, :status)
    end
end
