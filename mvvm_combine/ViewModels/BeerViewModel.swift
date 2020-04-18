//
//  ViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 01/12/2019.
//

import Combine
import UIKit

class BeerViewModel: BaseViewModel {
    
    let beerNames = CurrentValueSubject<[BeerModel]?, Never>(nil)
    var selectedBeer = CurrentValueSubject<BeerModel?, Never>(nil)
    let networkService: NetworkManager
    
    
    required init() {
        self.networkService = NetworkManager()
        super.init()
    }
    
    func fetchBeerNames() {
        networkService.fetch(url: "https://beersapi.herokuapp.com/beers", subject: beerNames)
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
