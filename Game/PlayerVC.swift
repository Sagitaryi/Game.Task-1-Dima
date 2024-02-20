import UIKit

class PlayerVC: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var nicknameTextField: UITextField!
  @IBOutlet weak var personageClassPicker: UIPickerView!
  @IBOutlet weak var personageImageView: UIImageView!
  @IBOutlet weak var weaponHandSelectionSwitch: UISwitch!
  @IBOutlet weak var mainLabel: UILabel!

  // MARK: - let/var
  var arrayPersonages: [Player.PersonageClass] = []
  var nickName: String?
  var imagePersonage = UIImage() {
    didSet {
      personageImageView.image = imagePersonage
    }
  }
  var selectedClass: Player.PersonageClass = .warrior
  var isWeaponRightHand = true {
    didSet {
      imageSelection()
    }
  }
  var isFirstPlayerCreated = false

  // MARK: - lifecicle funcs
  override func viewDidLoad() {
    super.viewDidLoad()
    fillingArrayPersonages()
    imageSelection()
  }

  // MARK: - IBActions
  @IBAction func getNickname(_ sender: UITextField) {
    guard let name = sender.text else { return }
    nickName = name
  }

  @IBAction func usingWeaponRightHand(_ sender: UISwitch) {
    isWeaponRightHand = sender.isOn
  }

  @IBAction func nextVCButtonPressed(_ sender: UIButton) {
    if !isFirstPlayerCreated {
      createPlayer(numberPlayer: &Battle.firstPlayer)
      isFirstPlayerCreated = true
      clearingPersonageFields()
    } else {
      createPlayer(numberPlayer: &Battle.secondPlayer)
      navigation()
    }
  }

  // MARK: - flow funcs
  func fillingArrayPersonages() {
    Player.PersonageClass.getAllPersonages(array: &arrayPersonages)
  }

  func imageSelection() {
    imagePersonage = Constants.PersonagesImages.imageSelection(personageClass: selectedClass,
                                                               isWeaponRightHand: isWeaponRightHand)
  }

  func createPlayer(numberPlayer: inout Player?) {
    numberPlayer = Player(
      nickName: nickName,
      personageImage: imagePersonage,
      classSelection: selectedClass,
      isWeaponRightHand: isWeaponRightHand)
  }

  func clearingPersonageFields() {
    mainLabel.text = "Create your second Personage:"
    nicknameTextField.text = nil
    personageClassPicker.selectRow(0, inComponent: 0, animated: false)
    selectedClass = .warrior
    weaponHandSelectionSwitch.isOn = true
    isWeaponRightHand = true
  }

  func navigation() {
    guard let controller = storyboard?.instantiateViewController(
      withIdentifier: DuelVC.identifier) as? DuelVC else { return }
    navigationController?.pushViewController(controller, animated: true)
  }
}

// MARK: - extensions
extension PlayerVC: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return arrayPersonages.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return arrayPersonages[row].rawValue
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedClass = arrayPersonages[row]
    imageSelection()
  }
}
