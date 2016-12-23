class UserMailer < ApplicationMailer
  default from: "backofhouse@yeschef.com"

  def welcome_customer(customer)
    @title = "Welcome to Yes, Chef!"
    @customer = @customer
    @chef = @customer.chef
    mail(to: @customer.email, subject: "Welcome to Yes, Chef!")
  end

  def welcome_chef(chef)
    @title = "Welcome to Yes, Chef!"
    @chef = chef
    mail(to: @chef.email, subject: "Welcome to Yes, Chef!")
  end

  def invite(chef_id, email, name = nil)
    @title= "You've Been Invited to Yes, Chef!"
    @chef = User.find_by(id: chef_id, role: 'chef')
    @name = name
    mail(to: email, subject: "Your chef has invited you to join us!")
  end
end
