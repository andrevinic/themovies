//
//  UpcomingService.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import Moya

enum MovieService{
    
    case upcoming(pagination: Int)
    case genrer
}

extension MovieService:TargetType{
    
    var headers: [String : String]? {
        switch self{
        case .upcoming:
            let parameters = [String: String]()
            return parameters
        case .genrer:
            let parameters = [String: String]()
            return parameters
            
        }

    }
    
    var environmentBaseURL: String{
        return "https://api.themoviedb.org/3"
    }
        
    var baseURL: URL {
        
        return URL(string: environmentBaseURL)!}
    
    var path: String{
        
        switch self{
        case .upcoming:
            return "/movie/upcoming"
        case .genrer:
            return "/genre/movie/list"

        }
        
    }
    
    var method: Moya.Method{
        
        switch self {
        case .upcoming:
            return .get
        case .genrer:
            return .get

        }
    }
    
    var parameters: [String: Any]? {
        switch self{
            
        case .upcoming(let page):
            var parameters = [String: Any]()
            parameters["api_key"] = "1f54bd990f1cdfb230adb312546d765d"
            parameters["language"] = "en-US"
            parameters["page"] = page
            
            return parameters
        case .genrer:
            var parameters = [String: Any]()
            parameters["api_key"] = "1f54bd990f1cdfb230adb312546d765d"
            parameters["language"] = "en-US"
            return parameters

        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        guard let parameters = self.parameters else{
            return .requestPlain
        }
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
