module Admin
  class DashboardController < BaseController
    def index
      @users = User.all.order(:created_at)
    end
  end
end
