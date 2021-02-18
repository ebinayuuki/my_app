class ReservationsController < ApplicationController
  # before_action :set_group

  def index
    @reservation = Reservation.find_by(params[:id])
  end

  def create
    # @reservation =
    # byebug
    Reservation.create(user_id: current_user.id, hospital_id: params[:hospital_id])
    # Reservation.create(reservation_params)
    redirect_to hospitals_path
  end

  def destroy
    # binding.pry
    reservation = Reservation.find_by(params[:hospital_id], params[:id])

    reservation.destroy
    redirect_to hospitals_path
  end

  # def set_group
  # @hospital = Hospital.find(params[:group_id])
  # end
  # def reservation_params
  # params.permit(user_id: current_user.id, hospital_id: params[:hospital_id] )
  # end
end

# .require(:reservation)
