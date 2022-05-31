RailsAdmin.config do |config|
  config.asset_source = :webpacker

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  ## == Devise ==
  config.authenticate_with do
   warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)


  RailsAdmin.config do |config|
    config.authorize_with do
      redirect_to main_app.root_path unless current_user.role === "admin"       # to authorize the localhost:3000/admin path to the user who has the role as admin
    end
  end

  config.model 'User' do
    list do 
      field :name do
        formatted_value do # used in form views
          value.to_s.upcase
          end
        end
      field :email
      field :created_at
      field :role
      field :birth
      # field :groups 
      field :count_post do
        label "Posts"
      end
      field :status 
      field :avatar
    end
  end

  config.model 'User' do
    edit do
      field :email do
        read_only do
          bindings[:object].email.present?
        end
      end
      field :name
      field :role
      field :birth
      field :status
      field :posts
      field :avatar
    end
  end

  config.model 'Post' do
    list do
      field :user
      field :title
      field :content
      field :group
      field :created_at
      field :updated_at
      field :approve
      field :image
    end
  end

  config.model 'Post' do
    edit do
      field :user do
        read_only do
          bindings[:object].user.present?
        end
      end
      field :admin_update do
        formatted_value do 
          true
        end
        end
      field :title
      field :content
      field :approve
    end
  end

  config.model 'Like' do
    list do
      field :user
      field :post
      field :created_at
      field :updated_at
    end
  end

  config.model 'GroupMember' do
    list do
      field :user
      field :group
      field :created_at
      field :updated_at
      field :status
    end
  end

  config.model 'Comment' do
    list do 
      field :commenter
      field :content
      field :created_at
      field :post
      field :parent_id
      field :replies
    end
  end

  config.model 'Comment' do
    edit do
      field :commenter
      field :content
    end
  end

  config.model 'Group' do
    list do 
      field :name 
      field :user_create_id
      field :ban
      field :status 
      field :posts
    end
  end

  config.model 'Group' do
    edit do 
      field :user_create_id
      field :name
      field :ban
      field :status 
      field :posts
    end
  end

  
  config.default_items_per_page = 5

end
