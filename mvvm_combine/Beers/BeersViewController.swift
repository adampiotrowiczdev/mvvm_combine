//
//  BeersViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 02/12/2019.
//

import UIKit
import SnapKit
import Combine
import CombineDataSources


class BeersViewController: BaseViewController<BeersViewModel, BeersView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchBeerNames()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func configureViews() {
        isNavigationBarHidden = true
        viewCasted.floatingAddButton.addTarget(self, action:#selector(addTapped), for: .touchUpInside)
    }
    
    private func bindUI() {
        viewModel.beerNames
            .bind(subscriber: viewCasted.tableView.rowsSubscriber(cellIdentifier: "BeerCell", cellType: BeerCell.self, cellConfig: { cell, indexPath, model in
            cell.nameLabel.text = model.name
            cell.descriptionLabel.text = model.description
            cell.percentageLabel.text = String(model.alcoholPercentage) + "%"
            cell.tapped = { [weak self] in
                self?.beerTapped(beer: model)
            }
        })).store(in: &cancelBag)
    }
    
    func beerTapped(beer: BeerModel) {
        viewModel.selectedBeer.send(beer)
        viewModel.navigateToDescriptionView(viewController: self)
    }
    
    @objc func addTapped(_ sender : UIButton) {
        viewModel.navigateToAddingView(viewController: self)
    }
}
