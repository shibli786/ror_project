class SubjectsController < ApplicationController
  def new
  	@subject =Subject.new
  end

  def show
  end

  def update1
  	#abort("called")
  	@subject = Subject.find(params[:id])
  	 if @subject.update_attributes(subject_params)
  		redirect_to(:action=>"show",:id=>@subject.id)
  	else
  		render("edit")
  	end
  end

  def delete
  end

  def edit
  	@subject= Subject.find(params[:id])

  end



  def index
  	@subjects = Subject.all
  	
  end

  def create
  	@subject =Subject.new(subject_params)

  	if @subject.save
  		redirect_to(:action =>"index")
  	else
  		render ("new")

  	
  	end
end
	
	private

	def subject_params
		params.require(:subject).permit(:name,:position,:visible)
	end


def update
	
end

end

