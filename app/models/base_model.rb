require 'active_model'

# Allows us to inherit from a base model that includes active model
class BaseModel
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON
end