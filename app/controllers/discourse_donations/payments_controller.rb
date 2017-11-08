module DiscourseDonations
  class PaymentsController < ApplicationController
    def index
      render html: {}
    end

    def show
      return redirect_to path('/login') if SiteSetting.login_required? && current_user.nil?

      @about = About.new
      respond_to do |format|
        format.html do
          render :index
        end
        format.json do
          render_serialized(@about, AboutSerializer)
        end
      end
    end
  end
end
