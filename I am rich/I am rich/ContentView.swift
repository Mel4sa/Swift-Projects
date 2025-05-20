//
//  ContentView.swift
//  I am rich
//
//  Created by Melisa Şimşek on 18.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack{
                Color(.black)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Image("diamond 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150.0, height: 150.0)
                       
                    
                    
                       
                    Text("I AM RICH")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Pasifico-Regular ", size: 40))
                    
                    Text("Melisa Simsek")
              
                            RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame( width:380,height: 50)
                        .overlay(
                            HStack {    Image(systemName: "envelope").foregroundColor(.black)
                                Text("melisaxsimsek@gmail.com")
                                    .font(.system(size: 30))
                            })
                    
                  
                                
                    
                                
                  
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
