class StatesController < ApplicationController

def update
  @state = State.find(params[:id])
  if @state.read == true
    @inner_html = "read"
    @state.read = false
  else
    @inner_html = "unread"
    @state.read = true
  end

  @state.save

  respond_to do |format|
    format.html { redirect_to root_path }
    format.js
  end
end

end
