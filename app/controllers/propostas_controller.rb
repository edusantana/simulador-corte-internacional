class PropostasController < ApplicationController
  # GET /propostas
  # GET /propostas.json
  def index
    @grupo = Grupo.find(params[:grupo_id])
    @propostas = @grupo.propostas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @propostas }
    end
  end

  # GET /propostas/1
  # GET /propostas/1.json
  def show
    @grupo = Grupo.find(params[:grupo_id])
    @proposta = Proposta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposta }
    end
  end

  # GET /propostas/new
  # GET /propostas/new.json
  def new
    @grupo = Grupo.find(params[:grupo_id])
    @proposta = @grupo.propostas.build
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposta }
    end
  end

  # GET /propostas/1/edit
  def edit
    @grupo = Grupo.find(params[:grupo_id])
    @proposta = Proposta.find(params[:id])
  end

  # POST /propostas
  # POST /propostas.json
  def create
    @grupo = Grupo.find(params[:grupo_id])
    @proposta = @grupo.propostas.build(params[:proposta])
    @proposta.propositor = current_user
    
    
    respond_to do |format|
      if @proposta.save
        format.html { redirect_to [@grupo, @proposta], notice: 'Proposta was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /propostas/1
  # PUT /propostas/1.json
  def update
    @grupo = Grupo.find(params[:grupo_id])
    @proposta = Proposta.find(params[:id])

    respond_to do |format|
      if @proposta.update_attributes(params[:proposta])
        format.html { redirect_to [@grupo, @proposta], notice: 'Proposta was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /propostas/1
  # DELETE /propostas/1.json
  def destroy
    @grupo = Grupo.find(params[:grupo_id])
    @proposta = Proposta.find(params[:id])
    authorize! :destroy, @proposta
    
    @proposta.destroy

    respond_to do |format|
      format.html { redirect_to grupo_propostas_path(@grupo) }
    end
  end
end
