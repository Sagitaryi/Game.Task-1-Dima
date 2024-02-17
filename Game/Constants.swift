import UIKit

enum Constants {
  enum PersonagesImages: String {
    case druidLeft = "DruidLeft"
    case druidRight = "DruidRight"
    case mageLeft = "MageLeft"
    case mageRight = "MageRight"
    case warriorLeft = "WarriorLeft"
    case warriorRight = "WarriorRight"
    
    static func imageSelection(personageClass: Player.PersonageClass, isWeaponRightHand: Bool) -> UIImage {
      var imagePersonage: UIImage? = UIImage()
      
      switch personageClass {
      case .warrior:
        if isWeaponRightHand {
          imagePersonage = UIImage(named:PersonagesImages.warriorRight.rawValue)
        } else {
          imagePersonage = UIImage(named: PersonagesImages.warriorLeft.rawValue)
        }
      case .mage:
        if isWeaponRightHand {
          imagePersonage = UIImage(named:PersonagesImages.mageRight.rawValue)
        } else {
          imagePersonage = UIImage(named: PersonagesImages.mageLeft.rawValue)
        }
      case .druid:
        if isWeaponRightHand {
          imagePersonage = UIImage(named:PersonagesImages.druidRight.rawValue)
        } else {
          imagePersonage = UIImage(named: PersonagesImages.druidLeft.rawValue)
        }
      }
      guard let image = imagePersonage else { return UIImage() }
      return image
    }
  }
  
}
