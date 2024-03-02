import UIKit

final class PlayerClass {
    lazy var id: Int = { createIDPlayer() }()
    
    let nickName: String?
    let personageImage: UIImage?
    let classSelection: PersonageClass
    let weapon: Weapon
    
    private var healthPoints: Int = .random(in: 50 ... 100)
    var isWeaponRightHand = true
    var isAlive: Bool { healthPoints > 0 }

    init(nickName: String?, personageImage: UIImage, classSelection: PersonageClass, weapon: Weapon) {
        self.nickName = nickName
        self.personageImage = personageImage
        self.classSelection = classSelection
        self.weapon = weapon
    }

    func hit(damage: Int) {
        healthPoints -= damage
        if healthPoints < 0 {
            healthPoints = 0
        }
    }
}

extension PlayerClass {
    enum PersonageClass: String, CaseIterable {
        case warrior = "Warrior"
        case mage = "Mage"
        case druid = "Druid"
    }
}

private extension PlayerClass {
    
    func createIDPlayer() -> Int {
        Int.random(in: 100_000 ... 999_999)
    }
}

// Написать сущность, которая описывает игрока в игре Player:
//
// - id игрока
// - его ник
// - текущий класс игрока, может быть: воин, маг, друид
// - количество жизней (50..100)
// - оружие в правой руке.
// let player = Player(id: 266656, name: "Strelox", classSelection: .druid, isWeaponRightHand: true)
