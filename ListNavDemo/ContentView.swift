//
//  ContentView.swift
//  ListNavDemo
//
//  Created by apple on 7/1/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carStore : CarStore = CarStore(cars: carData)
    var body: some View {
        List{
            ForEach(carStore.cars){car in
                ListCell(car:car)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var car : Car;
    var body: some View {
        HStack{
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            VStack{
                Text(car.name)
                    .font(.headline)
                Text(car.description)
                    .font(.caption2)
            }
            
        }
    }
}
