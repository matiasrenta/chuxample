class Notificator
  def self.send(sender, recipients, body, subject = nil)
      sender.send_message(recipients, body, subject || default_subject)
  end

  def self.make_body_for_crud_actions(user, action, entity, view_context)
    url = eval "view_context.#{entity.class.name.underscore}_path(entity)"
    "#{user.name} #{action} #{I18n.t("activerecord.models.#{entity.class.name.underscore}.one")} #{view_context.link_to(entity.name, url, class: 'display-normal')}"
  end

  def self.default_subject
    '<em class="badge padding-5 no-border-radius bg-color-blue pull-left margin-right-5"><i class="fa fa-cube fa-fw fa-1x"></i></em>'
  end

  def self.recipients_from_body(body)
    user_ids = []
    body.split('](').each_with_index do |string, index|
      user_ids << string.partition(')').first if index > 0
    end
    User.where(id: user_ids)
  end
end