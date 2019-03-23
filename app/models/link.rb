class Link < ApplicationRecord
  belongs_to :catalog
  validates :title, :content, presence: true,
                    length: { minimum: 5 }

  def typeString

    typeString = "Unknow"

    if self.link_type == "0"
      typeString = "URL"
    elsif self.link_type == "1"
      typeString = "Html page"
    else
    end

    return typeString
  end

end
