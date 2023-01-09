//
//  CarData.swift
//  ListNavDemo
//
//  Created by apple on 9/1/2023.
//

import Foundation
import UIKit
import SwiftUI

var carData: [Car] = loadData(filename: "carData.json");

func loadData<T : Decodable>(filename:String) -> T {
    let data : Data;
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename) not found")
    }
    
    do{
        data = try Data(contentsOf: file);
    } catch {
        fatalError("Could not load \(filename) : \(error)");
    }
    
    do{
        return try JSONDecoder().decode(T.self, from: data);
    } catch{
        fatalError("Unable to parse \(filename) : \(error)");
    }
}
