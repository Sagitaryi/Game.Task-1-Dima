import UIKit

class PlayerVC: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var personageClassPicker: UIPickerView!
    @IBOutlet var personageImageView: UIImageView!
    @IBOutlet var weaponHandSelectionSwitch: UISwitch!
    @IBOutlet var mainLabel: UILabel!

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

    @IBAction func nextVCButtonPressed(_: UIButton) {
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
            isWeaponRightHand: isWeaponRightHand
        )
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
