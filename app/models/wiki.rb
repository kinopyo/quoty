class Wiki < ActiveRecord::Base
  has_ancestry

  attr_accessible :description, :title, :parent_id
  belongs_to :user
  has_many :quotes, class_name: 'Quote', finder_sql: Proc.new {
    %Q{
      SELECT *
      FROM quotes q
      WHERE q.author_wiki_id = #{id}
      OR q.source_wiki_id = #{id}
    }
  }

  validates :title, presence: true

  def self.case_insensitive_search(title)
    where("lower(title) = ?", title.downcase)
  end
end
