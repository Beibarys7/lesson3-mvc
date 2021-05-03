//
//  CarTableViewController.swift
//  lesson3=mvc
//
//  Created by Бейбарыс Шагай on 10/17/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import UIKit

class BaskaViewController: UIViewController {
    
}

class CarTableViewController: UITableViewController {

    // Model
    let provider = CarProvider()
    var data: [Car] = []
    //=Model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        provider.delegate = self
        provider.requestCars(limit: 50)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarcellId", for: indexPath) as! CarCell

        // Configure the cell...
        
        let car = data[indexPath.row] // get a car
        cell.titleLabel.text = car.title
        cell.modelLabel.text = car.model
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension CarTableViewController: CarProviderDelegate {
    func didReceiveCars(cars: [Car]){
        data = cars
        tableView.reloadData()
    }
}
