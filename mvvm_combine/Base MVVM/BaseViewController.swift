//
//  BaseViewController.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 07/12/2019.
//

import UIKit

class BaseViewController<T:BaseViewModel>: UIViewController {

    var viewModel: T = T()
}
