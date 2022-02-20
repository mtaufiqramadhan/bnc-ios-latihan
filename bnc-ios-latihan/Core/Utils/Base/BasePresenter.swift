//
//  BasePresenter.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation

public class BasePresenter<V>{
    
    var view : V?
    
    init(view: V) {
        self.view = view
    }
   
    func detachView() {
        view = nil
    }
    
}
