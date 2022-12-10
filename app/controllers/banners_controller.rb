class BannersController < ApplicationController
  before_action :admin_only
  before_action :set_banner, only: [ :show, :edit, :update, :destroy ]

  def index
    @banners = Banner.active
  end

  def new
    @banner = Banner.new
  end

  def edit
  end

  def show
  end

  def create
    @banner = Banner.new(banner_params)

    respond_to do |format|
      format.html {
        if @banner.save
          redirect_to banners_path, flash: { success: "New banner created" }
        else
          render action: 'new'
        end
      }
    end
  end

  def update
    if @banner.update( banner_params )
      redirect_to banners_path, flash: { success: 'Banner was successfully updated' }
    else
      render action: 'edit'
    end
  end

  def destroy
    respond_to do |format|
      if @banner.update(:active => false)
        format.json { head :no_content }
      end
    end
  end

  private

    def set_banner
      @banner = Banner.find params[:id]
    end

    def admin_only
      redirect_to dashboard_path unless account_signed_in? && current_account.is_admin == true
    end

    def banner_params
      params.require(:banner).permit( :title, :image, :url, :position, :start_time, :end_time )
    end
end
