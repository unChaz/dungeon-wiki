class Api::CampaignsController < ApplicationController
  before_action :ensure_json_request
  before_action :ensure_current_user
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns.json
  def index
    @campaigns = Campaign.where(user_id: current_user.id) || []
  end

  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new(user_id: current_user.id)
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @campaign.save
        format.json { render :show, status: :created, location: @campaign }
      else
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.find_by(id: params[:id], user_id: current_user.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def campaign_params
    params.permit(:name)
  end

  def campaign_url campaign
    api_campaign_url(campaign)
  end
end
