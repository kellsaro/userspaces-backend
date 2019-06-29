# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  appt_time  :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#

# Definition of the serialization to JSON of Appointment model
class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :number_of_tags, :tags
  belongs_to :user

  def number_of_tags
    object.tags.size
  end
end
