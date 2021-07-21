//
//  ContentView.swift
//  HackerDaily
//
//  Created by Amit Chaudhary on 7/21/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) {(post) in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points)).bold()
                        Text(post.title)
                    }
                }  // navigationLink
            }
            .navigationBarTitle("Hacker Daily")
            
        }  // navigation View
        
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
