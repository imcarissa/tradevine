Model blueprint:


Bottle    * join table for reviews & users
- belongs_to :user
- has_many :reviews
- has_many :users, through :comments
    - name
    - type
    - vintage
    - region



User
- has_many :bottles
- has_many :reviews
- has_many :reviewed_posts, through :reviews, source: :bottle
** has_many :categories, through: :bottles
    - username
    - email
    - password_digest



review  * join table for users and bottles
- belongs_to :user
- belongs_to :bottle
    - content


** Categories
- has_many :bottles
- has_many :users, through: :bottles
- name