# == Schema Information
#
# Table name: spaces
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Space < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
end
