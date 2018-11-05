class VotiDsController < ApplicationController
    def create
        cuser=currentuser
        collection=cuser.voti_ds.where("domande_id=?", params[:domanda_id])
        domanda=Domande.find_by(id: params[:domanda_id])
        if !(collection.empty?)
            voto=collection.first
            voto.update_attributes(voto: params[:voto])
            redirect_to domanda.servizi
        else
           @voto=VotiD.new
           paramvoto=params[:voto].to_i
           votod=(paramvoto.zero?) ? false : true
           @voto.domande=domanda
           @voto.user=cuser
           @voto.voto=votod
           if @voto.save
              flash[:success] = "Voto inserito con successo"
              redirect_to domanda.servizi
           else
               flash[:alert] = "Voto non inserito, errore"
               render 'static_pages/home'
           end
        end
    end
end
