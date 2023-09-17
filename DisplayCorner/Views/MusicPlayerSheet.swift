//
//  MusicPlayerSheet.swift
//  DisplayCorner
//
//  Created by Moksh Suthar on 17/09/23.
//

import SwiftUI

struct MusicPlayerSheet: View {
    var closeHandler : () -> Void
    
    let realSongs: [Song] = [
        Song(title: "Bohemian Rhapsody", artist: "Queen", coverName: "cover1"),
        Song(title: "Hotel California", artist: "Eagles", coverName: "cover2"),
        Song(title: "Stairway to Heaven", artist: "Led Zeppelin", coverName: "cover3"),
        Song(title: "Imagine", artist: "John Lennon", coverName: "cover4"),
        Song(title: "Hey Jude", artist: "The Beatles", coverName: "cover5"),
        Song(title: "Like a Rolling Stone", artist: "Bob Dylan", coverName: "cover6"),
        Song(title: "Thriller", artist: "Michael Jackson", coverName: "cover7"),
        Song(title: "Smells Like Teen Spirit", artist: "Nirvana", coverName: "cover8"),
        Song(title: "Sweet Child o' Mine", artist: "Guns N' Roses", coverName: "cover9"),
        Song(title: "Boogie Wonderland", artist: "Earth, Wind & Fire", coverName: "cover10"),
        Song(title: "Yesterday", artist: "The Beatles", coverName: "cover11"),
        Song(title: "Billie Jean", artist: "Michael Jackson", coverName: "cover12"),
        Song(title: "Wonderwall", artist: "Oasis", coverName: "cover13"),
        Song(title: "American Pie", artist: "Don McLean", coverName: "cover14"),
        Song(title: "Under the Bridge", artist: "Red Hot Chili Peppers", coverName: "cover15"),
        Song(title: "Born to Be Wild", artist: "Steppenwolf", coverName: "cover16"),
        Song(title: "Smooth", artist: "Santana ft. Rob Thomas", coverName: "cover17"),
        Song(title: "Hey Jude", artist: "The Beatles", coverName: "cover18"),
        Song(title: "All Along the Watchtower", artist: "Jimi Hendrix", coverName: "cover19"),
        Song(title: "Boogie Wonderland", artist: "Earth, Wind & Fire", coverName: "cover20")
    ]

    
    
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
            
            LinearGradient(colors: [Color.white.opacity(0),Color.white.opacity(0.2)], startPoint: .top, endPoint: .bottom)
           
            
            
            ScrollView {
                LazyVStack(spacing : 18){
                    
                    Spacer()
                        .topSafeArea(plus: 80)
                    
                    LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 16), count: 2), spacing: 16) {
                        ForEach(realSongs.shuffled()) { song in
                            VStack(spacing : 0){
                                Image(song.coverName)
                                     .resizable().aspectRatio(contentMode: .fill)
                                     .squareFrame(size: self.screenWidth/2 - 24)
                                     .cornerRadius(10)
                                     .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                                
                                
                                HStack{
                                    VStack{
                                        Text(song.title)
                                            .font(.headline)
                                            .foregroundColor(Color.white)
                                            .lineLimit(1)
                                            .fullWidth(alignment : .leading)
                                        
                                        Text(song.artist)
                                            .font(.footnote)
                                            .foregroundColor(Color.white.opacity(0.6))
                                            .fullWidth(alignment : .leading)
                                    }
                                    
                                    systemImage("play.fill")
                                        .foregroundColor(Color.white)
                                        .squareFrame(size: 20)
                                    
                                }
                                .padding(.top,10)
                                
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .fullframe()
            .mask(VStack(spacing : 0){
                Spacer()
                    .topSafeArea()
                
                LinearGradient(colors: [Color.white.opacity(0),Color.white], startPoint: .top, endPoint: .bottom)
                    .fullWidth(height: 80)
                
                Rectangle()
                
                LinearGradient(colors: [Color.white.opacity(0),Color.white], startPoint: .bottom, endPoint: .top)
                    .fullWidth(height: 40)
            })
            
            
            
            
            
            VStack{
                Spacer()
                
                HStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.black.opacity(0.2))
//                        .frame(width: 50,height: 8,alignment: .center)

                   Image("musicArt")
                        .resizable().aspectRatio(contentMode: .fill)
                        .squareFrame(size: 60)
                        .cornerRadius(screenCornerRadius(minimum: 20) - padding - 13)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 3)
                    
                    VStack{
                        Text("Now playing")
                            .font(.footnote.smallCaps())
                            .fontWeight(.bold)
                            .foregroundColor(Color.accentColor)
                            .fullWidth(alignment : .leading)
                        
                        Text("Nirvana")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .fullWidth(alignment : .leading)
                        
                        Text("by Moksh suthar")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black.opacity(0.6))
                            .fullWidth(alignment : .leading)
                    }
                    
                    systemImage("play.fill")
                        .foregroundColor(Color.black)
                        .padding(10)
                        .squareFrame(size: 45)
                   
                    
                }
                .padding(13)
                .fullWidth()
                .background(BlurView(style: .systemChromeMaterialLight))
                .cornerRadius(screenCornerRadius(minimum: 20) - padding) //Display corner radius
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
//                .offset(y : offset)/
            }
            .padding(padding)
            
            
            VStack{
                Spacer()
                    .topSafeArea()
                HStack{
                    Button {
                        self.closeHandler()
                    } label: {
                        systemImage("arrow.left")
                            .foregroundColor(Color.black)
                            .padding(8)
                            .squareFrame(size: 45)
                            .background(Color.white)
                            .cornerRadius(15)
                        
                        Spacer()
                    }

                }
                .padding()
                Spacer()
            }
           
             
        }
        .ignoresSafeArea()
        .background(Color.black)
        .hideHomeIndicator() // to hide homebar from  bottom
       
    }
}


struct Song: Identifiable {
    var id = UUID()
    var title: String
    var artist: String
    var coverName: String
}
