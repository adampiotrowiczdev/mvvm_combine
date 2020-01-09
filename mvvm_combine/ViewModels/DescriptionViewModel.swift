//
//  DescriptionViewModel.swift
//  mvvm_combine
//
//  Created by Jakub Andruszak on 28/12/2019.
//

import Combine
import UIKit

class DescriptionViewModel : BaseViewModelWithParameter<BeerModel> {
    
    func navigateToAlcoholPercentageView(viewController: UIViewController) {
        
        let alcoholPercentageViewController = AlcoholPercentageViewController()
        viewController.navigationController?.pushViewController(alcoholPercentageViewController, animated: true)
    }
}
 
