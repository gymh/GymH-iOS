import UIKit
import WebKit

class Stundenplan: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://gymh.philippdormann.de/stundenplan/?platform=ios")!))
    }
}
