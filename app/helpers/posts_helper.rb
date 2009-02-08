module PostsHelper  
  def save_buttons(post_type)
    out = ''
    out += hidden_field_tag 'post[post_type]', post_type
    if @post.not.published
      out += submit_tag 'Save & Publish', :name => 'save-publish'
    end
    out += submit_tag 'Save'
    out += ' or ' + link_to('Cancel', '#', :class => 'cancel')
    out
  end
end
