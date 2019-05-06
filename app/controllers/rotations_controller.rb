class RotationsController < ApplicationController
    before_action :set_rotation, only: [:show, :edit, :update, :destroy]
    
    # GET /rotations
    # GET /rotations.json
    def index
        @rotations = Rotation.all
    end
    
    # GET /rotations/1
    # GET /rotations/1.json
    def show
        @rotation = Rotation.find_by_id params[:id]
    end
    
    # GET /rotations/new
    def new
        @rotation = Rotation.new
    end
    
    # GET /rotations/1/edit
    def edit
        @rotation = Rotation.find_by_id params[:id]
    end
    
    # POST /rotations
    # POST /rotations.json
    def create
        @rotation = Rotation.new(rotation_params)

        if @rotation.save
            redirect_to @rotation, notice: 'Rotation was successfully created.'
        else
            render :new
        end
    end
    
    # PATCH/PUT /rotations/1
    # PATCH/PUT /rotations/1.json
    def update
        if @rotation.update(rotation_params)
            redirect_to @rotation, notice: 'Rotation was successfully updated.'
        else
            render :edit
        end
    end
    
    # DELETE /rotations/1
    # DELETE /rotations/1.json
    def destroy
        @rotation.destroy
        redirect_to rotations_url, notice: 'Rotation was successfully destroyed.'
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_rotation
        @rotation = Rotation.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def rotation_params
        params.require(:rotation).permit(:name, :require_min, :require_max)
    end
end
