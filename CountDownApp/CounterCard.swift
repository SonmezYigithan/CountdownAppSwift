//
//  Counter.swift
//  CountDownApp
//
//  Created by Yiğithan Sönmez on 5.09.2023.
//

import Foundation

struct CounterCard {
    let name: String
    let endDate: Date
    
    enum CounterType{
        case countDown
        case countUp
    }
}
