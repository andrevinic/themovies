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
    
    case upcoming
}

extension MovieService:TargetType{
    
    var headers: [String : String]? {
        switch self{
        case .upcoming:
            var parameters = [String: String]()
            parameters["x-api-key"] = "59aa9e50-90f1-4606-a83c-1a87cbf8e53e"
            return parameters
        default:
            return [String: String]()
            
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
        default:
            return ""

        }
        
    }
    
    var method: Moya.Method{
        
        switch self {
        case .upcoming:
            return .get
        default:
            return .get

        }
    }
    
    var parameters: [String: Any]? {
        switch self{
            
        case .upcoming:
            var parameters = [String: Any]()
            parameters["api_key"] = "1f54bd990f1cdfb230adb312546d765d"
            parameters["language"] = "en-US"
            parameters["page"] = 1
            
            return parameters
        default:
            return [String: Any]()

        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    // 8:
    var sampleData: Data {
        return Data()
    }
    
    // 9:
    var task: Task {
        guard let parameters = self.parameters else{
            return .requestPlain
        }
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
