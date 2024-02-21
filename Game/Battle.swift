import Foundation

struct Battle {
    static var firstPlayer: Player?
    static var secondPlayer: Player?
    static var playerNumberAttacks = Int.random(in: 1 ... 2)

    mutating func callAttack() -> String {
        let attack = Weapon()
        let damage = attack.hitAndDamageCalculation()
        var firsNickName = ""
        var secondNickname = ""

        if Battle.playerNumberAttacks == 1 {
            firsNickName = Battle.firstPlayer?.nickName ?? String(Battle.playerNumberAttacks)
            Battle.playerNumberAttacks = 2
            secondNickname = Battle.secondPlayer?.nickName ?? String(Battle.playerNumberAttacks)
            return makeAttack(player: &Battle.firstPlayer, attackingPlayer: secondNickname, attackedPlayer: firsNickName)
        } else {
            secondNickname = Battle.secondPlayer?.nickName ?? String(Battle.playerNumberAttacks)
            Battle.playerNumberAttacks = 1
            firsNickName = Battle.firstPlayer?.nickName ?? String(Battle.playerNumberAttacks)
            return makeAttack(player: &Battle.secondPlayer, attackingPlayer: firsNickName, attackedPlayer: secondNickname)
        }

        func makeAttack(player: inout Player?, attackingPlayer: String, attackedPlayer: String) -> String {
            if damage == 0 {
                return "Player \(attackingPlayer) missed"
            } else {
                player?.healthPoints -= damage
                let valueHeathPoints = player?.healthPoints ?? 0
                if valueHeathPoints > 0 {
                    return "Player \(attackingPlayer) dealt \(damage) points of damage to player \(attackedPlayer)"
                } else {
                    player?.healthPoints = 0
                    player?.isAlive = false
                    return "The player \(attackingPlayer) wins!"
                }
            }
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
