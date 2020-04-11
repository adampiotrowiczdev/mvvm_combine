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
    
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let container = UIView()
        container.backgroundColor = R.color.gray()
        container.layer.cornerRadius = Consts.cornerRadius
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.addArrangedSubview(label1)
        stack.addArrangedSubview(label2)
        stack.addArrangedSubview(label3)
        label1.textColor = UIColor.white
        label2.textColor = UIColor.white
        label3.textColor = UIColor.white
        stack.spacing = Consts.spacing
        container.addSubview(stack)
        contentView.addSubview(container)

        stack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Consts.stackConstraintsInset)
      }
        container.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(Consts.containerCoinstraintsInset)
            $0.top.bottom.equalToSuperview().inset(Consts.containerTopBottConstr)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
