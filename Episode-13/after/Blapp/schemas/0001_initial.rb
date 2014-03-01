
schema "0001 initial" do

  entity "Pseudonym" do
    string :name
    string :bio

    has_many :posts
  end

  entity "Post" do
    string :title
    string :content

    datetime :created_at
    datetime :updated_at

    belongs_to :pseudonym
  end

end
