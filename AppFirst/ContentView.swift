//
//  ContentView.swift
//  AppFirst
//
//  Created by chris on 2024/08/11.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount: String  = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.copperPenny
    @State var rightCurrency = Currency.goldPiece
    
    var body: some View {
        ZStack{
            //            backgroun image
            Image(.background)
                .resizable() // save area (white spaces)
                .ignoresSafeArea() // full screen image
            
            VStack{
                //                pracing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()  //keep the resolution (horizontal?)
                    .frame(height: 200)
                    
                    .onTapGesture {
                        showSelectCurrency.toggle()
                    }
                    .onChange(of: showSelectCurrency){
//                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                    }
                    
    
                //                currency excahgne text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // currency coinversion section
                HStack{
                    //left conversion section
                    VStack{
                        // currency
                        HStack{
                            //currency image
                            Image(leftCurrency.img)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        // text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount){
                                if leftTyping{
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }
                    }
                    // equal sign
                    //sf symbols
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack{
                        // currency
                        HStack{
                            // currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            // currency image
                            Image(rightCurrency.img)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //
                        }
                        .padding(.bottom, -5)
                        
                        //                        text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount){
                                if rightTyping{
                                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                                
                            }
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                //                info
                
                HStack{
                    Spacer()
                    Button {
                        //                        print("showExchangeInfo 1value: \(showExchangeInfo)")
                        showExchangeInfo.toggle()
                        //                        print("showExchangeInfo 2value: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        
                    }
                    
                    .padding(.trailing)
                    
                }
                
            }
            //            .border(.blue)
        }
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfo()
          
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            
        }
        
    }
}

#Preview {
    ContentView()
}
