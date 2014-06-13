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
      redirect_to "/companies/#{@company.id}"
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
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_params
    else
      render 'edit'
    end
  end

  def company_params
    params.require(:company).permit(:name, :description, :industry, :location)
  end

end
