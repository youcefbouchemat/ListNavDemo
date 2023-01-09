//
//  Car.swift
//  ListNavDemo
//
//  Created by apple on 7/1/2023.
//

import Foundation

struct Car: Codable, Identifiable{
    var id: String;
    var name: String;
    
    var description: String;
    var isHybrid: Bool;
    
    var imageName: String;
    
}
