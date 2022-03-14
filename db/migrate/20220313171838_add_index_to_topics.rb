class AddIndexToTopics < ActiveRecord::Migration[6.0]
  def change
    add_index :topics, :alias, unique: true
    Topic.create alias: "cats", title: "Котики"
    Topic.create alias: "dogs", title: "Собаки"
    Topic.create alias: "horses", title: "Лошади"
    Topic.create alias: "hamsters", title: "Хомяки"
    Topic.create alias: "turtles", title: "Черепашки"
  end
end
