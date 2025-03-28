//
//  ViewModel.swift
//  AsyncAwait2
//
//  Created by Charles Michael on 3/28/25.
//

import Foundation

struct PostsService {
    private func fetch<T: Decodable>(type: T.Type, from urlString: String) async -> T? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            return nil
        }
    }
    
    func fetchUsers() async -> [User] {
        await fetch(type: [User].self,
                    from: "https://jsonplaceholder.typicode.com/users") ?? []
    }
    
    func fetchPosts(user: User) async -> [Post] {
        await fetch(type: [Post].self,
                    from: "https://jsonplaceholder.typicode.com/posts?userId=\(user.id)") ?? []
    }
}
