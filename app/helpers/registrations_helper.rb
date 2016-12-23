module RegistrationsHelper
  def welcome_message(role)
    if role == 'chef'
      "Welcome, Chef!"
    else
      "Welcome to Yes, Chef!"
    end
  end

  def welcome_tagline(role)
    if role == 'chef'
      "May your clients ever be satisfied"
    else
      "You clearly have a finer taste in life"
    end
  end
end
