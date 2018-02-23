class CatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age

  alias_method :to_hash, :serializable_hash
end
