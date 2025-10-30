import UIKit

class ViewController_12345: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var mainButton: UIButton?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Additional setup before the view appears
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        titleLabel?.text = "Welcome to My App"
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        if let button = mainButton {
            button.setTitle("Tap Me", for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
        }
    }
    
    // MARK: - Actions
    @IBAction func mainButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hello", message: "Button was tapped!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Helper Methods
    private func performAction() {
        // Add any additional functionality here
    }
}