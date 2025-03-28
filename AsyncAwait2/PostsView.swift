//
//  PostsView.swift
//  AsyncAwait2
//
//  Created by Charles Michael on 3/28/25.
//

import SwiftUI

struct PostsView: View {
    private let service = PostsService()
    @State private var posts: [Post] = []
    let user: User
    
    var body: some View {
        List(posts){ post in
            VStack(alignment: .leading){
                Text(post.title)
                    .font(.title3)
                    .foregroundStyle(.blue)
                Divider()
                    .background(.blue)
                Text(post.body)
                    .font(.subheadline)
            }
        }
        .navigationTitle(user.name)
        .task {
            posts = await service.fetchPosts(user:user)
        }
    }
}

#Preview {
    PostsView(user: User(id: 1, name: "dsfdf", email: "sdfd", phone: "fsdfsd"))
}
