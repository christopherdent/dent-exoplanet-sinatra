Planet.destroy_all
Star.destroy_all
User.destroy_all

User.create(username: "christopher", password: "password")

Star.create(name: "Kepler-186", star_type: "Red Dwarf", distance: 582, user_id: 1)
Star.create(name: "55 Cancri", star_type: "Main Sequence", distance: 41, user_id: 1)
Star.create(name: "51 Pegasi", star_type: "Main Sequence", distance: 50, user_id: 1)
Star.create(name: "Gliese 667 C", star_type: "Red Dwarf", distance: 24, user_id: 1)
Star.create(name: "Ursae Majoris", star_type: "Yellow Dwarf", distance: 46, user_id: 1)
Star.create(name: "TRAPPIST-1", star_type: "Red Dwarf", distance: 40, user_id: 1)


Planet.create(name: "Kepler-186e", date_discovered: 2014, discovered_by: "Elisa Quintana", category: "Super Earth", star_id: 1, user_id: 1)
Planet.create(name: "Kepler-186f", date_discovered: 2014, discovered_by: "Elisa Quintana", category: "Earth-Like", star_id: 1, user_id: 1)
Planet.create(name: "55 Cancri b", date_discovered: 1996, discovered_by: "Marcy Butler", category: "Hot Jupiter", star_id: 2, user_id: 1)
Planet.create(name: "55 Cancri e", date_discovered: 2004, discovered_by: "McArthur et. al.", category: "Super Earth", star_id: 2, user_id: 1)
Planet.create(name: "55 Cancri c", date_discovered: 2002, discovered_by: "Marcy et. al.", category: "Gas Giant", star_id: 2, user_id: 1)
Planet.create(name: "55 Cancri f", date_discovered: 2007, discovered_by: "D. Fischer", category: "Gas Giant", star_id: 2, user_id: 1)
Planet.create(name: "51 Pegasi b", date_discovered: 1995, discovered_by: "Michael Mayor and Dider Queloz", category: "Hot Jupiter", star_id: 3, user_id: 1)
Planet.create(name: "Gliese 667 Cc", date_discovered: 2011, discovered_by: "", category: "Super Earth", star_id: 4, user_id: 1)
Planet.create(name: "Gliese 667 Cb", date_discovered: 2009, discovered_by: "Anglada-Escudé", category: "Super Earth", star_id: 4, user_id: 1)
Planet.create(name: "47 Ursae Majoris b", date_discovered: 1996, discovered_by: "Marcy and Butler et al.", category: "Gas Giant", star_id: 5, user_id: 1)
Planet.create(name: "47 Ursae Majoris c", date_discovered: 2002, discovered_by: "Fischer, Butler, and Marcy et al.", category: "Gas Giant", star_id: 5, user_id: 1)
Planet.create(name: "TRAPPIST-1b", date_discovered: 2016, discovered_by: "Grimm, Simon et al.", category: "Sub-Earth", star_id: 6, user_id: 1)
Planet.create(name: "TRAPPIST-1c", date_discovered: 2016, discovered_by: "Grimm, Simon et al.", category: "Sub-Earth", star_id: 6, user_id: 1)
Planet.create(name: "TRAPPIST-1e", date_discovered: 2016, discovered_by: "Grimm, Simon et al.", category: "Earth-like", star_id: 6, user_id: 1)
Planet.create(name: "TRAPPIST-1f", date_discovered: 2017, discovered_by: "Quarles, Billy; Quintana, Elisa V.; Lopez, Eric D.; Schlieder, Joshua E.; Barclay, Thomas ", category: "Earth-like", star_id: 6, user_id: 1)
