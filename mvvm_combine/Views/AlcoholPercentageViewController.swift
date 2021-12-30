//
//  AlcoholPercentageViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 08/01/2020.
//

import UIKit
import Combine

class AlcoholPercentageViewController: BaseViewController<AlcoholPercentageViewModel, BaseView> {
    
    private struct Consts {
        static let stackViewConstraints: CGFloat = 100
        static let stackViewSpacing: CGFloat = 0
        static let scrollInsetTop: CGFloat = 100
        static let scrollInsetBottom: CGFloat = 100
        static let scrollInsetLeft: CGFloat = 100
        static let scrollInsetRight: CGFloat = 100
    }
    
    private let percentageTextField = FactoryView.percentageTextField
    private let stackView = FactoryView.stackView
    private let exampleTextField1 = FactoryView.exampleTextField1
    private let exampleTextField2 = FactoryView.exampleTextField2
    private let exampleTextField3 = FactoryView.exampleTextField3
    private let exampleTextField4 = FactoryView.exampleTextField4
    private let exampleTextField5 = FactoryView.exampleTextField5
    private let exampleTextField6 = FactoryView.exampleTextField6
    private let exampleTextField7 = FactoryView.exampleTextField7
    private let exampleTextField8 = FactoryView.exampleTextField8
    private let exampleTextField9 = FactoryView.exampleTextField9
    private let exampleTextField10 = FactoryView.exampleTextField10
    private let exampleTextField11 = FactoryView.exampleTextField11
    private let exampleTextField12 = FactoryView.exampleTextField12
    private let exampleTextField13 = FactoryView.exampleTextField13
    private let exampleTextField14 = FactoryView.exampleTextField14
    private let exampleTextField15 = FactoryView.exampleTextField15
    private let exampleTextField16 = FactoryView.exampleTextField16
    private let exampleTextField17 = FactoryView.exampleTextField17
    private let exampleTextField18 = FactoryView.exampleTextField18
    private let exampleTextField19 = FactoryView.exampleTextField19
    private let exampleTextField20 = FactoryView.exampleTextField20
    private let exampleTextField21 = FactoryView.exampleTextField21
    private let exampleTextField22 = FactoryView.exampleTextField22
    private let exampleTextField23 = FactoryView.exampleTextField23
    private let scrollView = FactoryView.scrollView
    private let spacer = UIView()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSubviews()
        setUpConstraints()
        configureViews()
        bindUI()
    }
    
    private func addSubviews() {
        stackView.addArrangedSubview(percentageTextField)
        stackView.addArrangedSubview(exampleTextField1)
        stackView.addArrangedSubview(exampleTextField2)
        stackView.addArrangedSubview(exampleTextField3)
        stackView.addArrangedSubview(exampleTextField4)
        stackView.addArrangedSubview(exampleTextField5)
        stackView.addArrangedSubview(exampleTextField6)
        stackView.addArrangedSubview(exampleTextField7)
        stackView.addArrangedSubview(exampleTextField8)
        stackView.addArrangedSubview(exampleTextField9)
        stackView.addArrangedSubview(exampleTextField10)
        stackView.addArrangedSubview(exampleTextField11)
        stackView.addArrangedSubview(exampleTextField12)
        stackView.addArrangedSubview(exampleTextField13)
        stackView.addArrangedSubview(exampleTextField14)
        stackView.addArrangedSubview(exampleTextField15)
        stackView.addArrangedSubview(exampleTextField16)
        stackView.addArrangedSubview(exampleTextField17)
        stackView.addArrangedSubview(exampleTextField18)
        stackView.addArrangedSubview(exampleTextField19)
        stackView.addArrangedSubview(exampleTextField20)
        stackView.addArrangedSubview(exampleTextField21)
        stackView.addArrangedSubview(exampleTextField22)
        stackView.addArrangedSubview(exampleTextField23)
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
    }
    
    private func setUpConstraints() {
        scrollView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: Consts.scrollInsetTop, left: Consts.scrollInsetLeft, bottom: Consts.scrollInsetBottom, right: Consts.scrollInsetBottom))
        }
        stackView.snp.makeConstraints { make -> Void in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        spacer.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private func bindUI() {
        viewModel.parameterSubject.sink { value in
            self.percentageTextField.text = " \(String(value?.alcoholPercentage ?? 0)) %"
        }.store(in: &cancelBag)
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
    }
        
    private struct FactoryView {
        static var scrollView: UIScrollView {
            let scrollView = UIScrollView()
            scrollView.addSubview(stackView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }
            
        static var stackView: UIStackView {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.spacing = Consts.stackViewSpacing
            return stackView
        }
    
        static var percentageTextField: UITextField {
            let textField = UITextField()
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField1: UITextField {
            let textField = UITextField()
            textField.placeholder = "1"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField2: UITextField {
            let textField = UITextField()
            textField.placeholder = "2"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField3: UITextField {
            let textField = UITextField()
            textField.placeholder = "3"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField4: UITextField {
            let textField = UITextField()
            textField.placeholder = "4"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField5: UITextField {
            let textField = UITextField()
            textField.placeholder = "5"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField6: UITextField {
            let textField = UITextField()
            textField.placeholder = "6"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField7: UITextField {
            let textField = UITextField()
            textField.placeholder = "7"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField8: UITextField {
            let textField = UITextField()
            textField.placeholder = "8"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField9: UITextField {
            let textField = UITextField()
            textField.placeholder = "9"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField10: UITextField {
            let textField = UITextField()
            textField.placeholder = "10"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField11: UITextField {
            let textField = UITextField()
            textField.placeholder = "11"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField12: UITextField {
            let textField = UITextField()
            textField.placeholder = "12"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField13: UITextField {
            let textField = UITextField()
            textField.placeholder = "13"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField14: UITextField {
            let textField = UITextField()
            textField.placeholder = "14"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField15: UITextField {
            let textField = UITextField()
            textField.placeholder = "15"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField16: UITextField {
            let textField = UITextField()
            textField.placeholder = "16"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField17: UITextField {
            let textField = UITextField()
            textField.placeholder = "17"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField18: UITextField {
            let textField = UITextField()
            textField.placeholder = "18"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField19: UITextField {
            let textField = UITextField()
            textField.placeholder = "19"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField20: UITextField {
            let textField = UITextField()
            textField.placeholder = "20"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField21: UITextField {
            let textField = UITextField()
            textField.placeholder = "21"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField22: UITextField {
            let textField = UITextField()
            textField.placeholder = "22"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
        
        static var exampleTextField23: UITextField {
            let textField = UITextField()
            textField.placeholder = "23"
            textField.textAlignment = .center
            textField.tintColor = .clear
            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = false
            return textField
        }
    }
}
