import UIKit

class DuelVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var firstPlayerImageView: UIImageView!
    @IBOutlet var secondPlayerImageView: UIImageView!
    @IBOutlet var displayingAttackResultsLabel: UILabel!
    @IBOutlet var firstHeathPointsLabel: UILabel!
    @IBOutlet var secondHealthPointsLabel: UILabel!
    @IBOutlet var firstNicknameLabel: UILabel!
    @IBOutlet var secondNicknameLabel: UILabel!
    @IBOutlet var firstHeathPointsProgressView: UIProgressView!
    @IBOutlet var secondHeathPointsProgressView: UIProgressView!
    @IBOutlet var attackButton: UIButton!

    // MARK: - let/var

    static let identifier = "DuelVC"

    // MARK: - lifecicle funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayersImages()
        setPlayersNicknames()
        displayHealthPoints()
    }

    // MARK: - IBActions

    @IBAction func attackButtonPressed(_: UIButton) {
        showImpactResults()
        displayHealthPoints()
    }

    // MARK: - flow funcs

    func setPlayersImages() {
        if let firstPlayerImage = BattleClass.firstPlayer?.personageImage {
            firstPlayerImageView.image = firstPlayerImage
        }

        if let secondPlayerImage = BattleClass.secondPlayer?.personageImage {
            secondPlayerImageView.image = secondPlayerImage
        }
    }

    func setPlayersNicknames() {
        if let firstNickname = BattleClass.firstPlayer?.nickName {
            firstNicknameLabel.text = firstNickname
        }

        if let secondNickname = BattleClass.secondPlayer?.nickName {
            secondNicknameLabel.text = secondNickname
        }
    }

    func displayHealthPoints() {
        if let firstHealthPoints = BattleClass.firstPlayer?.healthPoints {
            firstHeathPointsLabel.text = "Healts points: \(firstHealthPoints)"
            firstHeathPointsProgressView.progress = Float(firstHealthPoints) * 0.01
        }
        if let secondHealthPoints = BattleClass.secondPlayer?.healthPoints {
            secondHealthPointsLabel.text = "Healts points: \(secondHealthPoints)"
            secondHeathPointsProgressView.progress = Float(secondHealthPoints) * 0.01
        }
    }

    func showImpactResults() {
        let result = BattleClass.processStep()
        if result.damage != 0 {
            if BattleClass.firstPlayer?.isAlive ?? false == false {
                displayingAttackResultsLabel.text = "Player \(result.nicknameAttackingPlayer) win"
                attackButton.isEnabled = false
            } else if BattleClass.secondPlayer?.isAlive ?? false == false {
                displayingAttackResultsLabel.text = "Player \(result.nicknameAttackingPlayer) win"
                attackButton.isEnabled = false
            } else {
                displayingAttackResultsLabel.text = "The \(result.nicknameAttackingPlayer) player dealt \(result.damage) points of damage to the \(result.nicknameAttackedPlayer) player"
            }
        } else {
            displayingAttackResultsLabel.text = "Player \(result.nicknameAttackingPlayer) missed"
        }
    }
}
