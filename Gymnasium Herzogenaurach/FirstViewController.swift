import UIKit
import WebKit

class FirstViewController: UIViewController {
    var stringURL = "https://gymh.philippdormann.de/vertretungsplan/"
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var montag: UIButton!
    @IBOutlet weak var dienstag: UIButton!
    @IBOutlet weak var mittwoch: UIButton!
    @IBOutlet weak var donnerstag: UIButton!
    @IBOutlet weak var freitag: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showLehrerNames = UserDefaults.standard.bool(forKey: "lehrer-full-name")
        if showLehrerNames {
            stringURL = addToURL(url: stringURL, key: "display-lehrer-full", value: "")
        }
        
        let showWeek = UserDefaults.standard.bool(forKey: "wochenansicht")
        if showWeek {
            stringURL = "https://gymh.philippdormann.de/vertretungsplan/week.php"
            if showLehrerNames {
                stringURL = addToURL(url: stringURL, key: "display-lehrer-full", value: "")
            }
            montag.isHidden = true
            dienstag.isHidden = true
            mittwoch.isHidden = true
            donnerstag.isHidden = true
            freitag.isHidden = true
        }
        
        let filter = UserDefaults.standard.string(forKey: "filter")
        if (filter != "" && filter != nil) {
            stringURL = addToURL(url: stringURL, key: "f", value: filter!)
        }
        
        var themeID = UserDefaults.standard.string(forKey: "theme")
        if (themeID == "" || themeID == nil) {
            themeID = "1"
        }
        
        stringURL = addToURL(url: stringURL, key: "theme-id", value: themeID!)
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedin")
        if(loggedIn){
            webView.load(URLRequest(url: URL(string: stringURL)!))
        }
        
        stringURL = addToURL(url: stringURL, key: "platform", value: "ios")    }
    
    override func viewDidAppear(_ animated: Bool) {
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedin")
        if(!loggedIn){
            login()
            self.webView.load(URLRequest(url: URL(string: "https://gymh.philippdormann.de/login/")!))
        }
    }
    
    func login(){
        let alert = UIAlertController(title: "Login notwendig", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Passwort Schulwebseite"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(String) in
            let textField = alert.textFields![0]
            if(textField.text! == "gym09"){
                UserDefaults.standard.set(true, forKey: "loggedin")
                self.webView.load(URLRequest(url: URL(string: self.stringURL)!))
            } else {
                self.login()
            }
        }))
        self.present(alert, animated: true,completion: nil)
    }
    
    @IBAction func montag(_ sender: UIButton) {
        webView.load(URLRequest(url: URL(string: stringURL+"&d=mo")!))
    }
    @IBAction func dienstag(_ sender: UIButton) {
        webView.load(URLRequest(url: URL(string: stringURL+"&d=di")!))
    }
    @IBAction func mittwoch(_ sender: UIButton) {
        webView.load(URLRequest(url: URL(string: stringURL+"&d=mi")!))
    }
    @IBAction func donnerstag(_ sender: UIButton) {
        webView.load(URLRequest(url: URL(string: stringURL+"&d=do")!))
    }
    @IBAction func freitag(_ sender: UIButton) {
        webView.load(URLRequest(url: URL(string: stringURL+"&d=fr")!))
    }
    
    func addToURL(url: String, key: String, value: String) -> String {
        var returnURL = url
        if returnURL.lowercased().range(of: "?") != nil {
            returnURL += "&"
        } else {
            returnURL += "?"
        }
        returnURL += key
        if value != "" {
            returnURL += "="+value
        }
        return returnURL
    }
}
