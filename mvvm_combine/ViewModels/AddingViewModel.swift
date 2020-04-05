//
//  AddingViewModel.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 02/04/2020.
//

import Combine
import UIKit

class AddingViewModel: BaseViewModel {
    
    func navigateToBeerView(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    //func addbeer() {
       //var beerViewModel = BeerModel(name: String, description: String, alcoholPercentage: Double)
    //}
}
