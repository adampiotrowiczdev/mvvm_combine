//
//  BeerViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 02/12/2019.
//

import UIKit
import SnapKit
import Combine


class BeerViewController: BaseViewController<BeerViewModel, BeersView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        configureViews()
        viewCasted.tableView.dataSource = self
    }
    
    override func loadView() {
        view = viewCasted
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchBeerNames()
        viewCasted.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func configureViews() {
        isNavigationBarHidden = true
        viewCasted.floatingAddButton.addTarget(self, action:#selector(addTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        viewModel.selectedBeer.sink(receiveValue: { value in
            guard let beer = value else { return }
            self.view.endEditing(true)
        }).store(in: &cancelBag)
    }
    
    func beerTapped(beer: BeerModel) {
        viewModel.selectedBeer.send(beer)
        viewModel.navigateToDescriptionView(viewController: self)
    }
    
    @objc func addTapped(_ sender : UIButton) {
        viewModel.navigateToAddingView(viewController: self)
    }
}

extension BeerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BaseViewModel.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        let beer = BaseViewModel.beers[indexPath.row]
        cell.nameLabel.text = beer.name
        cell.descriptionLabel.text = beer.description
        cell.percentageLabel.text = String(beer.alcoholPercentage) + "%"
        cell.tapped = { [weak self] in
            self?.beerTapped(beer: beer)
        }
        return cell
    }
}
