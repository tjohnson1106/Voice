defmodule VoiceWeb.Schema do
  use Absinthe.Schema

  import_types(VoiceWeb.Schema.Types)

  query do
    field :blog_posts, list_of(:blog_post) do
      resolve(&VoiceWeb.Blog.PostResolver.all/2)
    end

    field :blog_post, type: :blog_post do
      arg(:id, non_null(:id))
      resolve(&VoiceWeb.Blog.PostResolver.find/2)
    end

    field :accounts_users, list_of(:account_user) do
      resolve(&Voice.Accounts.UserResolver.all/2)
    end

    field :accounts_user, :accounts_user do
      arg(:email, non_null(:string))
      resolve(&Voice.Accounts.UserResolver.find/2)
    end
  end
end
