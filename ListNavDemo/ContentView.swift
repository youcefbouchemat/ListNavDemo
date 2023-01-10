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
        NavigationView{
            List{
                ForEach(carStore.cars){car in
                    ListCell(car:car)
                }
                .onDelete(perform: deleteCar)
                .onMove(perform: moveCar)
                
            }
            .navigationBarTitle("Car list")
            .navigationBarItems(leading: NavigationLink( destination: AddNewCar(carStore: carStore)){
                Text("Add")
            }, trailing: EditButton())
        }
    }
    
    func deleteCar(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    func moveCar(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
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
        NavigationLink(destination: CarDetail(selectedCar: car))
        {
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
}
