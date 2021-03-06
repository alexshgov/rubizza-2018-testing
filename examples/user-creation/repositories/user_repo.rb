class UserRepo
  class << self
    def all
      Thread.current[:users] || []
    end

    def create(name:, sex:, age:, email:)
      Thread.current[:users] ||= []
      new_user = { name: name, sex: sex, age: age, email: email }
      Thread.current[:users] << new_user

      new_user
    end

    def exists?(email:)
      all.any? { |user| user[:email] == email }
    end
  end
end
