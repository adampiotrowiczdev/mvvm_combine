//
//  TableViewCell.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 27/03/2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let stack = UIStackView()
    let label = UILabel()
    let label2 = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.lightGray
        label.text = "TEST"
        label.backgroundColor = .red
        label2.backgroundColor = .blue
        addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(25)
        }
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(label2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
