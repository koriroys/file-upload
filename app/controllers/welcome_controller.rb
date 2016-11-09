class WelcomeController < ApplicationController
  class NameError < StandardError; end

  def index

  end

  def upload
    file = params[:file]
    workbook = RubyXL::Parser.parse(file.path)
    worksheet = workbook.first
    rows = worksheet.map { |row| row.cells.map(&:value) }
    headers = rows.shift
    @users = []
    @rejections = []
    rows.each { |first_name, last_name, email|
      next unless first_name || last_name || email
      begin
        raise NameError, "name too short" if first_name.length < 3 || last_name.length < 3
        user = User.new(first_name: first_name, last_name: last_name, email: email)
        if user.save!
          @users << user
        end
      rescue ActiveRecord::RecordInvalid => e
        @rejections << Rejection.create({ first_name: first_name, last_name: last_name, email: email, reason: e.message })
      rescue NameError => e
        @rejections << Rejection.create({ first_name: first_name, last_name: last_name, email: email, reason: e.message })
      end
    }
  end

  def totals
    @users = User.all
    @rejections = Rejection.all
  end
end
