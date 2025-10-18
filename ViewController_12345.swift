import UIKit

class MyViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "My View"
        
        // Add any additional setup here
        setupConstraints()
    }
    
    private func setupConstraints() {
        // Add your UI constraints here
    }
    
    // MARK: - Actions
    @objc private func handleButtonTap() {
        // Handle button tap action
        print("Button tapped!")
    }
}