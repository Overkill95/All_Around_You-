class RecensionisController < ApplicationController
    before_action :logged_in_users, only: [:create, :destroy]
    before_action :userrecensione, only: :destroy
     def create
         @servizio=Servizi.find_by(id: params[:recensioni][:servizi_id])
         cuser=currentuser
         collection=cuser.recensionis.where("servizi_id=?", params[:recensioni][:servizi_id])
         if !(collection.empty?)
            recensione=collection.first
            votovecchio=recensione.votoservizio
            recensione.update_attributes(recensioni_params)
            vecchiamedia=@servizio.mediavoti
            votecount=@servizio.numvoti
            votonuovo=params[:recensioni][:votoservizio]
            sumvoti=(vecchiamedia*votecount)-votovecchio+votonuovo.to_i
            nuovamedia=sumvoti/votecount
            @servizio.update_attributes(:mediavoti => nuovamedia)
            redirect_to @servizio
         else
            @recensioni=Recensioni.new(recensioni_params)
            @recensioni.servizi=@servizio
            @recensioni.user=currentuser
            if @recensioni.save
               flash[:success] = "Recensione aggiunta"
               @servizio.increment!(:numvoti)
               votecount=@servizio.numvoti
               redirect_to root_url if votecount.nil?
               vecchiamedia=@servizio.mediavoti
               sumvoti=(vecchiamedia*(votecount-1))+params[:recensioni][:votoservizio].to_i
               nuovamedia=sumvoti/votecount
               @servizio.update_attributes(:mediavoti => nuovamedia)
               redirect_to @servizio
            else
               @feed_items = []
               render 'static_pages/home'
           end
         end
     end
    def destroy
        recensione=Recensioni.find(params[:id])
        recensione.destroy
        flash[:success] = "Recensione eliminata"
        redirect_to request.referrer || root_url
    end
    private
    def recensioni_params
        params.require(:recensioni).permit(:titolo, :content, :votoservizio, :servizi_id)
    end
    def userrecensione
      @recensione = currentuser.recensionis.find_by(id: params[:id])
      redirect_to root_url if @recensione.nil?
    end
end
