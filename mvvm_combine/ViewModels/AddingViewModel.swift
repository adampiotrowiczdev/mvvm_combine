//
//  AddingViewModel.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 02/04/2020.
//

import Combine

class AddingViewModel: BaseViewModelWithParameter<BeerModel> {
    
    func navigateToBeerView(viewController: UIViewController) {
        let beerViewModel = BeerViewModel()
        let beerViewController = BeerViewController(beerViewModel)
        viewController.navigationController?.popViewControllerAnimated(true)
    }
    //func addbeer() {
       //var beerViewModel = BeerModel(name: String, description: String, alcoholPercentage: Double)
    //}
}
