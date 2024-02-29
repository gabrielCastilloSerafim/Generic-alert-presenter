//
//  ViewController.swift
//  GenericAlertPresenter
//
//  Created by Gabriel Castillo Serafim on 28/2/24.
//

import UIKit

class ViewController: UIViewController {

    /// **Alert presenter helper
    private let alertPresenter: CRKAlertPresenterProtocol = CRKAlertPresenter()
    
    /// _Screen setup...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 80
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        stackView.addArrangedSubview(generateButton(background: .red, title: "My red button", selector: #selector(didTapRedButton)))
        stackView.addArrangedSubview(generateButton(background: .gray, title: "My gray button", selector: #selector(didTapGrayButton)))
        stackView.addArrangedSubview(generateButton(background: .green, title: "My green button", selector: #selector(didTapGreenButton)))
    }
    
    private func generateButton(background: UIColor, title: String, selector: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = background
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
    
    /// _Button actions...
    
    @objc private func didTapRedButton() {
        // MARK: Show alert with alert presenter
        let redButtonActionSheet: CRKAlertTypes = .redActionSheet(actionOneCompletion: myActionOneCompletion, actionTwoCompletion: myActionTwoCompletion)
        alertPresenter.showAlert(type: redButtonActionSheet, inVC: self)
    }
    
    @objc private func didTapGrayButton() {
        // MARK: Show alert with alert presenter
        let grayButtonActionSheet: CRKAlertTypes = .grayAlert(actionOneCompletion: myActionOneCompletion)
        alertPresenter.showAlert(type: grayButtonActionSheet, inVC: self)
    }
    
    @objc private func didTapGreenButton() {
        // MARK: Show alert with alert presenter
        let greenButtonActionSheet: CRKAlertTypes = .greenActionSheet(actionOneCompletion: myActionOneCompletion, actionTwoCompletion: myActionTwoCompletion)
        alertPresenter.showAlert(type: greenButtonActionSheet, inVC: self)
    }
    
    /// _Alert completion handlers...
    
    func myActionOneCompletion() {
        print("Hello from action one")
    }
    
    func myActionTwoCompletion() {
        print("Hello from action two")
    }
}

