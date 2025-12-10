//
//  SearchSubView.swift
//  InstagramProject
//
//  Created by Rachit Sharma on 26/09/2025.
//

import SwiftUI

struct SearchSubView: View {
    @StateObject var ViewModel = UserListViewModel()
    @State var searchText: String = ""
    private let config:UserListConfig
    init(config:UserListConfig){
        self.config = config
    }
    var body: some View {
        HStack{
            ScrollView{
                LazyVStack(spacing:10){
                    ForEach(ViewModel.user){user in
                        NavigationLink(value: user) {
                            HStack{
                                CircularProfileView(user: user, size: .xSmall)
                                VStack(alignment: .leading){
                                    Text(user.fullName ?? "")
                                        .fontWeight(.semibold)
                                    Text(user.bio ?? "")
                                        .foregroundStyle(.gray)
                                        .font(.caption)
                                    
                                }
                                Spacer()
                            }
                        }
                        .foregroundStyle(.black)
                      }
                }
            }
            .padding(.horizontal)
            .searchable(text: $searchText, prompt: "search users")
           
           
            
        }
        .task{
            await ViewModel.fetchallusers(forconfig:config )
        }
    }
}

#Preview {
    SearchSubView(config: .explore)
}
