//
//  DescriptionViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/12/2019.
//

import UIKit
import Combine
import LoremIpsum

class DescriptionViewController: BaseViewController<DescriptionViewModel, BaseView> {
    
    private struct Consts {
        static let percentageButtonWidthMultipliedBy = 0.45
        static let percentageButtonHeight = 45
        static let percentageButtonOffset = -100
        static let numberOfSentencesLoremIpsum = 50
        static let scrollViewEdgesInset = 16
        static let loremIpsumLabelTopOffset = 30
        static let loremIpsumLabelWidthOffset = 16
    }
    
    private let desctriptionTextField = FactoryView.descriptionTextField
    private let percentageButton = FactoryView.percentageButton
    private let loremIpsumLabel = FactoryView.loremIpsumLabel
    private let scrollView = FactoryView.scrollView
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .systemOrange
        addSubviews()
        setUpConstraints()
        configureViews()
        bindUI()
    }
    
    private func addSubviews() {
        scrollView.addSubview(desctriptionTextField)
        scrollView.addSubview(percentageButton)
        scrollView.addSubview(loremIpsumLabel)
        view.addSubview(scrollView)
    }
    
    private func setUpConstraints() {
        desctriptionTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        percentageButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(Consts.percentageButtonWidthMultipliedBy)
            make.height.equalTo(Consts.percentageButtonHeight)
            make.bottom.equalTo(desctriptionTextField.snp.top).offset(Consts.percentageButtonOffset)
            make.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Consts.scrollViewEdgesInset)
        }
        
        loremIpsumLabel.snp.makeConstraints { make in
            make.left.equalTo(scrollView)
            make.top.equalTo(desctriptionTextField.snp.bottom).offset(Consts.loremIpsumLabelTopOffset)
            make.bottom.equalTo(scrollView)
            make.width.equalToSuperview().inset(Consts.loremIpsumLabelWidthOffset)
        }
    }
    
    private func configureViews() {
        view.backgroundColor = R.color.gray()
        percentageButton.addTarget(self, action:#selector(self.percentageTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        viewModel.parameterSubject.sink { value in
            self.desctriptionTextField.text = value?.description
        }.store(in: &cancelBag)
    }
    
    @objc func percentageTapped(_ sender: UIButton) {
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
            return button
        }
        
        static var scrollView: UIScrollView {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }
        
        static var loremIpsumLabel: UILabel {
            let label = UILabel()
            let sentences = LoremIpsum.sentences(withNumber: Consts.numberOfSentencesLoremIpsum)
            label.text = sentences
            label.textColor = UIColor.black
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.sizeToFit()
            return label
        }
    }
}
