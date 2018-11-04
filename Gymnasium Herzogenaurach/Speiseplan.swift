import UIKit
import WebKit

class Speiseplan: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://gymh.philippdormann.de/mensaplan/?platform=ios")!))
    }
}
