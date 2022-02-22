class PresenceController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  before_action :set_user
  before_action :set_presence, only: [:destroy]

  def show
    @event = Event.find(params[:id])
  end

  # POST / presence
  def create
    @presence = Presence.new(presence_params)
    if @presence.save
      flash[:success] = "Votre participation sera notifiée à l'organisateur"
    else
      flash[:warning] = "Votre participation n'a pas pu être sauvegardée. Contacter l'organisateur pour plus d'informations."
    end
      
    redirect_back(fallback_location: presence_path)
  end

  # DELETE /presence/1
  def destroy
    @presence.destroy
    flash[:danger] = 'Votre participation a été annulée'
    redirect_back(fallback_location: presence_path)
  end

  private
    def set_presence
      @presence = Presence.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def presence_params
      params.require(:presence).permit(:event_id, :user_id)
    end

end