//
//  DescriptionViewController.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/12/2019.
//

import UIKit
import Combine
import SnapKit

final class DescriptionViewController: BaseViewController<DescriptionViewModel, DescriptionView> {
    

    
//    private let mainStackView = FactoryView.stackView
//    private let stackView = FactoryView.stackView
//    private let spacer = UIView()
//    private let descriptionTextView = FactoryView.descriptionTextView
//    private let beerCapImageView = FactoryView.beerCapImageView
//    private let titleLabel = FactoryView.titleLabel
//    private let buyButton = FactoryView.buyButton
//    private let scrollView = FactoryView.scrollView
//
    
    //    private let percentageButton = FactoryView.percentageButton
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        self.view.backgroundColor = .systemOrange
    //        addSubviews()
    //        setUpConstraints()
    //        configureViews()
    //        bindUI()
    //   }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        addSubviews()
//        setUpConstraints()
//        //configureViews()
//        //bindUI()
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        self.edgesForExtendedLayout = []
//    }
    

    

    
    //        percentageButton.snp.makeConstraints { make in
    //            make.width.equalToSuperview().multipliedBy(Consts.percentageButtonWidthMultipliedBy)
    //            make.height.equalTo(Consts.percentageButtonHeight)
    //            make.bottom.equalTo(desctriptionTextField.snp.top).offset(Consts.percentageButtonOffset)
    //            make.centerX.equalToSuperview()
    //        }
    //    }
    
    //    private func configureViews() {
    //        view.backgroundColor = R.color.gray()
    //        percentageButton.addTarget(self, action:#selector(self.percentageTapped), for: .touchUpInside)
    //    }
    
    //    private func bindUI() {
    //        viewModel.parameterSubject.sink { value in
    //            self.desctriptionTextField.text = value?.description
    //        }.store(in: &cancelBag)
    //    }
    
    //    @objc func percentageTapped(_ sender: UIButton) {
    //        viewModel.navigateToAlcoholPercentageView(viewController: self)
    //    }
    
    //    private struct FactoryView {
    //
    //        static var descriptionTextField: UITextField {
    //            let textField = UITextField()
    //            textField.textAlignment = .center
    //            textField.tintColor = .clear
    //            textField.borderStyle = .roundedRect
    //            textField.isUserInteractionEnabled = false
    //            return textField
    //        }
    //
    //        static var percentageButton : UIButton {
    //            let button = UIButton()
    //            button.setTitle("Percentage", for: .normal)
    //            return button
    //        }
    //    }
    
//    private struct FactoryView {
//        static var stackView: UIStackView {
//            let stackView = UIStackView()
//            stackView.axis = .vertical
//            stackView.distribution = .fill
//            stackView.spacing = Consts.stackViewSpacing
//            stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            return stackView
//        }
//        
//        static var descriptionTextView: UITextView {
//            let textView = UITextView()
//            textView.textAlignment = .center
//            textView.isUserInteractionEnabled = false
//            textView.text = "csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5 csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5 csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5 csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5"
//            textView.isScrollEnabled = false
//            textView.font = .systemFont(ofSize: 20)
//            return textView
//        }
//        
//        static var titleLabel: UILabel {
//            let label = UILabel()
//            label.text = "Bardzo smaczne piwko"
//            label.textAlignment = .center
//            label.font = .systemFont(ofSize: 26)
//            return label
//        }
//        
//        static var buyButton : UIButton {
//            let button = UIButton()
//            button.setTitle("BUY", for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.backgroundColor = .black
//            button.layer.cornerRadius = 8
//            return button
//        }
//        
//        static var beerCapImageView: UIImageView {
//            let imageView = UIImageView(image: R.image.beer_cap_50())
//            imageView.contentMode = .scaleAspectFit
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }
//        
//        static var scrollView: UIScrollView {
//            let scrollView = UIScrollView()
//            return scrollView
//        }
//    }
    
}
