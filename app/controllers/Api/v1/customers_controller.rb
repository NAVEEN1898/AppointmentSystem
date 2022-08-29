# frozen_string_literal: true

module Api 
  module V1
    class CustomersController < ApplicationController
      before_action :authentication
      def index
        @users = User.where(user_type: 'counsellar')
        render json: @users, status:200
      end

      def create
        @appointment = Appointment.new(appointment_params)
        @appointment.save
        render json: @appointment, status: 201 
      end

      def check_availability
         @appointment = Appointment.new
         @appointment.availability(params[:st],params[:et])
      end

      def search
        @users = User.all.where('name LIKE :search', search: "%#{params[:search]}%")
        render json: @users
      end

      def create_feedback
        @feedback = Feedback.new(create_feedback_params)
        @feedback.save 
        render json: @feedback, status: 200
      end

      private

      def appointment_params
        params.require(:appointment).permit(:counsellar_id, :customer_id, :appointment_date)
      end

      def create_feedback_params
        params.require(:feedback).permit(:counsellar_id, :customer_id, :description)
      end
    end
  end
end