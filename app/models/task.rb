# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  actual_time :integer          default(1), not null
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  purpose_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_tasks_on_purpose_id  (purpose_id)
#  index_tasks_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purpose_id => purposes.id)
#  fk_rails_...  (user_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :purpose

  attribute :actual_time, :integer, default: 1

  validates :title, presence: true
  validates :actual_time, presence: true
end
