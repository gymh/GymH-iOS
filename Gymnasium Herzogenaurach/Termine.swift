import UIKit
import WebKit

class Termine: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://gymh.philippdormann.de/termine/?platform=ios")!))
    }
}
