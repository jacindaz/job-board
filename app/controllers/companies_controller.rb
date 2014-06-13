class CompaniesController < ActionController::Base
  def index
    @companies = Company.all
  end

  def new
  end

  def create
  end

  def show
    @company = Company.find(params[:id])
    @all_jobs = Job.all

    @jobs = []
    @all_jobs.each do |job|
      if job.company_id == @company.id
        @jobs << job
      end
    end
    #binding.pry

  end

  def companies_params
  end

end
