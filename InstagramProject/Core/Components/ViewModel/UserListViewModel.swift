//
//  UserListViewModel.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 09/12/2025.
//

import Foundation
class UserListViewModel:ObservableObject{
    @Published var user = [User]()
    let service = UserService()
    init(){
        Task{
          
        }
    }
    @MainActor
    func fetchallusers(forconfig:UserListConfig)async{
        do{
            self.user = try await UserService.fetchUsers(for: forconfig)
        }catch{
            
        }
    }
}
