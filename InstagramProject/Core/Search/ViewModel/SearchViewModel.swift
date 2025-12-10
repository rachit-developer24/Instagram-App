//
//  SearchViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/10/2025.
//

import Foundation
@MainActor
class SearchViewModel:ObservableObject{
    @Published var user = [User]()
    let service = UserService()
    init(){
        Task{
            try await fetchallusers()
        }
    }
    @MainActor
    func fetchallusers()async throws{
        do{
            self.user = try await UserService.fetchAllusers()
        }catch{
            
        }
    }
}
