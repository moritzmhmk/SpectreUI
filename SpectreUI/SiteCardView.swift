//
//  SiteCardView.swift
//  SpectreUI
//
//  Created by Moritz Kanemeier on 12.05.21.
//

import SwiftUI

struct Site: Hashable {
    var url: String
    var icon: String
}
extension Site {
    static var data: [Site] {
        [
            Site(url: "github.com", icon: "icon-github"),
            Site(url: "gitlab.com", icon: "icon-gitlab"),
            Site(url: "stackoverflow.com", icon: "icon-stackoverflow"),
            Site(url: "twitter.com", icon: "icon-twitter"),
        ]
        
    }
}

struct SiteCardView: View {
    var site: Site
    var body: some View {
        HStack() {
            Image(site.icon)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width:60, height:60)
                .background(Color(hue: 0,saturation: 0,brightness: 0.92))
                .padding(.all, 0)
            VStack(alignment: .leading) {
                Text(site.url)
                Text("⋅⋅⋅⋅⋅⋅⋅⋅")
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 60,
               alignment: .center)
        .background(Color.white)
        .modifier(CardModifier())
        .contextMenu {
            Button {} label: {
                Label("Edit", systemImage: "pencil")
            }
            Button {
                print("Password Settings...")
            } label: {
                Label("Password Settings", systemImage: "gear")
            }
            Divider()
            Button {
                print("Remove...")
            } label: {
                Label("Remove", systemImage: "trash")
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        let rr = RoundedRectangle(cornerRadius: 10, style: .continuous)
        return content
            .clipShape(rr)
            .contentShape(rr)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
    
}

struct SiteCardView_Previews: PreviewProvider {
    static var previews: some View {
        SiteCardView(site: Site.data[0])
    }
}
