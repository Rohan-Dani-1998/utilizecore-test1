class ReportsController < ApplicationController
    before_action :user_admin

    def index
        respond_to do |format|
            format.html
        end
    end

    def download_report
        send_file "#{Rails.root}/public/courier_details.csv", type: "application/csv", x_sendfile: true
    end

    private

    def user_admin
        redirect_to parcels_path unless current_user.admin?
    end
  end
  