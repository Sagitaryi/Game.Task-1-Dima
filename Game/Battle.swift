import Foundation

final class BattleClass {
    private let firstPlayer: PlayerClass
    private let secondPlayer: PlayerClass
    private var playerNumberAttacks = Int.random(in: 1 ... 2)
    
    init(firstPlayer: PlayerClass, secondPlayer: PlayerClass) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }

    func processStep() -> AttackResult {
        var attack = AttackResult()
        if playerNumberAttacks == 1 {
            attack.damage = firstPlayer.weapon.hitAndDamageCalculation()
            attack.nicknameAttackingPlayer = firstPlayer.nickName ?? ""
            attack.nicknameAttackedPlayer = secondPlayer.nickName ?? ""
            secondPlayer.hit(damage: attack.damage)
            playerNumberAttacks = 2
        } else {
            attack.damage = secondPlayer.weapon.hitAndDamageCalculation()
            attack.nicknameAttackingPlayer = secondPlayer.nickName ?? ""
            attack.nicknameAttackedPlayer = firstPlayer.nickName ?? ""
            firstPlayer.hit(damage: attack.damage)
            playerNumberAttacks = 1
        }
        return attack
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
