//
//  ContentView.swift
//  Search Bar
//
//  Created by Admin on 8/16/20.
//  Copyright © 2020 Yerlan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var show = false
    @State var text = ""
    @State var data = ["p1", "p2", "p3", "p4", "p5"]
    
    var body: some View {
        VStack {
            HStack {
                if !self.show {
                    Text("Cars")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                HStack {
                    if self.show {
                        Image("search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 8)
                        
                        TextField("Search Car", text: self.$text)
                        
                        Button(action: {
                            withAnimation {
                                self.text = ""
                                self.show.toggle()
                            }
                        }) {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .padding(.horizontal, 8)
                        }
                    } else {
                        
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }) {
                            
                            Image("search")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                    }
                }
                .padding(self.show ? 10 : 0)
                .background(self.show ? Color.white : Color.yellow)
                .cornerRadius(20)
            }
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(Color.blue)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    if self.text != "" {
                        if data.filter({$0.lowercased().contains(self.text.lowercased())}).count == 0 {
                            Text("No Results Found")
                                .padding(.top, 10)
                        } else {
                            ForEach(data.filter({$0.lowercased().contains(self.text.lowercased())}), id: \.self) { i in
                                CellView(image: i)
                            }
                        }
                    } else {
                        ForEach(data, id: \.self) { i in
                            CellView(image: i)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

class Host: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

struct CellView: View {
    
    var image: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(image)
                .resizable()
                .frame(height: 200)
                .cornerRadius(20)
            
            Button(action: {
                
            }) {
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .padding()
            }
            .background(Color.white)
            .clipShape(Circle())
            .padding()
        }
    }
}
