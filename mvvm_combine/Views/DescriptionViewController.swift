//
//  DescriptionViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/12/2019.
//

import Foundation
import UIKit

class DescriptionViewController: BaseViewController<DescriptionViewModel> {
    
//    private struct Consts {
//        static let beerTextFieldFontSize : CGFloat = 20
//        static let beetTextFieldTopOffset : CGFloat = 50
//        static let toastShowingTime : Double = 1
//    }
    
    private let desctriptionTextField = FactoryView.descriptionTextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        addSubviews()
        setUpConstraints()
        desctriptionTextField.text = viewModel.parameter.description
    }
    
    private func addSubviews() {
        view.addSubview(desctriptionTextField)
    }
    
    private func setUpConstraints() {
        desctriptionTextField.snp.makeConstraints {
            $0.center.equalTo(view.center)
        }
    }
    
    private struct FactoryView {
                
        static var descriptionTextField: UITextField {
            let textField = UITextField()
            textField.tintColor = .clear
            textField.backgroundColor = R.color.tomato()
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
    }
}
