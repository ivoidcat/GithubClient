//
//  Animator.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
