class VotiRsController < ApplicationController
    def create
        cuser=currentuser
        collection=cuser.voti_rs.where("risposte_id=?", params[:risposta_id])
        risposta=Risposte.find_by(id: params[:risposta_id])
        if !(collection.empty?)
            voto=collection.first
            voto.update_attributes(voto: params[:voto])
            redirect_to risposta.domande.servizi
        else
           @voto=VotiR.new
           paramvoto=params[:voto].to_i
           votor=(paramvoto.zero?) ? false : true
           @voto.risposte=risposta
           @voto.user=cuser
           @voto.voto=votor
           if @voto.save
              flash[:success] = "Voto inserito con successo"
              redirect_to risposta.domande.servizi
           else
               flash[:alert] = "Voto non inserito, errore"
               render 'static_pages/home'
           end
        end
    end
end
