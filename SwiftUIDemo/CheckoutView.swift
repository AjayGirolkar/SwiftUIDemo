//
//  CheckoutView.swift
//  SwiftUIDemo
//
//  Created by Ajay Girolkar on 17/06/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var payment = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showPaymentAlert = false
    
    let tipAmounts = [10, 15, 20, 25, 30]
    let paymentTypes = ["Cash", "Credit card", "UPI"]
    
    var totalPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total/100 * Double(tipAmount)
        return numberFormatter.string(from: NSNumber(value: total + tipValue)) ?? "%0"
    }
    
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to make payment", selection: $payment) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            } 
            Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
            if addLoyaltyDetails {
                TextField("Enter your ID", text: $loyaltyNumber)
            }
            
            Section(header: Text("Select tips you want to give")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                        Text("Total: \(totalPrice)")
                        .font(.largeTitle)) {
                Button("Confirm order") {
                    showPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showPaymentAlert, content: {
            Alert(title: Text("Order confirm"), message: Text("Your total was $ \(totalPrice)"), dismissButton: .default(Text("Ok")))
        })
    }
    
   
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
