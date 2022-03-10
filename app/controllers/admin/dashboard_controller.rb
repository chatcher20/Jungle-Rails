class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  puts "ADMIN_USERNAME: "
  puts ENV["ADMIN_USERNAME"]

  def show
  end
end
