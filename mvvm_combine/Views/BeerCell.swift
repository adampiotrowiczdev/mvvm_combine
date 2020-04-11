//
//  BeerCell.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 10/04/2020.
//

import UIKit

private struct Consts {
    static let cornerRadius : CGFloat = 8
    static let spacing : CGFloat = 5
    static let stackConstraintsInset : CGFloat = 16
    static let containerCoinstraintsInset : CGFloat = 16
    static let containerTopBottConstr : Double = 1
}

class BeerCell: UITableViewCell {
    
    @objc var tapped: (()->())?
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let percentageLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let container = UIControl()
        container.backgroundColor = R.color.gray()
        container.layer.cornerRadius = Consts.cornerRadius
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(percentageLabel)
        nameLabel.textColor = UIColor.white
        descriptionLabel.textColor = UIColor.white
        percentageLabel.textColor = UIColor.white
        stack.spacing = Consts.spacing
        stack.isUserInteractionEnabled = false
        container.addSubview(stack)
        contentView.addSubview(container)
        selectionStyle = .none
        
        container.addTarget(self, action: #selector(cellTapped), for: .touchUpInside)

        stack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Consts.stackConstraintsInset)
        }
        container.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Consts.containerCoinstraintsInset)
            $0.top.bottom.equalToSuperview().inset(Consts.containerTopBottConstr)
        }
    }
    
    @objc func cellTapped() {
        tapped?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
