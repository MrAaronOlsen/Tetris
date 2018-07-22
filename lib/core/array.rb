class Array
  def sample_and_remove
    delete_at(rand(length))
  end
end