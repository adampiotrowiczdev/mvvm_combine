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
        guard let parameter = parameterSubject.value else { return }
        let descriptionViewModel = AlcoholViewModel(parameter)
        let descriptionViewController = AlcoholPercentageViewController(descriptionViewModel)
        viewController.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
}

