import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to MyApp"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a sample view controller implementation"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // Add subviews
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(actionButton)
        
        // Setup constraints
        setupConstraints()
        
        // Setup actions
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 200),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc private func actionButtonTapped() {
        // Handle button tap
        let alert = UIAlertController(title: "Hello!", message: "You tapped the button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}