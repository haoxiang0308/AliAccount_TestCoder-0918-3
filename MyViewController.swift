import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemBackground
    }

    override func loadView() {
        super.loadView()
        // Create the main view
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        self.view = view
    }
}