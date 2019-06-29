# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
  has_and_belongs_to_many :spaces
  has_and_belongs_to_many :tags
end
