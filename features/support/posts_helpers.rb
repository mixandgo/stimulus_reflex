def create_post
  click_on "post-new"
  fill_in "post-body", with: "My post body"
  attach_file "post-file", "#{Rails.root}/features/support/fixtures/image.jpg"
  click_on "post-new-submit"
end
