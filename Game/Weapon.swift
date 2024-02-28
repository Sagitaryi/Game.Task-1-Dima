import Foundation

struct Weapon {
    let name: String
    let weight: Float
    let weaponСlassification: WeaponClass

    func hitAndDamageCalculation() -> Int {
        var damage = 0
        var hitChance = 0

        switch weaponСlassification {
        case .melee:
            damage = Int.random(in: 35 ... 40)
            hitChance = Int.random(in: 20 ... 60)
        case .spellcaster:
            damage = Int.random(in: 25 ... 30)
            hitChance = Int.random(in: 50 ... 90)
        case .ranged:
            damage = Int.random(in: 10 ... 20)
            hitChance = Int.random(in: 91 ... 100)
        }

        let rnd = Int.random(in: 1 ... 100)

        if rnd > hitChance {
            return 0
        } else {
            return damage
        }
    }
}

extension Weapon {
    enum WeaponClass: String, CaseIterable {
        case melee = "Melee"
        case spellcaster = "Spellcaster"
        case ranged = "Ranged"
    }
}

// Создадим сущность: Weapon которая будет содержать значение урона: 10…20 например и шанс попадания: 90 … 100 %
