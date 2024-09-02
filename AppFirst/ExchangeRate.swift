//
//  ExchangeRate.swift
//  AppFirst
//
//  Created by chris on 2024/08/15.
//
import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(text)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview{
    ExchangeRate(leftImage: .silverpiece, text: "This is an example, not requeired", rightImage: .goldpenny)
}
