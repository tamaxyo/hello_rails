# -*- coding: utf-8 -*-
class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.posted.subject
  #

  default from: ENV['MAIL_FROM']
  
  def posted(comment)
    @comment = comment
    @entry = @comment.entry
    @blog = @entry.blog

    mail(to: ENV['MAIL_TO'],
         subject: "新しいコメントが投稿されました")
  end
end
