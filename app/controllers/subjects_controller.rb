class SubjectsController < ApplicationController



  def edit
		
  	@subject= Subject.find(params[:id])
 	@subjects_count=Subject.count

  end




  def index
  	@subjects = Subject.all
  	
  end 



  def new
  	@subject =Subject.new
  	@subjects_count=Subject.count
  end



  def show
   @subject= Subject.find(params[:id])
  end



  def update
  	# abort("called")
  	@subject = Subject.find(params[:id])
  	 if @subject.update_attributes(subject_params)
  	 	flash[:success] = 'updated successfully'

  		redirect_to(:action=>"show",:id=>@subject.id)
  	else
  		render("edit")
  	end
  end


  def delete
  	@subject =Subject.find(params[:id])
  end



  def destroy
  	@subject =Subject.find(params[:id])
  	sub=@subject
  	abc=@subject.destroy()
  	puts abc
  	if abc
  		flash[:success]="Subject destroyed '#{sub.name}' successFully"
  		redirect_to(:action=>"index",:id=>@subject.id)
  	else
  		flash[:danger]="unable to Delete '#{sub.name}' "
  		render("index")
    end

  end


  def create
  	@subject =Subject.new(subject_params)

  	if @subject.save
  		flash[:success]="Subject Created successfully"
  		redirect_to(:action =>"index")

  	else
  		render ("new")
  	end
  	
  end

	
    private

	def subject_params
		params.require(:subject).permit(:created_at,:name,:position,:visible)
	end


end


