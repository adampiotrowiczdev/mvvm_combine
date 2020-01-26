//
//  BeerModel.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 13/12/2019.
//

struct BeerModel: Codable {
    let name: String
    let description: String
}

extension BeerModel: CombinePickerViewDataType {
    var rowName: String {
        return name
    }
}
