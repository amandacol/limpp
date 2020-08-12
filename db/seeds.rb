cleardatabase = true if Rails.env.development?

if cleardatabase
  puts "Cleaning database..."
  Combination.destroy_all
  Coupon.destroy_all
  Ingredient.destroy_all
  Item.destroy_all
  Merger.destroy_all
  Newitem.destroy_all
  Purpose.destroy_all
  User.destroy_all
  Wishlist.destroy_all
end

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"

USERS = [
  { email: 'thierry@hortatech.com.br', password: 'limpp123', first_name: "Thierry", last_name: "Oliveira", admin: true },
  { email: 'rayan@hortatech.com.br', password: 'limpp123', first_name: "Rayan", last_name: "Castro", admin: true },
  { email: 'limpp.com.vc@gmail.com', password: 'limpp123', first_name: "Beleza", last_name: "Limpp", admin: true },
  { email: 'amanda@teste.com', password: 'limpp123', first_name: "Amanda", last_name: "Colmenero", admin: false }
]

puts "Creating users..."

USERS.each do |user_params|
  User.create!(user_params)
end

puts "You have #{User.count} users"

puts "Creating ingredients"

INGREDIENTS = [
  {name: "EDTA (ETHYLENEDIAMINE TETRAACETIC ACID)", allergenic: "sim", article: lorem, risk_to_health: "yellow", risk_to_health_text: "Pode causar irritação nos olhos, pele e trato respiratório", risk_to_enviroment: "yellow", risk_to_enviroment_text: "Pode resultar em sua liberação para o meio ambiente através de vários fluxos de resíduos, desde sua produção ao descarte. Seu potencial de bioconcentração em organismos aquáticos é baixo, porém, existente", restrictions: "NA UNIÃO EUROPEIA (CosIng) – NÃO POSSUI", other_names: ['CALCIUM DISODIUM EDTA', 'DIAMMONIUM EDTA, DIPOTASSIUM EDTA', 'TRISODIUM HEDTA']},
  {name: "Sodium Laureth Sulfate", allergenic: "sim", article: lorem, risk_to_health: "red", risk_to_health_text: "Pode causar alergia na pele", risk_to_enviroment: "yellow", risk_to_enviroment_text: "Pode afetar a camada de ozonio", restrictions: "ESTADOS UNIDOS (CIR) – Concentração máxima de até 2%.", other_names: ['CALCIUM DISODIUM EDTA', 'DIPOTASSIUM EDTA', 'TRISODIUM HEDTA']},
  {name: "Amianto", allergenic: "sim", article: lorem, risk_to_health: "red", risk_to_health_text: "Pode causar alergia na pele", risk_to_enviroment: "yellow", risk_to_enviroment_text: "Pode afetar a camada de ozonio", restrictions: "ESTADOS UNIDOS (CIR) – Concentração máxima de até 2%.", other_names: ['CALCIUM DISODIUM EDTA', 'DIAMMONIUM EDTA, DIPOTASSIUM EDTA', 'TRISODIUM HEDTA']}

]

INGREDIENTS.each do |ingredient_params|
  Ingredient.create!(ingredient_params)
end

puts "You have #{Ingredient.count} ingredients"

puts "Creating Itens"

ITENS = [
  { name: "Shampoo TRESemmé Detox Capilar",  user: User.all.sample },
  { name: "Batom Natura", user: User.all.sample },
  { name: "Hidratante Corporal Jequiti", user: User.all.sample },
]

ITENS.each do |item_params|
  Item.create!(item_params)
end

puts "You have #{Item.count} itens"


PHOTOS = ["shampoo.jpg", "batom.jpeg" , "hidratante.jpeg" ]

puts "Creating Photos"


Item.all.each do |item|
  img_path = './app/assets/images/' + PHOTOS.sample
  File.open(img_path) do |file|
    item.photo = file
  end
  item.save
end

puts "You have added #{PHOTOS.count} photos"

puts "Creating Combinations"

5.times do
  Combination.create!(item: Item.all.sample, ingredient: Ingredient.all.sample)
end

puts "You have now #{Combination.count} combinations"

puts "End of seed!"
