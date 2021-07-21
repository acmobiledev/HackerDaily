//
//  DetailView.swift
//  HackerDaily
//
//  Created by Amit Chaudhary on 7/21/21.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebDetailView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
