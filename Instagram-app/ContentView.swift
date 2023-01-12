//
//  ContentView.swift
//  Instagram-app
//
//  Created by EdgardVS on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    
    var bounds = UIScreen.main.bounds
    
    var body: some View {
        VStack(spacing: 0.0) {
            Header()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Stories()
                
                Divider()
                
                Post()
                
                Post(image: "profile1", description: "Almost 2 years old, I love her.")
            }
            
            TabBar()
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        HStack() {
            Image("logo")
            Spacer()
            HStack(spacing: 20.0) {
                Image(systemName: "plus.app").resizable().frame(width: 20, height: 20)
                Image("heart")
                Image("messenger")
            }
        }.padding(.horizontal, 15)
            .padding(.vertical, 3)
    }
}

struct Story: View {
    
    var image: String = "profile"
    var name: String = "Juan L"
    
    var body: some View {
        VStack {
            VStack{
                Image(image).resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
            }
            .overlay (
                Circle()
                    .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange]
                            , startPoint: .topLeading
                            ,endPoint: .bottomTrailing)
                            ,lineWidth: 2.3)
                    .frame(width: 68, height: 68)
            ).frame(width: 70, height: 70)
            Text(name)
                .font(.caption)
        }
    }
}

struct Stories: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15.0) {
                Story()
                Story(image: "profile2", name: "Renzo M")
                Story(image: "profile3", name: "Diego P")
                Story(image: "profile4", name: "Luis B")
                Story(image: "profile5", name: "Eduardo H")
                Story(image: "profile6", name: "Oscar L")
                Story(image: "profile7", name: "Yuichi Y")
                Story(image: "profile8", name: "Carlos C")
                
            }.padding(.horizontal, 10)
        }.padding(.vertical, 10)
    }
}

struct PostHeader: View {
    var body: some View {
        HStack {
            HStack{
                Image("profile").resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(50)
                
                Text("Juan L").font(.caption).fontWeight(.bold)
            }
            Spacer()
            Image(systemName: "ellipsis")
            
        }.padding(.vertical)
            .padding(.horizontal)
    }
}

struct PostContent: View {
    var image: String = "profile"
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(image)
                .resizable()
                .frame(maxWidth:.infinity)
                .aspectRatio(contentMode: .fit)
            HStack{
                HStack(spacing: 10.0){
                    Image("heart")
                    Image("messenger")
                    Image(systemName: "paperplane").resizable().frame(width: 20, height: 20)
                }
                Spacer()
                Image("bookmark")
            }.padding(.horizontal, 12)
                .padding(.vertical, 9)
        }
    }
}

struct Post: View {
    
    var image: String = "profile"
    var description: String = "I miss traveling to Japan"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            PostHeader()
            
            PostContent(image: image)
            
            Text("Like by Juan L to and others")
                .font(.footnote)
            //el ininity hace referencia a todo el ancho o width del contenedor en este caso el VStack
                .frame(width: .infinity)
                .padding(.horizontal, 12)
            Text(description)
                .font(.footnote)
                .frame(width: .infinity)
                .padding(.horizontal, 12)
            HStack {
                HStack(spacing: 7.0) {
                    Image(image).resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(50)
                    Text("add comment...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                HStack{
                    Text("😍")
                    Text("😂")
                    Image(systemName: "plus.circle")
                }
                
            }.padding(.horizontal, 12)
                .padding(.vertical, 9)
        }
    }
}

struct TabBar: View {
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "magnifyingglass")
                Spacer()
                Image("reels")
                Spacer()
                Image("shops")
                Spacer()
                Image("profile")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .cornerRadius(50)
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
        }
    }
}
