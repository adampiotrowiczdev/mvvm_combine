//
//  ViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 02/12/2019.
//

import UIKit
import SnapKit
import Combine

class BeerViewController: BaseViewController<BeerViewModel> {
    
    private struct Consts {
        static let beerTextFieldFontSize : CGFloat = 20
        static let beetTextFieldTopOffset : CGFloat = 50
        static let floatingButtonSize : CGFloat = 50
        static let toastShowingTime : Double = 1
    }
    
    private let drinkButton = FactoryView.drinkButton
    private let beerPicker = FactoryView.beerPicker
    private let beerTextField = FactoryView.beerTextField
    private let floatingAddButton = FactoryView.floatingAddButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpConstraints()
        configureViews()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         viewModel.fetchBeerNames()
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
     }

    private func addSubviews() {
        view.addSubview(drinkButton)
        view.addSubview(beerTextField)
        view.addSubview(floatingAddButton)
    }
    
    private func setUpConstraints() {
        beerTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(Consts.beetTextFieldTopOffset)
            $0.width.equalToSuperview()
        }
        drinkButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        floatingAddButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(Consts.floatingButtonSize)
            $0.size.equalTo(Consts.floatingButtonSize)
        }
    }
    
    private func configureViews() {
        isNavigationBarHidden = true
        view.backgroundColor = R.color.gray()
        beerTextField.inputView = beerPicker
        drinkButton.addTarget(self, action:#selector(drinkTapped), for: .touchUpInside)
        floatingAddButton.addTarget(self, action:#selector(drinkTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        cancelBag.collect {
            viewModel.beerNames.sink( receiveValue: { value in
                self.beerPicker.pickerData = value
            })
            beerPicker.selectedValue.subscribe(viewModel.selectedBeer)
            viewModel.selectedBeer.sink(receiveValue: { value in
                self.drinkButton.isEnabled = value != nil
                guard let beer = value else { return }
                self.beerTextField.text = beer.name
                self.view.endEditing(true)
            })
        }
    }
    
    @objc func drinkTapped(_ sender : UIButton) {
        viewModel.navigateToDescriptionView(viewController: self)
    }
    
    private struct FactoryView {
        static var drinkButton : UIButton {
            let button = UIButton()
            button.setTitle("DRINK", for: .normal)
            button.isEnabled = false
            return button
        }
        
        static var beerPicker : CombinePickerView<BeerModel> {
            let picker = CombinePickerView<BeerModel>()
            return picker
        }
        
        static var beerTextField: UITextField {
            let textField = UITextField()
            textField.tintColor = .clear
            textField.backgroundColor = R.color.light_gray()
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: Consts.beerTextFieldFontSize)
            textField.textAlignment = .center
            textField.textColor = .white
            textField.attributedPlaceholder = NSAttributedString(string: "Choose your taste here",
            attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])
            return textField
        }
        
        static var floatingAddButton: UIButton {
            let button = UIButton()
            button.contentHorizontalAlignment = .center;
            button.titleLabel?.font = button.titleLabel?.font.withSize(30)
            button.setTitleColor(R.color.gray(), for: .normal)
            button.setTitle("+", for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = Consts.floatingButtonSize/2
            return button
        }
    }
    
}
