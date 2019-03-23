module CatalogsHelper

  def randomized_background_image
    images = ["assets/Loading_icon.gif", "assets/classic_mickey.gif"]
    images[rand(images.size)]
  end
end
