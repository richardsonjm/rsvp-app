class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]
  before_filter :get_event

  def get_event
    @event = Event.find(params[:event_id])
  end

  # GET /invites
  # GET /invites.json
  def index
    # @tweets = @zombie.tweets
    @invites = @event.invites
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    @invite = @event.invites.find(params[:id])
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = @event.invites.new(invite_params)

    respond_to do |format|
      if @invite.save
        format.html { redirect_to [@event, @invite], notice: 'Invite was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@event, @invite] }
      else
        format.html { render action: 'new' }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to event_invites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:name, :event_id)
    end
end
