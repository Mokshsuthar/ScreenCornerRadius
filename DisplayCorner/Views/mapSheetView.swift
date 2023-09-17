//
//  mapSheetView.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import SwiftUI
import MapKit

struct mapSheetView: View {
    var closeHandler : () -> Void
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.033863, longitude: 72.585022), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
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
                    
                    ZStack{
                        MapView(region: $region)
                            .fullframe()
                        VStack{
                            
                            ZStack{
                                BlurView(style: .systemUltraThinMaterialDark)
                                    .frame(width: 50,height: 8,alignment: .center)
                                    .cornerRadius(10)
                            }
                            .padding()
                            .fullWidth()
                            .background(Color.white.opacity(0.000001))
                            
                            
                            
                            
                           Spacer()
                        }
                       
                        
                        ZStack{
                            Circle()
                                .fill(Color.accentColor.opacity(0.1))
                                .squareFrame(size: 130)
                            
                            Circle()
                                .strokeBorder(Color.accentColor,lineWidth: 2)
                                .squareFrame(size: 130)
                        }
                        .allowsHitTesting(false)
                        

                    }
                    .fullWidth(height: 340, alignment: .top)
                    .mask(VStack(spacing : 0){
                        Rectangle()
                            .fill(Color.white)
                        LinearGradient(colors: [Color.white,Color.white.opacity(0)], startPoint: .top, endPoint: .bottom)
                            .fullWidth(height: 100)
                        
                    })
                    
                    VStack(spacing : 10){
                        Text("Select your location")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                        Text("Please select your current location to determine if our services are available in your area.")
                             .font(.headline)
                             .fontWeight(.light)
                             .foregroundColor(Color.black.opacity(0.6))
                             .multilineTextAlignment(.center)
                        
                    }.padding(.horizontal,20)
                    
                    
                    
                    Button {
                        
                    } label: {
                        Text("Select")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .fullWidth(height: 55)
                            .background(Color.accentColor)
                            .cornerRadius(20)
                            .padding([.horizontal,.bottom],20)
                    }
                   
                    
                }
//                .padding()
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


struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.mapType = .mutedStandard
       
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}


