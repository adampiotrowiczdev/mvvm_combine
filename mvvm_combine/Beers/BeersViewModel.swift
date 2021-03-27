//
//  BeerViewModel.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 01/12/2019.
//

import Combine
import UIKit

struct RestaurantModel: Codable {
    let restaurantID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case restaurantID = "restaurantId"
        case name
    }
}


class BeersViewModel: BaseViewModel {

    let newBeerSubject = PassthroughSubject<BeerModel, Never>()
    let beerNames = CurrentValueSubject<[BeerModel], Never>([])
    let restaurants = CurrentValueSubject<[RestaurantModel], Never>([])
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
    
    override func viewDidAppear() {
        fetchBeerNames()
        fetchRestaurants()
    }
    
    private func fetchRestaurants() {
        //beerNames.send(BaseViewModel.beers)
        //networkService.fetch(url: "https://beersapi.herokuapp.com/beers", subject: beerNames)
        if let url = URL(string: "https://restaurantdotnetapi.herokuapp.com/restaurants") {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
                if let data = data {
                    do {
                        let object = try JSONDecoder().decode([RestaurantModel].self, from: data)
                        DispatchQueue.main.async {
                            self?.restaurants.send(object)
                            print(object)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func fetchBeerNames() {
        //beerNames.send(BaseViewModel.beers)
        //networkService.fetch(url: "https://beersapi.herokuapp.com/beers", subject: beerNames)
        if let url = URL(string: "https://beersapi.herokuapp.com/beers") {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
                if let data = data {
                    do {
                        let object = try JSONDecoder().decode([BeerModel].self, from: data)
                        DispatchQueue.main.async {
                            self?.beerNames.send(object)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
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
