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
        displayHeathPoints()
    }

    // MARK: - IBActions

    @IBAction func attackButtonPressed(_: UIButton) {
        var battle = Battle()
        displayingAttackResultsLabel.text = battle.callAttack()
        displayHeathPoints()
        checkWhichPlayerLost()
    }

    // MARK: - flow funcs

    func setPlayersImages() {
        if let firstPlayerImage = Battle.firstPlayer?.personageImage {
            firstPlayerImageView.image = firstPlayerImage
        }

        if let secondPlayerImage = Battle.secondPlayer?.personageImage {
            secondPlayerImageView.image = secondPlayerImage
        }
    }

    func setPlayersNicknames() {
        if let firstNickname = Battle.firstPlayer?.nickName, let secondNickname = Battle.secondPlayer?.nickName {
            if !firstNickname.isEmpty {
                firstNicknameLabel.text = firstNickname
            }
            if !secondNickname.isEmpty {
                secondNicknameLabel.text = secondNickname
            }
        }
    }

    func displayHeathPoints() {
        if let firstHealthPoints = Battle.firstPlayer?.healthPoints {
            firstHeathPointsLabel.text = "Healts points: \(firstHealthPoints)"
            firstHeathPointsProgressView.progress = Float(firstHealthPoints) * 0.01
        }
        if let secondHealthPoints = Battle.secondPlayer?.healthPoints {
            secondHealthPointsLabel.text = "Healts points: \(secondHealthPoints)"
            secondHeathPointsProgressView.progress = Float(secondHealthPoints) * 0.01
        }
    }

    func checkWhichPlayerLost() {
        let isFirstPlayerDeath = Battle.firstPlayer?.isAlive ?? false
        let isSecondPlayerDeath = Battle.secondPlayer?.isAlive ?? false
        if !isFirstPlayerDeath || !isSecondPlayerDeath {
            attackButton.isEnabled = false
        }
    }
}
