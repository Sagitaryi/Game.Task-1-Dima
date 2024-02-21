import Foundation

struct Weapon {
    var damage = Int.random(in: 10 ... 20)
    var hitChance = Int.random(in: 91 ... 100)

    func hitAndDamageCalculation() -> Int {
        var result = 0
        if hitChance > 91 {
            result = damage
        }
        return result
    }
}

// Создадим сущность: Weapon которая будет содержать значение урона: 10…20 например и шанс попадания: 90 … 100 %
