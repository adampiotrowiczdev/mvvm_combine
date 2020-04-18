//
//  BeerCell.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/04/2020.
//

import UIKit

private struct Consts {
    static let cornerRadius: CGFloat = 8
    static let spacing: CGFloat = 5
    static let horizontalStackSpacing: CGFloat = 16
    static let stackConstraintsInset: CGFloat = 16
    static let containerCoinstraintsInset: CGFloat = 16
    static let containerTopBottConstr: Double = 1
}

class BeerCell: UITableViewCell {
    
    @objc var tapped: (()->())?
    let nameLabel = FactoryView.whiteTextLabel
    let descriptionLabel = FactoryView.whiteTextLabel
    let percentageLabel = FactoryView.whiteTextLabel
    let beerContainer = FactoryView.beerContainer
    let horizontalStack = FactoryView.horizontalStack
    let beerCapImageView = FactoryView.beerCapImageView
    let stackView = FactoryView.stackView
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpConstraints()
        configureViews()
    }
    
    @objc func cellTapped() {
        tapped?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        stackView.addArrangedSubviews([nameLabel, descriptionLabel, percentageLabel])
        horizontalStack.addArrangedSubviews([beerCapImageView, stackView])
        beerContainer.addSubview(horizontalStack)
        contentView.addSubview(beerContainer)
    }
    
    private func setUpConstraints() {
        horizontalStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Consts.stackConstraintsInset)
        }
        beerCapImageView.snp.makeConstraints {
            $0.width.equalTo(beerCapImageView.snp.height)
        }
        beerContainer.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Consts.containerCoinstraintsInset)
            $0.top.bottom.equalToSuperview().inset(Consts.containerTopBottConstr)
        }
    }
    
    private func configureViews() {
        beerContainer.addTarget(self, action: #selector(cellTapped), for: .touchUpInside)
        selectionStyle = .none
    }
}

private struct FactoryView {
    
    static var beerContainer: UIControl {
        let control = UIControl()
        control.backgroundColor = R.color.gray()
        control.layer.cornerRadius = Consts.cornerRadius
        return control
    }
    
    static var horizontalStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = Consts.horizontalStackSpacing
        stack.isUserInteractionEnabled = false
        return stack
    }
    
    static var beerCapImageView: UIImageView {
        let imageView = UIImageView(image: R.image.beer_cap_50())
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static var stackView: UIStackView {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = Consts.spacing
        stack.isUserInteractionEnabled = false
        return stack
    }
    
    static var whiteTextLabel: UILabel {
        let label = UILabel()
        label.textColor = .white
        return label
    }
}


