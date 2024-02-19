import Foundation

struct Battle {
  static var firstPlayer: Player?
  static var secondPlayer: Player?
  static var tempPersonage = Player()
  var playerAttacksFirst: Int {
    get {
      Int.random(in: 1...2)
    }
    set { }
  }
  mutating func makeAttack() -> String {
    let attack = Weapon()
    let damage = attack.hitAndDamageCalculation()
    print(Battle.tempPersonage)
    if damage == 0 {
      print("промах")
      return ("промах")
    } else {
      Battle.firstPlayer?.healthPoints -= damage
      let firstValueHeathPoints = Battle.secondPlayer?.healthPoints ?? 0
      if firstValueHeathPoints > 0 {
        print("firstValueHeathPoints\(firstValueHeathPoints)")
        print("The second player dealt \(damage) points of damage")
        return "The second player dealt \(damage) points of damage"
      } else {
        print("The second player wins")
        return "The second player wins"
      }
    }



    //    if playerAttacksFirst == 1 {
    //      playerAttacksFirst = 2
    //      Battle.secondPlayer?.healthPoints -= damage.hitAndDamageCalculation()
    //      let firstValueHeathPoints = Battle.secondPlayer?.healthPoints ?? 0
    //      if  firstValueHeathPoints < 0 {
    //        Battle.secondPlayer?.isAlive = false
    //
    //        func attack(playerHealthPoints: inout Battle) {
    //
    //        }
    //      }
    //
    //    } else {
    //      Battle.firstPlayer?.healthPoints -= damage.hitAndDamageCalculation()
    //      playerAttacksFirst = 1
    //    }
  }
}
