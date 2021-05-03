//
//  CarProvider.swift
//  lesson3=mvc
//
//  Created by Бейбарыс Шагай on 10/17/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import Foundation

protocol CarProviderDelegate {
    func didReceiveCars(cars: [Car])
}

class CarProvider {
    
    var delegate: CarProviderDelegate?
    func requestCars(limit: UInt) {
        var result: [Car] = []
        for i in 0 ... limit {
            let car = Car()
            car.title = "car #\(i)"
            car.model = "model random \(Int.random(in: 1 ... 100))"
            result.append(car)
        }
        delegate?.didReceiveCars(cars: result) // передаем через делегата
    }
}
