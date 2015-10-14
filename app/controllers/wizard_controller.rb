class WizardController < ApplicationController
  include Wicked::Wizard

  steps :step1, :step2, :step3

  def show
    #@user = current_user
    case step
      when :step1
        puts "in step1"
      when :step2
        puts "in step2"
      when :step3
        puts "in step3"
    end
    render_wizard
  end
end
