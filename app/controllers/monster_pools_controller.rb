class MonsterPoolsController < ApplicationController
  before_action :ensure_json_request
  before_action :set_monster_pool, only: [:show, :edit, :update, :destroy]

  # GET /monster_pools
  # GET /monster_pools.json
  def index
    @monster_pools = MonsterPool.all
  end

  # GET /monster_pools/1
  # GET /monster_pools/1.json
  def show
  end

  # GET /monster_pools/new
  def new
    @monster_pool = MonsterPool.new
  end

  # GET /monster_pools/1/edit
  def edit
  end

  # POST /monster_pools
  # POST /monster_pools.json
  def create
    @monster_pool = MonsterPool.new(monster_pool_params)

    respond_to do |format|
      if @monster_pool.save
        format.html { redirect_to @monster_pool, notice: 'Monster pool was successfully created.' }
        format.json { render :show, status: :created, location: @monster_pool }
      else
        format.html { render :new }
        format.json { render json: @monster_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_pools/1
  # PATCH/PUT /monster_pools/1.json
  def update
    respond_to do |format|
      if @monster_pool.update(monster_pool_params)
        format.html { redirect_to @monster_pool, notice: 'Monster pool was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_pool }
      else
        format.html { render :edit }
        format.json { render json: @monster_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_pools/1
  # DELETE /monster_pools/1.json
  def destroy
    @monster_pool.destroy
    respond_to do |format|
      format.html { redirect_to monster_pools_url, notice: 'Monster pool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_pool
      @monster_pool = MonsterPool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_pool_params
      params.fetch(:monster_pool, {})
    end
end
