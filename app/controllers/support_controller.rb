class SupportController < ApplicationController
  def index
    @message = SupportMessage.new
  end

  def create
    @message = SupportMessage.new(params[:support_message])
    if @message.valid?
      puts "Delivering message"
      SupportMailer.new_message(@message).deliver
      puts "Delivered message?"
      redirect_to(support_index_path, :notice => "Your message was sent successfully.")
    else
      flash.now.alert = "Please fill in all the fields correctly"
      render :index
    end
  end
end
