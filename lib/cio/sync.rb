class Cio::Sync
  class << self
    def process(target, action, source)
      class_name = "Cio::Sync::#{target.camelize}".constantize
      class_name.send(action, source)
    end
  end
end
