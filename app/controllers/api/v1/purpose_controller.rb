class Api::V1::PurposeController < Api::V1::BaseController
  before_action :set_purpose, only: [:show, :edit, :update, :destroy]

  def index
    @purposes = current_user.purposes.all.order(updated_at: :desc)
  end

  def show
  end

  def new
    @purpose = current_user.purposes.new
  end

  def create
    @purpose = current_user.purposes.new(purpose_params)

    respond_to do |format|
      if @purpose.save
        format.html { redirect_to api_v1_purpose_index_path, notice: "Purpose was successfully created." }
      else
        format.html { render action: :new }
        flash[:notice] = "title is not empty"
      end
    end
  end

  def edit
  end

  def update
    # binding.pry
    respond_to do |format|
      if @purpose.update(purpose_params)
        format.html { redirect_to api_v1_purpose_index_path, notice: "Purpose was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @purpose.destroy!
    respond_to do |format|
      format.html { redirect_to api_v1_purpose_index_path, notice: "Purpose was successfully destroyed." }
    end
  end

  private

    def set_purpose
      @purpose = Purpose.find(params[:id])
    end

    def purpose_params
      params.require(:purpose).permit(:title, :term, :time)
    end
end
