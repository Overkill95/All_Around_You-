class VotiservizisController < ApplicationController
    def create
        cuser=currentuser
        collection=cuser.votiservizis.where("servizi_id=?", params[:servizi_id])
        servizio=Servizi.find_by(id: params[:servizi_id])
        if !(collection.empty?)
            voto=collection.first
            voto.update_attributes(voto: params[:voto])
            redirect_to servizio
        else
           @voto=Votiservizi.new
           paramvoto=params[:voto].to_i
           votos=(paramvoto.zero?) ? false : true
           @voto.servizi=servizio
           @voto.user=cuser
           @voto.voto=votos
           if @voto.save
              flash[:success] = "Voto inserito con successo"
              redirect_to servizio
           else
               flash[:alert] = "Voto non inserito, errore"
               render 'static_pages/home'
           end
        end
   end
end
