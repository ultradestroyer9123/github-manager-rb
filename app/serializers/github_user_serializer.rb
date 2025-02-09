class GithubUserSerializer < ActiveModel::Serializer
  attributes :id, 
             :username,
             :created_at,
             :description,
             :location
end
