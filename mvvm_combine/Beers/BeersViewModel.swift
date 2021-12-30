//
//  BeerViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 01/12/2019.
//

import Combine
import UIKit

class BeersViewModel: BaseViewModel {

    let newBeerSubject = PassthroughSubject<BeerModel, Never>()
    let beerNames = CurrentValueSubject<[BeerModel], Never>([])
    var selectedBeer = CurrentValueSubject<BeerModel?, Never>(nil)
    let networkService: NetworkManager
    var cancelBag = CancelBag()
    
    required init() {
        self.networkService = NetworkManager()
        super.init()
        newBeerSubject.sink { [weak self] beer in
            guard let self = self else { return }
            self.beerNames.value.append(beer)
            self.beerNames.send(self.beerNames.value)
        }.store(in: &cancelBag)
    }
    
    func fetchBeerNames() {
        //beerNames.send(BaseViewModel.beers)
        networkService.fetch(url: "https://beersapi.herokuapp.com/beers", subject: beerNames)
    }
    
    func navigateToDescriptionView(viewController: UIViewController) {
        guard let parameter = selectedBeer.value else { return }
        let descriptionViewModel = DescriptionViewModel(parameter)
        let descriptionViewController = DescriptionViewController(descriptionViewModel)
        viewController.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
    func navigateToAddingView(viewController: UIViewController) {
        let addingViewModel = AddingViewModel(newBeerSubject: newBeerSubject)
        let addingViewController = AddingViewController(addingViewModel)
        viewController.navigationController?.pushViewController(addingViewController, animated: true)
    }
}
