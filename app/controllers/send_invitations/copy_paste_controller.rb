class SendInvitations::CopyPasteController < ApplicationController
  include Wicked::Wizard
  layout 'dashboard'
  steps :add, :send_from, :select_template, :done


  def show
    case step
      when :select_template
        @afs = Afs.find_by_user_id(current_user.id)
      when :done
        #clear session
        # not necessary to clear here... ?
        session.delete(:cp_invites)
        session.delete(:cp_sender)
        session.delete(:cp_reply)
    end
    render_wizard
  end


  def update
    case step
      when :add
        invite_strings = params[:invitation_customer][:invitations_data]
        if invite_strings.to_s.strip.length == 0
          flash[:alert] = "Empty string"
        else
            #save to session
            session[:cp_invites] = invite_strings.to_s.strip
            #next
            skip_step
        end


      when :send_from
        #save to session
        session[:cp_sender] = params[:invitation][:senderName]
        session[:cp_reply] = params[:invitation][:replyToEmail]
        skip_step


      when :select_template
        data  = CustomerService.invite(
            session[:cp_invites],
            session[:cp_sender],
            session[:cp_reply],
            current_user.id
        )

        json_data = JSON.parse(data)
        if json_data['state'] == 'notice'
          flash[:notice] = json_data['message']
          skip_step
        else
          flash[:error] = json_data['message']
        end
    end # end step

    render_wizard
  end
end