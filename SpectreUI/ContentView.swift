//
//  ContentView.swift
//  SpectreUI
//
//  Created by Moritz Kanemeier on 12.05.21.
//

import SwiftUI

struct ContentView: View {
    @State private var searchString: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search ...", text: $searchString)
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(Site.data, id:\.url) { site in
                            SiteCardView(site: site)
                        }
                    }
                }
            }
            .navigationBarTitle("Sites")
            .toolbar {
                Button("Add") {
                    print("Add site...")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
