import UIKit

class DuelVC: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var firstPlayerImageView: UIImageView!
  @IBOutlet weak var secondPlayerImageView: UIImageView!
  @IBOutlet weak var displayingShotResultsLabel: UILabel!
  @IBOutlet weak var firstHeathPointsLabel: UILabel!
  @IBOutlet weak var secondHealthPointsLabel: UILabel!
  @IBOutlet weak var firstHeathPointsProgressView: UIProgressView!
  @IBOutlet weak var secondHeathPointsProgressView: UIProgressView!

  // MARK: - let/var
  static let identifier = "DuelVC"

  // MARK: - lifecicle funcs
  override func viewDidLoad() {
    super.viewDidLoad()
    setPlayerImages()
    displayHeathPoints()
  }
  // MARK: - IBActions
  @IBAction func takeShotButtonPressed(_ sender: UIButton) {
    var battle = Battle()
    battle.makeAttack()
//    if
  }
  // MARK: - flow funcs
  func setPlayerImages() {
    if let firstPlayerImage = Battle.firstPlayer?.personageImage {
      firstPlayerImageView.image = firstPlayerImage
    }

    if let secondPlayerImage = Battle.secondPlayer?.personageImage {
      secondPlayerImageView.image = secondPlayerImage
    }
  }

  func displayHeathPoints() {
    if let firstHealthPoints = Battle.firstPlayer?.healthPoints {
      firstHeathPointsLabel.text = "Heats points: \(firstHealthPoints)"
      firstHeathPointsProgressView.progress = Float(firstHealthPoints) * 0.01
    }
    if let secondHealthPoints = Battle.secondPlayer?.healthPoints {
      secondHealthPointsLabel.text = "Heats points: \(secondHealthPoints)"
      secondHeathPointsProgressView.progress = Float(secondHealthPoints) * 0.01
    }

  }
}
