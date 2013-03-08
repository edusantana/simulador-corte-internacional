class GruposController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]

  
  # GET /grupos
  # GET /grupos.json
  def index
    @grupos = Grupo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grupos }
    end
  end

  # GET /grupos/1
  # GET /grupos/1.json
  def show
    @grupo = Grupo.find(params[:id])
    authorize! :show, @grupo

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grupo }
    end
  end

  # GET /grupos/new
  # GET /grupos/new.json
  def new
    @grupo = Grupo.new
    authorize! :create, @grupo

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grupo }
    end
  end

  # GET /grupos/1/edit
  def edit
    @grupo = Grupo.find(params[:id])
    authorize! :edit, @grupo
  end

  # POST /grupos
  # POST /grupos.json
  def create
    @grupo = Grupo.new(params[:grupo])
    authorize! :create, @grupo

    respond_to do |format|
      if @grupo.save
        current_user.add_role :owner, @grupo
        
        format.html { redirect_to grupo_path(@grupo), notice: 'Grupo was successfully created.' }
        format.json { render json: @grupo, status: :created, location: @grupo }
      else
        format.html { render action: "new" }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grupos/1
  # PUT /grupos/1.json
  def update
    @grupo = Grupo.find(params[:id])
    authorize! :edit, @grupo

    respond_to do |format|
      if @grupo.update_attributes(params[:grupo])
        format.html { redirect_to @grupo, notice: 'Grupo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    @grupo = Grupo.find(params[:id])
    authorize! :destroy, @grupo
    
    @grupo.destroy

    respond_to do |format|
      format.html { redirect_to grupos_url }
      format.json { head :no_content }
    end
  end
  
  def participar
    #solicitar_participacao
    @grupo = Grupo.find(params[:id])
    authorize! :solicitar_participacao, @grupo
    
    @grupo.add_solicitacao_participacao(current_user)

    respond_to do |format|
      
      format.html { redirect_to grupos_url, notice: t('participacao.pedido.enviado') }
      format.json { head :no_content }
    end
    
  end
  
  def aprovar
    @grupo = Grupo.find(params[:id])
    authorize! :manage_participacao, @grupo
    @user = User.find(params[:user_id])
    
    @grupo.aprovar_participacao(@user)

    respond_to do |format|      
      format.html { redirect_to @grupo, notice: t('participacao.aprovada') }
      format.json { head :no_content }
    end
    
  end
  
  def reprovar
    @grupo = Grupo.find(params[:id])
    authorize! :manage_participacao, @grupo
    @user = User.find(params[:user_id])
    
    @grupo.reprovar_participacao(@user)

    respond_to do |format|      
      format.html { redirect_to @grupo, notice: t('participacao.reprovada') }
      format.json { head :no_content }
    end
    
  end
  
end
