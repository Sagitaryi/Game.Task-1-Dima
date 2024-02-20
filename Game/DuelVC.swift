import UIKit

class DuelVC: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var firstPlayerImageView: UIImageView!
  @IBOutlet weak var secondPlayerImageView: UIImageView!
  @IBOutlet weak var displayingAttackResultsLabel: UILabel!
  @IBOutlet weak var firstHeathPointsLabel: UILabel!
  @IBOutlet weak var secondHealthPointsLabel: UILabel!
  @IBOutlet weak var firstNicknameLabel: UILabel!
  @IBOutlet weak var secondNicknameLabel: UILabel!
  @IBOutlet weak var firstHeathPointsProgressView: UIProgressView!
  @IBOutlet weak var secondHeathPointsProgressView: UIProgressView!
  @IBOutlet weak var attackButton: UIButton!

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
  @IBAction func attackButtonPressed(_ sender: UIButton) {
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
