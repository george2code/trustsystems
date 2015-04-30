class CompanyProfileController < ApplicationController
  layout 'dashboard'

  def information
  end

  def promotion
  end

  def guarantee
  end

  def facebook
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
end
