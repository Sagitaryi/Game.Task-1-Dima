import Foundation

class BattleClass {
    static var firstPlayer: PlayerClass?
    static var secondPlayer: PlayerClass?
    static var playerNumberAttacks = Int.random(in: 1 ... 2)

    class func processStep() -> (nicknameAttackingPlayer: String, damage: Int, nicknameAttackedPlayer: String) {
        if playerNumberAttacks == 1 {
            let damage = firstPlayer?.weapon.hitAndDamageCalculation() ?? 0
            secondPlayer?.hit(damage: damage)
            playerNumberAttacks = 2
            return (firstPlayer?.nickName ?? "-", damage, secondPlayer?.nickName ?? "-")
        } else {
            let damage = secondPlayer?.weapon.hitAndDamageCalculation() ?? 0
            firstPlayer?.hit(damage: damage)
            playerNumberAttacks = 1
            return (secondPlayer?.nickName ?? "-", damage, firstPlayer?.nickName ?? "-")
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
