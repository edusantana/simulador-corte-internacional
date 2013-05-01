class SimulacoesController < ApplicationController
  
  def show
    @simulacao = Simulacao.find(params[:id])
    @proposta = @simulacao.proposta
    @caso = @simulacao.caso

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposta }
    end
  end

  def upload_peticao
    @simulacao = Simulacao.find(params[:id])
    caso = @simulacao.caso
    caso.peticao = params[:peticao]
    
    if (caso.estado == Caso::ESTADO[:aguardando_peticao] and caso.peticao? and caso.provas?)
      caso.estado = Caso::ESTADO[:exame_preliminar]
    end
    
    caso.save!
    respond_to do |format|
      format.html { redirect_to [@simulacao] }
    end
  end

  def upload_provas
    @simulacao = Simulacao.find(params[:id])
    caso = @simulacao.caso
    caso.provas = params[:provas]
    
    if (caso.estado == Caso::ESTADO[:aguardando_peticao] and caso.peticao? and caso.provas?)
      caso.estado = Caso::ESTADO[:exame_preliminar]
    end
    
    caso.save!
    respond_to do |format|
      format.html { redirect_to [@simulacao] }
    end
  end

  
end
