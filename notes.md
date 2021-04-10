Model scaffold:


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
    - name
    - email
    - password_digest



Reviews  * join table for users and bottles
- belongs_to :user
- belongs_to :bottle
    - content