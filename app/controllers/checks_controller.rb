class ChecksController < ApplicationController
  def show
    begin
      ActiveRecord::Base.connection.execute("SELECT 1")
      render plain: "OK", status: :ok
    rescue => e
      render plain: "Database connection error: #{e.message}", status: :internal_server_error
    end
  end
end
