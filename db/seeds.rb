

if Rails.env != 'test'

# challenges
=begin
  "id","challenge"
  1,"PlantVillage Disease Classification Challenge"
  2,"Dark Skies - Classification of Nighttime Images"
  3,"OpenFood Nutrition Table Challenge"
  4,"OpenFood Ingredients List Challenge"
  5,"Ants Challenge - Part I"
  6,"Learning how to walk"
  7,"Neuroscientific model optimization, Gecco 2017"
  8,"NIPS 2017: Learning to Run"


  id | imageable_id |             image_file_name              | imageable_type
  ----+--------------+------------------------------------------+----------------
   1 |            1 | PV_avatar_original_(1).png               | Challenge
   6 |            2 | Screen_Shot_2016-05-30_at_8.37.39_PM.png | Challenge
  10 |            3 | Screen_Shot_2016-08-05_at_11.56.39.png   | Challenge
  11 |            4 | Screen_Shot_2016-08-05_at_11.56.39.png   | Challenge
  12 |            5 | Screen_Shot_2016-10-18_at_4.20.02_PM.png | Challenge
  18 |            6 | stand.gif                                | Challenge
  19 |            6 | stand.gif                                | Challenge
  22 |            7 | Screen_Shot_2017-03-24_at_14.15.01.png   | Challenge
  23 |            8 | Screen_Shot_2017-04-10_at_1.23.56_PM.png | Challenge
=end


=begin
  plant_village = Challenge.find(1)
  plant_village.image_file = Rails.root.join("scripts/v2/challenges/1.PV_avatar_original_(1).png").open
  plant_village.save!

  dark_skies = Challenge.find(2)
  dark_skies.image_file = Rails.root.join("scripts/v2/challenges/2.Screen_Shot_2016-05-30_at_8.37.39_PM.png").open
  dark_skies.save!

  openfood_nutrition = Challenge.find(3)
  openfood_nutrition.image_file = Rails.root.join("scripts/v2/challenges/3.Screen_Shot_2016-08-05_at_11.56.39.png").open
  openfood_nutrition.save!

  openfood_ingredients = Challenge.find(4)
  openfood_ingredients.image_file = Rails.root.join("scripts/v2/challenges/3.Screen_Shot_2016-08-05_at_11.56.39.png").open
  openfood_ingredients.save!

  ants = Challenge.find(5)
  ants.image_file = Rails.root.join("scripts/v2/challenges/5.Screen_Shot_2016-10-18_at_4.20.02_PM.png").open
  ants.save!

  walk = Challenge.find(6)
  walk.image_file = Rails.root.join("scripts/v2/challenges/6.stand.gif").open
  walk.save!

  bbp = Challenge.find(7)
  bbp.image_file = Rails.root.join("scripts/v2/challenges/7.Screen_Shot_2017-03-24_at_14.15.01.png").open
  bbp.save!

  nips = Challenge.find(8)
  nips.image_file = Rails.root.join("scripts/v2/challenges/8.Screen_Shot_2017-04-10_at_1.23.56_PM.png").open
  nips.save!
-end


=begin
  Articles

  id | imageable_id |            image_file_name             | imageable_type
  ----+--------------+----------------------------------------+----------------
   8 |            1 | Screen_Shot_2016-07-01_at_11.40.47.png | Article
   9 |            2 | Screen_Shot_2016-08-04_at_11.41.59.png | Article
  14 |            4 | Screen_Shot_2016-10-20_at_17.46.43.png | Article
=end
=begin
  torch = Article.find(1)
  torch.image_file = Rails.root.join("scripts/v2/articles/1.Screen_Shot_2016-07-01_at_11.40.47.png").open
  torch.save!

  pv = Article.find(2)
  pv.image_file = Rails.root.join("scripts/v2/articles/2.Screen_Shot_2016-08-04_at_11.41.59 (1).png").open
  pv.save!

  darkskies = Article.find(4)
  darkskies.image_file = Rails.root.join("scripts/v2/articles/4.Screen_Shot_2016-10-20_at_17.46.43.png").open
  darkskies.save!
=end
=begin
  Participants

  id | imageable_id |                   image_file_name                    | imageable_type
  ----+--------------+------------------------------------------------------+----------------
   2 |           10 | yannis_avatar_square_full_ds_white.jpg               | Participant
   3 |           31 | fcnmxcvy-1339984970.jpg                              | Participant
   4 |           73 | abhinav.jpg                                          | Participant
   7 |          284 | profile.jpg                                          | Participant
  15 |          453 | IMG_0439.jpg                                         | Participant
  16 |          502 | Somnath.jpg                                          | Participant
  17 |          374 | avatar-512-512.jpg                                   | Participant
  20 |            7 | Screen_Shot_2017-02-22_at_12.48.51.png               | Participant
  21 |          760 | M13.profile.jpg                                      | Participant
  24 |          654 | 15726741_10158030842520014_6190014705780691300_n.jpg | Participant
  25 |          268 | marcel_salathe.jpg                                   | Participant
  13 |            1 | Screen_Shot_2017-05-03_at_08.09.43.png               | Participant
  (12 rows)
=end
=begin
  p1 = Participant.find(1)
  p1.image_file = Rails.root.join("scripts/v2/participants/1.Screen_Shot_2017-05-03_at_08.09.43 (2).png").open
  p1.save!

  p7 = Participant.find(7)
  p7.image_file = Rails.root.join("scripts/v2/participants/7.Screen_Shot_2017-02-22_at_12.48.51.png").open
  p7.save!

  p10 = Participant.find(10)
  p10.image_file = Rails.root.join("scripts/v2/participants/10.yannis_avatar_square_full_ds_white.jpg").open
  p10.save!

  p31 = Participant.find(31)
  p31.image_file = Rails.root.join("scripts/v2/participants/31.fcnmxcvy-1339984970.jpg").open
  p31.save!

  p73 = Participant.find(73)
  p73.image_file = Rails.root.join("scripts/v2/participants/73.abhinav.jpg").open
  p73.save!

  p268 = Participant.find(268)
  p268.image_file = Rails.root.join("scripts/v2/participants/268.marcel_salathe.jpg").open
  p268.save!

  p284 = Participant.find(284)
  p284.image_file = Rails.root.join("scripts/v2/participants/284.jpg").open
  p284.save!

  p374 = Participant.find(374)
  p374.image_file = Rails.root.join("scripts/v2/participants/374.avatar-512-512.jpg").open
  p374.save!

  p453 = Participant.find(453)
  p453.image_file = Rails.root.join("scripts/v2/participants/453.IMG_0439.jpg").open
  p453.save!

  p502 = Participant.find(502)
  p502.image_file = Rails.root.join("scripts/v2/participants/502.Somnath.jpg").open
  p502.save!

  p654 = Participant.find(654)
  p654.image_file = Rails.root.join("scripts/v2/participants/654.15726741_10158030842520014_6190014705780691300_n.jpg").open
  p654.save!

  p760 = Participant.find(760)
  p760.image_file = Rails.root.join("scripts/v2/participants/760.M13.jpg").open
  p760.save!
=end


end
Participant.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true) if Rails.env.development?
