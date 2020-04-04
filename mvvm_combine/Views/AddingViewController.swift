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
    private let addStackView = FactoryView.addStackView
    private let typeTextField = FactoryView.typeTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        addSubviews()
        setUpConstraints()
        configureViews()
    }
    
    private func addSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(typeTextField)
        view.addSubview(addStackView)
    }
    
    private func setUpConstraints() {
        addStackView.snp.makeConstraints{
            $0.center.equalTo(view.center)
        }
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
    }
    
    
    private struct FactoryView {
        static var addStackView: UIStackView {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            //nameTextField()
            //typeTextField()
            return stackView
        }
        
        static var nameTextField: UITextField {
            let textField = UITextField()
            textField.placeholder = "Name"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = true
            addStackView.addArrangedSubview(textField)
            return textField
        }
        
        static var typeTextField: UITextField {
            let secondtextField = UITextField()
            secondtextField.placeholder = "Type"
            secondtextField.textAlignment = .center
            secondtextField.tintColor = .clear
            secondtextField.borderStyle = .roundedRect
            secondtextField.isUserInteractionEnabled = true
            addStackView.addArrangedSubview(secondtextField)
            return secondtextField
        }
    }
}
