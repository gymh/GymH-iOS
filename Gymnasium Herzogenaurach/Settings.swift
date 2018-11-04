import UIKit

class Settings: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var filterInput: UITextField!
    @IBOutlet weak var wochenSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        let filter = UserDefaults.standard.string(forKey: "filter")
        self.filterInput.text = filter
        filterInput.delegate = self
        
        let switchState = UserDefaults.standard.bool(forKey: "wochenansicht")
        if switchState {
            wochenSwitch.setOn(true, animated: false)
        } else {
            wochenSwitch.setOn(false, animated: false)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        filterInput.resignFirstResponder()
        showAlert()
        return true
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Gespeichert", message: "", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true,completion: nil)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func filterChanged(_ sender: UITextField) {
        var text = filterInput.text?.uppercased()
        if (((text?.contains("11"))! || (text?.contains("12"))! || (text?.contains("13"))!) && !(text?.contains("Q"))!){
            text = "Q"+text!
        }
        filterInput.text = text
        UserDefaults.standard.set(text, forKey: "filter")
    }
    @IBAction func themeStandard(_ sender: UIButton) {
        UserDefaults.standard.set("1", forKey: "theme")
        showAlert()
    }
    @IBAction func themeRot(_ sender: UIButton) {
        UserDefaults.standard.set("4", forKey: "theme")
        showAlert()
    }
    @IBAction func themeSand(_ sender: UIButton) {
        UserDefaults.standard.set("27", forKey: "theme")
        showAlert()
    }
    @IBAction func themeRoseGold(_ sender: UIButton) {
        UserDefaults.standard.set("28", forKey: "theme")
        showAlert()
    }
    @IBAction func themeBlauGrau(_ sender: UIButton) {
        UserDefaults.standard.set("22", forKey: "theme")
        showAlert()
    }
    @IBAction func themeTeal(_ sender: UIButton) {
        UserDefaults.standard.set("12", forKey: "theme")
        showAlert()
    }
    @IBAction func themeMidnightblue(_ sender: UIButton) {
        UserDefaults.standard.set("25", forKey: "theme")
        showAlert()
    }
    @IBAction func themePinkFluffyUnicorn(_ sender: UIButton) {
        UserDefaults.standard.set("2", forKey: "theme")
        showAlert()
    }
    @IBAction func themeRainbow(_ sender: UIButton) {
        UserDefaults.standard.set("23", forKey: "theme")
        showAlert()
    }
    @IBAction func wochenansicht(_ sender: UISwitch) {
        if wochenSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "wochenansicht")
        } else {
            UserDefaults.standard.set(false, forKey: "wochenansicht")
        }
        showAlert()
    }
}
