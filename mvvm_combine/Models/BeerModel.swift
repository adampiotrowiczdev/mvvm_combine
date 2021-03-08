//
//  BeerModel.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 13/12/2019.
//

struct BeerModel: Hashable {
    let name: String
    let description: String
    let alcoholPercentage: Double
}

extension BeerModel: CombinePickerViewDataType {
    var rowName: String {
        return name
    }
}
