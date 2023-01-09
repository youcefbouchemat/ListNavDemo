//
//  CarStore.swift
//  ListNavDemo
//
//  Created by apple on 9/1/2023.
//

import Foundation
import SwiftUI
import Combine

class CarStore : ObservableObject{
    
    @Published var cars:[Car]
    init(cars: [Car] = []) {
        self.cars = cars
    }
}

