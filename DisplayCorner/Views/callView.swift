//
//  navigationView.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import SwiftUI
import MapKit

struct callView: View {
    var closeHandler : () -> Void
    
    var padding : CGFloat = 11
    @State var offset : CGFloat = .zero
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.033863, longitude: 72.585022), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    
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
            
            MapView(region: $region)
            
            VStack{
               
                
                VStack{
                  
                    HStack{
                        
                        systemImage("phone.fill")
                            .foregroundColor(Color.green)
                            .squareFrame(size: 18)
                        
                        Text("Call")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                       
                        
                        Text("10:34")
                            .font(.headline)
                            .foregroundColor(Color.white.opacity(0.6))
                        
                    }
                    
                    Image("memoji")
                        .resizeWithApectRatio()
                        .fullWidth(height: 80)
                        .mask{
                            LinearGradient(colors: [Color.white.opacity(0),Color.white,Color.white,Color.white.opacity(0)], startPoint: .leading, endPoint: .trailing)
                        }
                
                   
                    
                    
                    HStack{
                        
                        VStack(spacing : 3){
                            Text("Morning meeting")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .fullWidth(alignment: .leading)
                            HStack{
                                systemImage("mic.fill")
                                    .squareFrame(size: 13)
                                    .foregroundColor(Color.green)
                                
                                Text("Pam is speaking")
                                    .font(.footnote)
                                    .foregroundColor(Color.white)
                                    .fullWidth(alignment: .leading)
                            }
                           
                        }
                        
                        Spacer()
                        
                       
                        systemImage("mic.slash.fill")
                            .foregroundColor(Color.black)
                            .padding(13)
                            .squareFrame(size: 50)
                            .background(Color.white)
                            .cornerRadius(30)
                        
                        systemImage("phone.down.fill")
                            .foregroundColor(Color.white)
                            .padding(13)
                            .squareFrame(size: 50)
                            .background(Color.red)
                            .cornerRadius(30)
                    }
                    
                    
                }
                .padding(25)
                .background(Color.black)
                .cornerRadius(screenCornerRadius(minimum: 20) - padding) //Display corner radius
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)

                
                Spacer()
                
                
                Button {
                    self.closeHandler()
                } label: {
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .fullWidth(height: 60)
                        .background(Color.black)
                        .cornerRadius(25)
                }

                
                Spacer()
                    .bottomSafeArea()
            }
            .background(Color.white.opacity(0.00001))
            .gesture(gesture)
             
        }
        .padding(padding)
        .ignoresSafeArea()
        .statusBar(hidden: true)
        .hideHomeIndicator() // to hide homebar from  bottom
       
    }
}

struct navigationView_Previews: PreviewProvider {
    static var previews: some View {
        callView(closeHandler: {})
    }
}
