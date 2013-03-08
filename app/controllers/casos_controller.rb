class CasosController < ApplicationController
  # GET /casos
  # GET /casos.json
  def index
    @grupo = Grupo.find(params[:grupo_id])
    @casos = @grupo.casos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casos }
    end
  end

  # GET /casos/1
  # GET /casos/1.json
  def show
    @grupo = Grupo.find(params[:grupo_id])
    @caso = Caso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caso }
    end
  end

  # GET /casos/new
  # GET /casos/new.json
  def new
    @grupo = Grupo.find(params[:grupo_id])
    @caso = @grupo.casos.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caso }
    end
  end

  # GET /casos/1/edit
  def edit
    @grupo = Grupo.find(params[:grupo_id])
    @caso = Caso.find(params[:id])
  end

  # POST /casos
  # POST /casos.json
  def create
    @grupo = Grupo.find(params[:grupo_id])
    @caso = @grupo.casos.build(params[:caso])

    respond_to do |format|
      if @caso.save
        current_user.add_role :relator, @caso
        format.html { redirect_to [@grupo,@caso], notice: 'Caso foi criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /casos/1
  # PUT /casos/1.json
  def update
    @grupo = Grupo.find(params[:grupo_id])
    @caso = Caso.find(params[:id])

    respond_to do |format|
      if @caso.update_attributes(params[:caso])
        format.html { redirect_to [@grupo, @caso], notice: 'Caso foi atualizado com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /casos/1
  # DELETE /casos/1.json
  def destroy
    @grupo = Grupo.find(params[:grupo_id])
    @caso = Caso.find(params[:id])
    @caso.destroy

    respond_to do |format|
      format.html { redirect_to grupo_casos_path(@grupo) }
    end
  end
end
