import Foundation

struct Player {
  let id: Int
  let nickName: String
  let classSelection: PersonageClass
  var healthPoints: Int {
    return Int.random(in: 50...100)
  }
  var isWeaponRightHand: Bool
  
  init(nickName: String = "Player1", classSelection: PersonageClass, isWeaponRightHand: Bool = true) {
    self.id = Player.createIDPlayer()
    self.nickName = nickName
    self.classSelection = classSelection
    self.isWeaponRightHand = isWeaponRightHand
  }
  
  static func createIDPlayer() -> Int {
    return Int.random(in: 100_000...999_999)
  }
}

extension Player {
  enum PersonageClass: String, CaseIterable {
    case warrior = "Warrior"
    case mage = "Mage"
    case druid = "Druid"
    
    static func getAllPersonages(array: inout [PersonageClass]) {
      for element in PersonageClass.allCases {
        array.append(element)
      }
    }
  }
  
}

// Написать сущность, которая описывает игрока в игре Player:
//
//- id игрока
//- его ник
//- текущий класс игрока, может быть: воин, маг, друид
//- количество жизней (50..100)
//- оружие в правой руке.
//let player = Player(id: 266656, name: "Strelox", classSelection: .druid, isWeaponRightHand: true)
