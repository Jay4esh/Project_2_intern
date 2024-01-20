class BusinesspartnersController < ApplicationController
  before_action :set_businesspartner, only: %i[ show edit update destroy ]

  # GET /businesspartners or /businesspartners.json
  def index
  @q = Businesspartner.ransack(params[:q])
  @businesspartners = @q.result(distinct: true)
end

  # GET /businesspartners/1 or /businesspartners/1.json
  def show
    @businesspartners = Businesspartner.find(params[:id])
  end

  # GET /businesspartners/new
  def new
    @businesspartner = Businesspartner.new
  end

  # GET /businesspartners/1/edit
  def edit
    # authorize! :edit, @businesspartner
  end

  # POST /businesspartners or /businesspartners.json
  def create
    @businesspartner = Businesspartner.new(businesspartner_params)

    respond_to do |format|
      if @businesspartner.save
        format.html { redirect_to businesspartner_url(@businesspartner), notice: "Businesspartner was successfully created." }
        format.json { render :show, status: :created, location: @businesspartner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @businesspartner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesspartners/1 or /businesspartners/1.json
  def update
    # authorize! :update, @businesspartner
    respond_to do |format|
      if @businesspartner.update(businesspartner_params)
        format.html { redirect_to businesspartner_url(@businesspartner), notice: "Businesspartner was successfully updated." }
        format.json { render :show, status: :ok, location: @businesspartner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @businesspartner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesspartners/1 or /businesspartners/1.json
  def destroy
    @businesspartner.destroy!

    respond_to do |format|
      format.html { redirect_to businesspartners_url, notice: "Businesspartner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_businesspartner
      @businesspartner = Businesspartner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def businesspartner_params
      params.require(:businesspartner).permit(:customer_code, :customer_name, :corporate_number, :invoice_number, :postal_code, :address, :telephone_number)
    end
end
