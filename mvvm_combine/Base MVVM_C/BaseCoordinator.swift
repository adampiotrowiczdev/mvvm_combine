//
//  BaseCoordinator.swift
//  mvvm_combine
//
//  Created by apiotrowicz on 05/01/2020.
//

protocol Coordinator {
    func start()
    func coordinate<T:Coordinator>(to: T)
}

class BaseCoordinator<T:Coordinator> : Coordinator{
    func start() {
        coordinate
    }
    
    func coordinate<T>(to: T) where T : Coordinator {
        <#code#>
    }
    
}
