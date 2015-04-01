class SendInvitations::CopyPasteController < ApplicationController
  include Wicked::Wizard
  layout 'dashboard'

  steps :add, :send_from, :select_template, :done


  def is_a_valid_email?(email)
    (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end


  def show
    case step
      when :select_template
        @afs = Afs.find_by_user_id(current_user.id)
      when :done
        #clear session
        session.delete(:cp_invites)
        session.delete(:cp_sender)
        session.delete(:cp_reply)
    end
    render_wizard
  end


  def update

    case step
      when :add
        inviteStrings = params[:invitation_customer][:invitations_data]

        if inviteStrings.to_s.strip.length == 0
          flash[:alert] = "Empty string"
        else
            #save to session
            session[:cp_invites] = inviteStrings.to_s.strip
            #next
            skip_step
        end


        when :send_from
          session[:cp_sender] = params[:invitation][:senderName]
          session[:cp_reply] = params[:invitation][:replyToEmail]
          skip_step


      when :select_template
        invite_strings = session[:cp_invites]
        invite_array = Array.new

        #counters
        duplicate_emails = 0
        row_errors = 0

        #split rows
        invite_rows = invite_strings.split("\n")
        invite_rows.each do |row|
          items = row.split(',')

          #0 - validate email, not empty
          #1 - not empty
          #2 - not empty
          if items.length == 3 && items[0].strip.length > 0 && is_a_valid_email?(items[0])
            items[1].strip.length > 0 && items[2].strip.length > 0
            # check for existed email
            if InvitationCustomers.exists?(email: items[0])
              # email already in database, skip this record
              duplicate_emails += 1
            else
              # add to array
              holder = InviteHolder.new(items[0].strip, items[1].strip, items[2].strip)
              invite_array.push(holder)
            end
          else
            # Row error
            row_errors += 1
          end
        end # iterate invite rows


        if invite_array.empty?
          flash[:error] = 'Неправильно заполнена информация'
        else
          #update database
          invitation = Invitation.new
          invitation.user_id = current_user.id   #current user
          invitation.senderName = session[:cp_sender]
          invitation.replyToEmail = session[:cp_reply]
          invitation.save

          invite_array.each do |invite|
            invitation_object = InvitationCustomers.new
            invitation_object.email = invite.email
            invitation_object.name = invite.name
            invitation_object.orderId = invite.orderId
            invitation_object.invitation_id = invitation.id
            invitation_object.state = InvitationState::QUEUED
            invitation_object.save
          end

          #final message
          flash[:notice] = "Адреса обработаны успешно. Повторяющихся email-адресов: #{duplicate_emails}, ошибок чтения строк: #{row_errors}"
          skip_step
        end


    end # end step




    render_wizard
  end
end