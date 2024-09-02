//
//  ExchangeInfo.swift
//  AppFirst
//
//  Created by chris on 2024/08/15.
//

import SwiftUI

struct ExchangeInfo: View {

    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .frame(height: 100)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                ForEach(Exchange.allCases){ index in
                    ExchangeRate(leftImage: index.leftImg, text: index.exchangeInfo, rightImage: index.rightImg)
                }
                
                Spacer()
                Button ("Done"){
//                    print(showStatus)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }// End VStack
            .foregroundStyle(.black)
        } //End ZStack
    }
}

#Preview {
    ExchangeInfo()
}
