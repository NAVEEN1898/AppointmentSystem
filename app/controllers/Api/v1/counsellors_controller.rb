module Api
  module V1
    class CounsellorsController < ApplicationController
      before_action :authentication

      def create
        @service = Service.new(service_params)
        @service.save
        render json: @service, status: 201
      end

      def update
        @appointment = Appointment.find(params[:appointment][:id])
        @appointment.update(advice: params[:advice])
        render json: @appointment, status: 200
      end

      private

      def service_params
        params.require(:service).permit(:service_name, :user_id, :time)
      end
    end
  end
end
