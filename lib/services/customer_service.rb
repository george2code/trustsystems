class CustomerService

  attr_accessor :flash_error, :flash_notice


  def self.is_a_valid_email?(email)
    (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end


  def self.invite(invite_strings, sender_name, reply_to, user_id)
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
      return {
          'state' => 'error',
          'message' => "Неправильно заполнена информация"
      }.to_json
    else
      #update database
      invitation = Invitation.new
      invitation.user_id = user_id   #current user
      invitation.senderName = sender_name
      invitation.replyToEmail = reply_to
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
      return {
          'state' => 'notice',
          'message' => "Адреса обработаны успешно. Повторяющихся email-адресов: #{duplicate_emails}, ошибок чтения строк: #{row_errors}"
      }.to_json
      # skip_step
    end
  end

end