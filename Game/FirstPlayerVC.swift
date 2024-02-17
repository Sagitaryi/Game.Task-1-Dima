import UIKit

class FirstPlayerVC: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var nicknameTextField: UITextField!
  @IBOutlet weak var personageClassPicker: UIPickerView!
  @IBOutlet weak var personageImageView: UIImageView!
  @IBOutlet weak var weaponHandSelection: UISwitch!

  // MARK: - let/var
  var arrayPersonages: [Player.PersonageClass] = []
  var nickName = ""
  var selectedClass: Player.PersonageClass = .druid
  var isWeaponRightHand = true

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
    imageSelection()
  }

  @IBAction func nextVCButtonPressed(_ sender: UIButton) {
    createPlayer()
    navigation()
  }

  // MARK: - flow funcs
  func fillingArrayPersonages() {
    Player.PersonageClass.getAllPersonages(array: &arrayPersonages)
  }

  func imageSelection() {
    personageImageView.image = Constants.PersonagesImages.imageSelection(personageClass: selectedClass,
                                                                         isWeaponRightHand: isWeaponRightHand)
  }

  func createPlayer() {
    Buttle.firstPlayer = Player(
      nickName: nickName,
      classSelection: selectedClass,
      isWeaponRightHand: isWeaponRightHand)
  }

  func navigation() {
    guard let controller = storyboard?.instantiateViewController(
      withIdentifier: SecondPlayerVC.identifier) as? SecondPlayerVC else { return }
    navigationController?.pushViewController(controller, animated: true)
  }
}

// MARK: - extensions
extension FirstPlayerVC: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int { // количество "барабанов"
    1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    // количество элементов в "барабане"
    return arrayPersonages.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    // подставить информацию на строку №row барабана из массива
    return arrayPersonages[row].rawValue
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // подставить информацию из строки №row в лэйбл из массива
    //        personageImageView.image = UIImage(named: arrayPersonages[row].rawValue)
    selectedClass = arrayPersonages[row]
    imageSelection()
  }
}
