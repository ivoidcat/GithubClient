//
//  Configuration.swift
//  GitHubSearch
//
//  Created by stephen on 2019/5/27.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import Foundation

let isDebug: Bool = false

enum Configuration {
    
    // ******************************************
    //
    // MARK: - Storage Path for cache images
    //
    // ******************************************
    
    enum Storage {
        static let sourceDirectoryPath = "GithubSearch/"
    }
    
    // ******************************************
    //
    // MARK: - Theme, Entire app color theme
    //
    // ******************************************
    
    enum Theme {
        // FFDA00
        static let main = UIColor(red:0.98, green:0.86, blue:0.29, alpha:1.0)
        
        static let navigationTitleColor = UIColor.black
    }
    
    // ******************************************
    //
    // MARK: - Font
    //
    // ******************************************
    
    enum Font {
        static let normal = UIFont.systemFont(ofSize: 14)
    }
    
    // ******************************************
    //
    // MARK: - UI
    //
    // ******************************************
    
    enum UI {
        static let cornerRadius: CGFloat = 6.0
    }
}

extension Configuration {
    
    // ******************************************
    //
    // MARK: - API Request URL
    //
    // ******************************************
    
    enum API {
        
   
    }
}


extension Configuration {
    
    // ******************************************
    //
    // MARK: - Key
    //
    // ******************************************
    
    enum Key {
        static let user = "Configuration.Key.user"
    }
}


extension Configuration {
    
    // ******************************************
    //
    // MARK: - APP Context Text
    //
    // ******************************************
    
    enum Context {
        
      
        
        
        
    }
}
