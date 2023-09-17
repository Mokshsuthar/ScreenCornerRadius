//
//  paymentSheet.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import SwiftUI

struct paymentSheet: View {
    var closeHandler : () -> Void
    
    var padding : CGFloat = 10
    @State var offset : CGFloat = .zero
    
    var gesture : some Gesture {
        return DragGesture().onChanged { value in
            
            offset = value.translation.height
            
        }.onEnded { value in
            if value.translation.height > 100 {
                self.closeHandler()
            } else {
                withAnimation {
                    offset = .zero
                }
            }
         }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.2))
                        .frame(width: 50,height: 8,alignment: .center)
                    
                    Text("Make payment")
                        .font(.title2.smallCaps())
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                    Image("card")
                        .resizable().aspectRatio(contentMode: .fit)
                        .fullWidth()
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                        .padding()
                    
                    VStack{
                        Text("Pay for you order")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            
                             
                        Text("$399")
                            .font(.largeTitle.smallCaps())
                            .fontWeight(.bold)
                    }
                    .padding(.bottom)
                   
                    
                    
                    
                    HStack{
                        
                        Button {
                            self.closeHandler()
                        } label: {
                            Text("Cancel")
                                .font(.headline)
                                .foregroundColor(Color.black)
                                .fullWidth(height: 60)
                                .background(Color.black.opacity(0.2))
                                .cornerRadius(30)
                        }

                        
                        Button {
                            
                        } label: {
                            Text("Pay")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .fullWidth(height: 60)
                                .background(Color.accentColor)
                                .cornerRadius(30)
                        }

                    }
                    
                   
                    
                }
                .padding()
                .fullWidth()
                .background(Color.white)
                .cornerRadius(screenCornerRadius(minimum: 20) - padding) //Display corner radius
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
                .offset(y : offset)
            }
            .background(Color.white.opacity(0.00001))
            .gesture(gesture)
             
        }
        .padding(padding)
        .ignoresSafeArea()
        .hideHomeIndicator() // to hide homebar from  bottom
       
    }
}
