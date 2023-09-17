//
//  ContentView.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import SwiftUI

struct HomeView: View {
  
    @StateObject var model = HomeViewModel()
    
    var body: some View {
        ZStack{
            Image("gradient")
                .resizable().aspectRatio(contentMode: .fill)
                .fullframe()
                .blur(radius: 3)
            
            
            VStack{
                
                Text("Examples")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                VStack(spacing : 0){
                    Button {
                        model.openPaymentSheet()
                    } label: {
                        HStack{
                            systemImage("creditcard.fill")
                                .foregroundColor(Color.black)
                                .squareFrame(size: 20)
                            
                            Text("Card Example")
                                .foregroundColor(Color.black)
                                .fullWidth(alignment: .leading)
                            
                            systemImage("chevron.right")
                                .foregroundColor(Color.black.opacity(0.5))
                                .squareFrame(size: 12)
                            
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.0001))
                        .cornerRadius(10)
                        
                    }
                    
                    Divider()
                    
                    Button {
                        model.openCalendarSheet()
                    } label: {
                        
                        HStack{
                            systemImage("calendar")
                                .foregroundColor(Color.black)
                                .squareFrame(size: 20)
                            
                            Text("Calendar Example")
                                .foregroundColor(Color.black)
                                .fullWidth(alignment: .leading)
                            
                            systemImage("chevron.right")
                                .foregroundColor(Color.black.opacity(0.5))
                                .squareFrame(size: 12)
                            
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.0001))
                        .cornerRadius(10)
                    }
                    
                    Divider()
                    
                    Button {
                        model.openMapSheet()
                    } label: {
                        HStack{
                            systemImage("map.fill")
                                .foregroundColor(Color.black)
                                .squareFrame(size: 20)
                            
                            Text("Map Example")
                                .foregroundColor(Color.black)
                                .fullWidth(alignment: .leading)
                            
                            systemImage("chevron.right")
                                .foregroundColor(Color.black.opacity(0.5))
                                .squareFrame(size: 12)
                            
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.0001))
                        .cornerRadius(10)
                    }
                    
                    Divider()
                    
                    Button {
                        model.openMusicSheet()
                    } label: {
                        HStack{
                            systemImage("music.note")
                                .foregroundColor(Color.black)
                                .squareFrame(size: 20)
                            
                            Text("Music Example")
                                .foregroundColor(Color.black)
                                .fullWidth(alignment: .leading)
                            
                            systemImage("chevron.right")
                                .foregroundColor(Color.black.opacity(0.5))
                                .squareFrame(size: 12)
                            
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.0001))
                        .cornerRadius(10)
                    }
                    
                    Divider()
                    
                    Button {
                        model.openCallSheet()
                    } label: {
                        HStack{
                            systemImage("phone.fill")
                                .foregroundColor(Color.black)
                                .squareFrame(size: 20)
                            
                            Text("Call Example")
                                .foregroundColor(Color.black)
                                .fullWidth(alignment: .leading)
                            
                            systemImage("chevron.right")
                                .foregroundColor(Color.black.opacity(0.5))
                                .squareFrame(size: 12)
                            
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.0001))
                        .cornerRadius(10)
                    }
                }
                .padding(10)
                .background(BlurView(style: .systemMaterialLight))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
               
                
            }
            
           
            
            if model.isPaymentSheetOpen || model.isCalendarSheetOpen || model.isMapViewOpen {
                Color.black.opacity(0.2)
                    .transition(.opacity)
            }
            

            if model.isPaymentSheetOpen  {
                paymentSheet(closeHandler: model.paymentClose)
                    .transition(.move(edge: .bottom))
            }
            
            if model.isCalendarSheetOpen {
                CalendarSheet(closeHandler: model.CalendarClose)
                    .transition(.move(edge: .bottom))
            }
            
            if model.isMapViewOpen {
                mapSheetView(closeHandler: model.MapSheetClose)
                    .transition(.move(edge: .bottom))
            }
            
            if model.isMusicPlayerOpen {
                MusicPlayerSheet(closeHandler: model.MusicSheetClose)
                    .transition(.move(edge: .trailing))
            }
            
            if model.isCallScreenOpen {
                callView(closeHandler: model.CallSheetClose)
                    .transition(.move(edge: .trailing))
            }
            
          
            
        }
        .ignoreSafeArea_C()
        .preferredColorScheme(.light)
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
