//
//  AlcoholPercentageViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 08/01/2020.
//

import UIKit
import Combine

class AlcoholPercentageViewController: BaseViewController<AlcoholViewModel> {
    
    private let percentageTextField = FactoryView.percentageTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpConstraints()
        configureViews()
        
    }
    
    private func addSubviews() {
        view.addSubview(percentageTextField)
    }
    
    private func setUpConstraints() {
        percentageTextField.snp.makeConstraints {
            $0.center.equalTo(view.center)
        }
    }
    
    private func bindUI() {
        viewModel.parameterSubject.sink { value in
            self.percentageTextField.text = " \(value?.percentage) %"
        }.store(in: &cancelBag)
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
    }
        
    private struct FactoryView {
    
        static var percentageTextField: UITextField {
            let textField = UITextField()
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
    }
}
