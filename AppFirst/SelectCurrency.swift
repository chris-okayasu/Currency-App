//
//  SelectCurrency.swift
//  AppFirst
//
//  Created by chris on 2024/08/15.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack{
            //background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                
                //Currency Text
                Text("Select the Currency you are starting with: \(Currency.goldPenny.rawValue)")
                    .fontWeight(.bold)
            
                // Currency Icons
                
                IconGrid(currency: $topCurrency)
                Text("Select the Currency you would like to convert to:")
                    .bold()
                
                //Second Icons
                IconGrid(currency: $bottomCurrency)

                //Done Button
                Spacer()
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
