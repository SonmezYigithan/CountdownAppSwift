//
//  ViewController.swift
//  CountDownApp
//
//  Created by Yiğithan Sönmez on 4.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var counters: [CounterCard]
    
    required init?(coder aDecoder: NSCoder) {
        // Load CounterCards from save system
        self.counters = []
        for i in 0...10 {
            self.counters.append(CounterCard(name: "Counter\(i)", endDate: Date()))
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped a cell: \(indexPath)")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.counterName.text = counters[indexPath.row].name
        cell.countDownDate.text = "01/02/2024"
        cell.cellImage.backgroundColor = .red
        print(counters[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counters.count
    }
}

