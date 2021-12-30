//
//  AddingViewModel.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 02/04/2020.
//

import Combine
import UIKit

class AddingViewModel: BaseViewModel {

    let newBeerSubject: PassthroughSubject<BeerModel, Never>

    init(newBeerSubject: PassthroughSubject<BeerModel, Never>) {
        self.newBeerSubject = newBeerSubject
        super.init()
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    func navigateToBeerView(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
