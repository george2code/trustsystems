class DashboardController < ApplicationController
  layout 'dashboard'

  def index
    # @afs = Afs.new(afs_params)
  end


  def modules
  end


  def reviews
    @reviews = Review.limit(4).order('RANDOM()')
  end


  def statistics
  end


  #modules
  def email_template
    #trying to get afs by user id
    @afs = Afs.find_by_user_id(current_user.id)

    if request.post?
      #handle posts
      unless @afs.nil?
        @afs.email_delay = afs_params[:email_delay]
        @afs.email_subject = afs_params[:email_subject]
        @afs.email_template_text = afs_params[:email_template_text]
      else
        @afs = Afs.new(afs_params)
        @afs.user_id = current_user.id
      end

      #TODO: save template id ?

      if @afs.save
        flash[:notice] = 'Email шаблон был сохранен успешно!'
        redirect_to modules_path
      else
        render :action => :email_template
      end

    else
      #handle get

      if @afs.nil?
        @afs = Afs.new
      end
    end
  end


  #Ajax GET
  def update_template
    language_id = params[:languageId]
    email_template = EmailTemplate.find_by_language(language_id)
    unless email_template.nil?
      render :html => email_template.template.html_safe
    end
  end


  def categories
  end


  def user_management
  end


  #settings
  def notifications
  end


  def settings
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def afs_params
    params.require(:afs).permit(:email_delay, :email_subject, :email_template_text, :review_full)
  end
end