import UIKit

class PlayerVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var personageClassPicker: UIPickerView!
    @IBOutlet var personageImageView: UIImageView!
    @IBOutlet var weaponHandSelectionSwitch: UISwitch!
    @IBOutlet var mainLabel: UILabel!

    // MARK: - let/var

    var arrayPersonages = PlayerClass.PersonageClass.allCases
    var nickName: String = ""
    var imagePersonage = UIImage() {
        didSet {
            personageImageView.image = imagePersonage
        }
    }

    var selectedClass: PlayerClass.PersonageClass = .warrior

    var isWeaponRightHand = true {
        didSet {
            imageSelection()
        }
    }

    var isFirstPlayerCreated = false

    // MARK: - lifecicle funcs

    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func nextVCButtonPressed(_: UIButton) {
        if !isFirstPlayerCreated {
            checkNameAvailability()
            createPlayer()
            isFirstPlayerCreated = true
            clearingPersonageFields()
        } else {
            checkNameAvailability()
            createPlayer()
            navigation()
        }
    }

    // MARK: - flow funcs

    func imageSelection() {
        imagePersonage = Constants.PersonagesImages.imageSelection(personageClass: selectedClass,
                                                                   isWeaponRightHand: isWeaponRightHand)
    }

    func checkNameAvailability() {
        if nickName.isEmpty {
            if !isFirstPlayerCreated {
                nickName = "Player 1"
            } else {
                nickName = "Player 2"
            }
        }
    }

    func choiceWeapons(selectedClass: PlayerClass.PersonageClass) -> Weapon {
        switch selectedClass {
        case .warrior:
            return Armory.sekira
        case .mage:
            return Armory.magesStave
        case .druid:
            return Armory.druidStave
        }
    }

    func createPlayer() {
        if !isFirstPlayerCreated {
            BattleClass.firstPlayer = PlayerClass(nickName: nickName,
                                                  personageImage: imagePersonage,
                                                  classSelection: selectedClass,
                                                  weapon: choiceWeapons(selectedClass: selectedClass))
        } else {
            BattleClass.secondPlayer = PlayerClass(nickName: nickName,
                                                   personageImage: imagePersonage,
                                                   classSelection: selectedClass,
                                                   weapon: choiceWeapons(selectedClass: selectedClass))
        }
    }

    func clearingPersonageFields() {
        mainLabel.text = "Create your second Personage:"
        nicknameTextField.text = ""
        nickName = ""
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
    func numberOfComponents(in _: UIPickerView) -> Int {
        1
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return arrayPersonages.count
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return arrayPersonages[row].rawValue
    }

    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
        selectedClass = arrayPersonages[row]
        imageSelection()
    }
}
