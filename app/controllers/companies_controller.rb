class CompaniesController < ActionController::Base
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to '/companies'
    else
      flash[:notice] = "Uh oh! Your company could not be saved."
      redirect_to '/companies'
    end
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

  def company_params
    params.require(:company).permit(:name, :description, :industry, :location)
  end

end
