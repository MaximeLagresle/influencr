class StatesController < ApplicationController

def update
  @state = State.find(params[:id])
  if @state.read == true
    @new_class = "gray"
    @state.read = false
  else
    @new_class = "blue"
    @state.read = true
  end

  @state.save

  respond_to do |format|
    format.html { redirect_to root_path }
    format.js
  end
end

end
