class Book < ApplicationRecord

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :book_comments,dependent: :destroy
  has_many :tag_maps, dependent: :destroy,foreign_key: 'book_id'
  has_many :tags, through: :tag_maps

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def save_tag(sent_tags)
    # createにて保存した@bookに紐付いているタグが存在する場合「タグの名前を配列として」全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得した@bookに存在するタグから、送信されてきたタグを除いたタグをold_tagsとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから、現在存在するタグを除いたタグをnew_tagsとする
    new_tags = sent_tags - current_tags
    
    # 古いタグを削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end
    # 新しいタグをデータベースに保存
    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_tag
    end
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	
end
