//
//  DescriptionViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/12/2019.
//

import UIKit
import Combine

class DescriptionViewController: BaseViewController<DescriptionViewModel> {
    
    private struct Consts {
        static let percentageButtonWidthMultipliedBy = 0.45
        static let percentageButtonHeight = 45
        static let percentageButtonOffset = -100
    }
    
    private let desctriptionTextField = FactoryView.descriptionTextField
    private let percentageButton = FactoryView.percentageButton
    
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
        view.addSubview(percentageButton)
    }
    
    private func setUpConstraints() {
        desctriptionTextField.snp.makeConstraints {
            $0.center.equalTo(view.center)
        }
        percentageButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Consts.percentageButtonWidthMultipliedBy)
            make.height.equalTo(Consts.percentageButtonHeight)
            make.bottom.equalTo(desctriptionTextField.snp.top).offset(Consts.percentageButtonOffset)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
        percentageButton.addTarget(self, action:#selector(percentageTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        viewModel.parameterSubject.sink { value in
            self.desctriptionTextField.text = value?.description
        }.store(in: &cancelBag)
    }
    
    @objc func percentageTapped(_ sender : UIButton) {
        viewModel.navigateToAlcoholPercentageView(viewController: self)
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
    
        static var percentageButton : UIButton {
            let button = UIButton()
            button.setTitle("Percentage", for: .normal)
            button.isEnabled = false
            return button
        }
    }
        
}
