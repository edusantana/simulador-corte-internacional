class TurmasController < ApplicationController
  # GET /turmas
  # GET /turmas.json
  def index
    @grupo = Grupo.find(params[:grupo_id])
    @turmas = @grupo.turmas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @turmas }
    end
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
    @grupo = Grupo.find(params[:grupo_id])
    @turma = Turma.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @turma }
    end
  end

  # GET /turmas/new
  # GET /turmas/new.json
  def new
    @grupo = Grupo.find(params[:grupo_id])
    #segurança
    @turma = @grupo.turmas.build
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @turma }
    end
  end

  # GET /turmas/1/edit
  def edit
    @grupo = Grupo.find(params[:grupo_id])
    @turma = Turma.find(params[:id])
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @grupo = Grupo.find(params[:grupo_id])
    @turma = @grupo.turmas.build(params[:turma])
    
    
    respond_to do |format|
      if @turma.save
        format.html { redirect_to [@grupo,@turma], notice: 'Turma foi criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /turmas/1
  # PUT /turmas/1.json
  def update
    @turma = Turma.find(params[:id])

    respond_to do |format|
      if @turma.update_attributes(params[:turma])
        format.html { redirect_to @turma, notice: 'Turma was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    @grupo = Grupo.find(params[:grupo_id])
    @turma = Turma.find(params[:id])
    @turma.destroy

    respond_to do |format|
      format.html { redirect_to grupo_turmas_path(@grupo) }
      
    end
  end
end
