class V1::QuickPicksController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find_by(email:  params[:user_email])
        @quick_picks = @user.quick_picks
        if @user
            render :index
        else
            render json: {errors: ['Error in quick picks create action']}
        end
    end

    def create
        @quick_pick = QuickPick.new(quick_picks_params)
        if @quick_pick.save
            render :create
        else
            render json: {errors: @quick_pick.errors.full_messages}
        end
    end

    def update
        @quick_pick = QuickPick.find_by(id: params[:id])
        if @quick_pick.update(quick_picks_params)
            render :update
        else
            render json: {errors: @quick_pick.errors.full_messages}
        end
    end

    def destroy
        quick_pick = QuickPick.find_by(id: params[:id])
        if quick_pick
            quick_pick.destroy
        else
            head(:unauthorized)
        end
    end

    private
    def quick_picks_params
        params.require(:quick_picks).permit(:user_id, :station, :rail_line, :direction, :alias)
    end
end
