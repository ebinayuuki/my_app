class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.page(params[:page]).per(10).order(created_at: :desc)

    @reservations = Reservation.all
  end

  def new
    @hospital = Hospital.new
  end

  def create
    Hospital.create(hospital_save)
  end

  def top
  end

  def show
    @hospital = Hospital.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  private

  def hospital_save
    params.require(:hospital).permit(:name, :department, :postal, :ken_id, :info, :time,
                                     :image).merge(doctor_id: current_doctor.id)
  end
end
