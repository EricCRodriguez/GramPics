module ApplicationHelper

  def title(page_title)
    content_for :page_title, page_title.to_s
  end

  def meta_description(desc)
    content_for :meta_description, desc.to_s
  end

  def heading(heading)
    content_for :page_heading, heading.to_s
  end

end
