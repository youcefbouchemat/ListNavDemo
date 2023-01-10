//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by apple on 10/1/2023.
//

import SwiftUI

struct AddNewCar: View {
    @StateObject var carStore : CarStore;
    @State private var isHybrid : Bool = false;
    @State private var name : String = "";
    @State private var description : String = "";
    
    var body: some View {
        Form{
            Section(header: Text("Car Details")){
                Image("tesla_model_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                Toggle(isOn: $isHybrid){
                    Text("Is this car hybrid ?")
                }.padding()
                
            }
            Button(action: addCar){
                Text("Add car")
            }
            
        }
        
    }
    
    func addCar(){
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3");
        
        carStore.cars.append(newCar);
        
    }
}

struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore : CarStore(cars: carData))
    }
}

struct DataInput: View{
    var title : String;
    @Binding var userInput : String;
    
    var body: some View{
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)",text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
