import UIKit
import WebKit

class Termine: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://gymh.philippdormann.de/termine/?platform=ios")!))
        
        guard let url = URL(string: "https://gymh.philippdormann.de/termine/api.php?out") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
                
                //TODO: parse json, display natively
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}
