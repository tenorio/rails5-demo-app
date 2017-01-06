class ProdutoTiposController < ApplicationController
  before_action :set_produto_tipo, only: [:show, :edit, :update, :destroy]

  # GET /produto_tipos
  # GET /produto_tipos.json
  def index
    @produto_tipos = ProdutoTipo.all
  end

  # GET /produto_tipos/1
  # GET /produto_tipos/1.json
  def show
  end

  # GET /produto_tipos/new
  def new
    @produto_tipo = ProdutoTipo.new
  end

  # GET /produto_tipos/1/edit
  def edit
  end

  # POST /produto_tipos
  # POST /produto_tipos.json
  def create
    @produto_tipo = ProdutoTipo.new(produto_tipo_params)

    respond_to do |format|
      if @produto_tipo.save
        format.html { redirect_to @produto_tipo, notice: 'Produto tipo was successfully created.' }
        format.json { render :show, status: :created, location: @produto_tipo }
      else
        format.html { render :new }
        format.json { render json: @produto_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produto_tipos/1
  # PATCH/PUT /produto_tipos/1.json
  def update
    respond_to do |format|
      if @produto_tipo.update(produto_tipo_params)
        format.html { redirect_to @produto_tipo, notice: 'Produto tipo was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto_tipo }
      else
        format.html { render :edit }
        format.json { render json: @produto_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produto_tipos/1
  # DELETE /produto_tipos/1.json
  def destroy
    @produto_tipo.destroy
    respond_to do |format|
      format.html { redirect_to produto_tipos_url, notice: 'Produto tipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto_tipo
      @produto_tipo = ProdutoTipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_tipo_params
      params.require(:produto_tipo).permit(:nome, :descricao)
    end
end
