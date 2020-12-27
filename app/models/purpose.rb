# == Schema Information
#
# Table name: purposes
#
#  id         :bigint           not null, primary key
#  term       :integer          default(66), not null
#  time       :integer          default(1), not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_purposes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Purpose < ApplicationRecord
  belongs_to :user

  attribute :term, :integer, default: 66
  attribute :time, :integer, default: 1

  validates :title, presence: true
  validates :term, presence: true
  validates :time, presence: true
end
