class MessagingService
  def initialize(url=default_url)
    @bunny = Bunny.new(url)
    @bunny.start
  end

  def publish_image_resize_request_task(image_url, type)
    payload    = { image_url: image_url }.to_json
    properties = { routing_key: type, content_type: "application/json" }

    Rails.logger.info "Resizing #{image_url}, type: #{type.inspect}"
    image_resize_task_exchange.publish( payload,  properties)
  end

  def image_resize_task_exchange
    @image_resize_task_exchange ||= @bunny.direct(
      "image.resize",
      durable: true)
  end

  def default_url
    ENV["AMQP_URL"] || "amqp://localhost:5672/%2F"
  end
end
