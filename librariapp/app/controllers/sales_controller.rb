class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sale.customer = Customer.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    customer = Customer.new(customer_params)
    @sale.fecha = Time.new #ponemos la fecha del sistema
    #al recibir los datos, comprobar si existe el cliente, entonces se pueden actualizar sus datos

    # si no existe el cliente, registrar uno nuevo
    if @sale.customer_id.nil?
      @sale.customer = customer
    else
      @sale.customer.nombreCliente = customer.nombreCliente ##si el cliente ya existe, se actualiza al nuevo valor recibido
      @sale.customer.direccion = customer.direccion
      @sale.customer.telefono = customer.telefono
      @sale.customer.correo = customer.correo
      @sale.customer.facebook = customer.facebook
      @sale.customer.linkedln = customer.linkedln
      @sale.customer.RFC = customer.RFC
    end

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:customer_id, :fecha, :importe)
    end

    def customer_params
      params.require(:customer).permit(:nombreCliente, :telefono, :direccion, :RFC, :correo, :facebook, :linkedln)
    end
end
