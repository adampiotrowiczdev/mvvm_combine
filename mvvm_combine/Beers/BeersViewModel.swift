//
//  BeerViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 01/12/2019.
//

import Combine
import UIKit

class BeersViewModel: BaseViewModel {
    
    let beerNames = PassthroughSubject<[BeerModel], Never>()
    var selectedBeer = CurrentValueSubject<BeerModel?, Never>(nil)
    
    required init() {
        super.init()
    }
        
    func fetchBeerNames() {
        beerNames.send(BaseViewModel.beers)
    }
    
    func navigateToDescriptionView(viewController: UIViewController) {
        guard let parameter = selectedBeer.value else { return }
        let descriptionViewModel = DescriptionViewModel(parameter)
        let descriptionViewController = DescriptionViewController(descriptionViewModel)
        viewController.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
    func navigateToAddingView(viewController: UIViewController) {
        let addingViewModel = AddingViewModel()
        let addingViewController = AddingViewController(addingViewModel)
        viewController.navigationController?.pushViewController(addingViewController, animated: true)
    }
}
