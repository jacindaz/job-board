class CompaniesController < ActionController::Base
  def index
    @companies = Company.all
  end

  def new
  end

  def create
  end

  def show
  end

  def companies_params
  end

end
