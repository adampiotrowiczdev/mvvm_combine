//
//  BeersView.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 18/04/2020.
//

import UIKit
import Combine
import SnapKit

private struct Consts {
    static let percentageButtonWidthMultipliedBy = 0.45
    static let percentageButtonHeight = 45
    static let percentageButtonOffset = -100
    static let stackViewSpacing: CGFloat = 20
    static let beerCapImageHeight: CGFloat = 300
    static let buyButtonHeight: CGFloat = 50
    static let buyButtonTrailingLeadingInset: CGFloat = 16
    static let descriptionTextViewFontSize: CGFloat = 20
    static let titleLabelFontSize: CGFloat = 26
    static let buyButtonCornerRadius: CGFloat = 8
}

class DescriptionView: BaseView {
    
    private let mainStackView = FactoryView.stackView
    private let stackView = FactoryView.stackView
    private let spacer = UIView()
    private let descriptionTextView = FactoryView.descriptionTextView
    private let beerCapImageView = FactoryView.beerCapImageView
    private let titleLabel = FactoryView.titleLabel
    private let buyButton = FactoryView.buyButton
    private let scrollView = FactoryView.scrollView
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func addSubviews() {
        backgroundColor = .white
        stackView.addArrangedSubview(beerCapImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionTextView)
        stackView.addArrangedSubview(spacer)
        
        scrollView.addSubview(stackView)
        
        mainStackView.addArrangedSubview(scrollView)
        mainStackView.addArrangedSubview(buyButton)
        
        
        addSubview(mainStackView)
    }
    
    private func setUpConstraints() {
        mainStackView.snp.makeConstraints { view in
            view.edges.equalTo(safeAreaLayoutGuide)
        }
        stackView.snp.makeConstraints {view in
            view.edges.width.equalToSuperview()
        }
        beerCapImageView.snp.makeConstraints {view in
            view.height.equalTo(Consts.beerCapImageHeight)
        }
        buyButton.snp.makeConstraints { view in
            view.height.equalTo(Consts.buyButtonHeight)
            view.trailing.leading.equalToSuperview().inset(Consts.buyButtonTrailingLeadingInset)
        }
    }
}

private struct FactoryView {
    static var stackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = Consts.stackViewSpacing
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return stackView
    }
    
    static var descriptionTextView: UITextView {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isUserInteractionEnabled = false
        textView.text = "csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5 csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5 csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5 csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5csdfdfawefewqwfqewferfergergwefytj6ujhjreefw wefwefwqefwqefwqh565e j6 67j98o5"
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: Consts.descriptionTextViewFontSize)
        return textView
    }
    
    static var titleLabel: UILabel {
        let label = UILabel()
        label.text = "Bardzo smaczne piwko"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Consts.titleLabelFontSize)
        return label
    }
    
    static var buyButton : UIButton {
        let button = UIButton()
        button.setTitle("BUY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = Consts.buyButtonCornerRadius
        return button
    }
    
    static var beerCapImageView: UIImageView {
        let imageView = UIImageView(image: R.image.beer_cap_50())
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static var scrollView: UIScrollView {
        let scrollView = UIScrollView()
        return scrollView
    }
    
}
