//
//  homeViewModel.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    @Published var isPaymentSheetOpen : Bool = false
    @Published var isCalendarSheetOpen : Bool = false
    @Published var isMapViewOpen : Bool = false
    @Published var isMusicPlayerOpen : Bool = false
    @Published var isCallScreenOpen : Bool = false
    
    //card view
    func openPaymentSheet() {
        withAnimation(.spring()) {
            self.isPaymentSheetOpen = true
        }
    }
    
    func paymentClose() {
        withAnimation(.linear(duration: 0.3)) {
            self.isPaymentSheetOpen = false
        }
    }
    
    //calendar view
    
    func openCalendarSheet() {
        withAnimation(.spring()) {
            self.isCalendarSheetOpen = true
        }
    }
    
    func CalendarClose() {
        withAnimation(.linear(duration: 0.3)) {
            self.isCalendarSheetOpen = false
        }
    }
    
    
    //Mapview view
    
    func openMapSheet() {
        withAnimation(.spring()) {
            self.isMapViewOpen = true
        }
    }
    
    func MapSheetClose() {
        withAnimation(.linear(duration: 0.3)) {
            self.isMapViewOpen = false
        }
    }
    
    //music view
    
    func openMusicSheet() {
        withAnimation(.spring()) {
            self.isMusicPlayerOpen = true
        }
    }
    
    func MusicSheetClose() {
        withAnimation(.linear(duration: 0.3)) {
            self.isMusicPlayerOpen = false
        }
    }
    
    //music view
    
    func openCallSheet() {
        withAnimation(.spring()) {
            self.isCallScreenOpen = true
        }
    }
    
    func CallSheetClose() {
        withAnimation(.linear(duration: 0.3)) {
            self.isCallScreenOpen = false
        }
    }
    
    
    
}
