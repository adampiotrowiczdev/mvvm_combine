//
//  AddingViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 02/04/2020.
//

import UIKit
import Combine

class AddingViewController: BaseViewController<AddingViewModel> {
    
    private let nameTextField = FactoryView.nameTextField
    private let stackView = FactoryView.stackView
    private let descriptionTextField = FactoryView.descriptionTextField
    private let percentageTextField = FactoryView.percentageTextField
    private let addButton = FactoryView.addButton
    private let spacer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        addSubviews()
        setUpConstraints()
        configureViews()
        edgesForExtendedLayout = []
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        percentageTextField.delegate = self
    }
    
//    override func loadView() {
//        view = AddingView()
//    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(descriptionTextField)
        stackView.addArrangedSubview(percentageTextField)
        stackView.addArrangedSubview(spacer)
        stackView.addArrangedSubview(addButton)
        view.addSubview(stackView)
    }
    
    private func setUpConstraints() {
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(25)
        }
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        spacer.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
        addButton.addTarget(self, action:#selector(addTapped), for: .touchUpInside)
    }
    
    @objc func addTapped(_ sender : UIButton) {
        BeerViewModel.beers.append(BeerModel(name: nameTextField.text ?? "test1", description: descriptionTextField.text ?? "test2", alcoholPercentage: Double(percentageTextField.text ?? "0.0") ?? 0.0))
        viewModel.navigateToBeerView(viewController: self)
    }

}

extension AddingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


private struct FactoryView {
    static var stackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return stackView
    }
    
    static var nameTextField: UITextField {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.textAlignment = .center
        textField.tintColor = .clear
        textField.borderStyle = .roundedRect
        return textField
    }
    
    static var descriptionTextField: UITextField {
        let descriptiontextField = UITextField()
        descriptiontextField.placeholder = "Description"
        descriptiontextField.textAlignment = .center
        descriptiontextField.tintColor = .clear
        descriptiontextField.borderStyle = .roundedRect
        return descriptiontextField
    }
    
    static var percentageTextField: UITextField {
        let percentageTextField = UITextField()
        percentageTextField.placeholder = "Percentage"
        percentageTextField.textAlignment = .center
        percentageTextField.tintColor = .clear
        percentageTextField.borderStyle = .roundedRect
        return percentageTextField
    }
    
    static var addButton: UIButton {
        let button = UIButton()
        button.setTitle("Add beer", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .clear
        button.backgroundColor = .white
        return button
    }
}
