//
//  RouteSetup.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation

enum RouteKey: String {
    case kRouteLogin
    case kRouteMovies
}

func RouteSetup(_ route: RouteKey) -> String {
    switch route {
    case .kRouteLogin:
        return "/login"
    case .kRouteMovies:
        return "/movies"
    }
}
