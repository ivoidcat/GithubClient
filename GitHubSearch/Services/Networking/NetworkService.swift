//
//  NetworkService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import Moya

final class NetworkService {

    private var provider: MoyaProvider<GitHub>?

    init(provider: MoyaProvider<GitHub> = .init()) {
        self.provider = provider
    }

    func searchRepositories(with query: String,
                            completionHandler: @escaping (([Repository]?) -> Void)) {
        provider?.request(.searchRepo(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let repositories = try response.map(SearchResults<Repository>.self)
                    completionHandler(repositories.items)
                } catch let error {
                    print(error.localizedDescription)
                }

            case .failure(let error):
                print(error)
            }
        }
    }

}
