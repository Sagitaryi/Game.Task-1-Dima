import Foundation

class BattleClass {
    static var firstPlayer: PlayerClass?
    static var secondPlayer: PlayerClass?
    static var playerNumberAttacks = Int.random(in: 1 ... 2)

    class func processStep() -> Attack {
        var attack = Attack()
        if playerNumberAttacks == 1 {
            attack.damage = firstPlayer?.weapon.hitAndDamageCalculation() ?? 0
            attack.nicknameAttackingPlayer = firstPlayer?.nickName ?? ""
            attack.nicknameAttackedPlayer = secondPlayer?.nickName ?? ""
            secondPlayer?.hit(damage: attack.damage)
            playerNumberAttacks = 2
            return attack
        } else {
            attack.damage = secondPlayer?.weapon.hitAndDamageCalculation() ?? 0
            attack.nicknameAttackingPlayer = secondPlayer?.nickName ?? ""
            attack.nicknameAttackedPlayer = firstPlayer?.nickName ?? ""
            firstPlayer?.hit(damage: attack.damage)
            playerNumberAttacks = 1
            return attack
        }
    }
}

// Сделаем сущность `Battle`
// Она должен будет принимать 2-х игроков. Далее они буду использовать оружие и поражать друг друга по принципу дуэли.
//
// Должен быть метод по типа:
//
// ```swift
// func processStep() → Bool {
//  ...
// }
// ```
//
// В результате его будет рассчитываться один игрок поражает другого и потом другой 1-го. Результатом будет - продолжать ? Те еще есть живой или нет)
