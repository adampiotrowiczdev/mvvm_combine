//
//  DescriptionViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/12/2019.
//

import UIKit
import Combine

class DescriptionViewController: BaseViewController<DescriptionViewModel> {
    
    private let desctriptionTextField = FactoryView.descriptionTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        addSubviews()
        setUpConstraints()
        configureViews()
        bindUI()
    }
    
    private func addSubviews() {
        view.addSubview(desctriptionTextField)
    }
    
    private func setUpConstraints() {
        desctriptionTextField.snp.makeConstraints {
            $0.center.equalTo(view.center)
        }
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
    }
    
    private func bindUI() {
        viewModel.parameterSubject.sink { value in
            self.desctriptionTextField.text = value?.description
        }.store(in: &cancelBag)
    }
    
    private struct FactoryView {
        
        static var descriptionTextField: UITextField {
            let textField = UITextField()
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
    }
}
