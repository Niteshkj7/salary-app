class SalaryAllotmentsController < ApplicationController
  before_action :set_salary_allotment, only: [:show, :edit, :update, :destroy]

  # GET /salary_allotments
  # GET /salary_allotments.json
  def index
    @salary_allotments = SalaryAllotment.all
  end

  # GET /salary_allotments/1
  # GET /salary_allotments/1.json
  def show
  end

  # GET /salary_allotments/new
  def new
    @salary_allotment = SalaryAllotment.new
  end

  # GET /salary_allotments/1/edit
  def edit
  end

  # POST /salary_allotments
  # POST /salary_allotments.json
  def create
    @salary_allotment = SalaryAllotment.new(salary_allotment_params)

    respond_to do |format|
      if @salary_allotment.save
        format.html { redirect_to @salary_allotment, notice: 'Salary allotment was successfully created.' }
        format.json { render :show, status: :created, location: @salary_allotment }
      else
        format.html { render :new }
        format.json { render json: @salary_allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salary_allotments/1
  # PATCH/PUT /salary_allotments/1.json
  def update
    respond_to do |format|
      if @salary_allotment.update(salary_allotment_params)
        format.html { redirect_to @salary_allotment, notice: 'Salary allotment was successfully updated.' }
        format.json { render :show, status: :ok, location: @salary_allotment }
      else
        format.html { render :edit }
        format.json { render json: @salary_allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_allotments/1
  # DELETE /salary_allotments/1.json
  def destroy
    @salary_allotment.destroy
    respond_to do |format|
      format.html { redirect_to salary_allotments_url, notice: 'Salary allotment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_allotment
      @salary_allotment = SalaryAllotment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salary_allotment_params
      params.require(:salary_allotment).permit(:basic, :hra, :da, :income_tax, :state_tax, :employee_id)
    end
end
