class UserController < ApplicationController




def index



end
def hello

	@id=params[:id].to_i
	@page=params[:page].to_i
	
end


end
