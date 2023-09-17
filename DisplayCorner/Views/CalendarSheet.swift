//
//  CalendarSheet.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import SwiftUI

struct CalendarSheet: View {
    var closeHandler : () -> Void
    
    var padding : CGFloat = 10
    @State var offset : CGFloat = .zero
    
    var gesture : some Gesture {
        return DragGesture().onChanged { value in
            
            if value.translation.height >= 0 {
                offset = value.translation.height
            } else {
                offset = value.translation.height/20
            }
           
            
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

                    Image("calendar")
                        .resizable().aspectRatio(contentMode: .fit)
                        .fullWidth()
                        .padding(5)
                    
                    Button {
                        
                    } label: {
                        Text("Select")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .fullWidth(height: 55)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                    }
                   
                    
                }
                .padding(20)
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

struct CalendarSheet_Previews: PreviewProvider {
    static var previews: some View {
        CalendarSheet(closeHandler: {
            
        })
    }
}
