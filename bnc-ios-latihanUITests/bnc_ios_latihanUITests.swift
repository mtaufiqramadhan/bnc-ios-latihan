//
//  bnc_ios_latihanUITests.swift
//  bnc-ios-latihanUITests
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import XCTest

class bnc_ios_latihanUITests: XCTestCase {
    
    func testFlow() {
        //MARK: Launch Apps
        let app = XCUIApplication()
        app.launch()
        //-----------------------------
        
        
        //MARK: Input Email
        let email = app.textFields["textFieldEmail"]
        email.tap()
        email.typeText("test@mail.com")
        //-----------------------------

        
        //MARK: Input Password
        let password = app.secureTextFields["textFieldPassword"]
        password.tap()
        password.typeText("BESARkecil123@--")
        //-----------------------------

        
        //MARK: Click Button Login
        app.buttons["Login"].tap()
        sleep(5)
        //-----------------------------
        
        
        //MARK: Detail View
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"Movie 1").staticTexts["Release Date: 2010"].tap()
        sleep(5)
        //-----------------------------
        
        
        //MARK: Check wishlist empty
        let tabBar = app.tabBars["Tab Bar"]
        let homeTab = tabBar.buttons["Home"]
        let wishListTab = tabBar.buttons["Wishlist"]
        
        wishListTab.tap()
        sleep(3)
        
        homeTab.tap()
        sleep(3)
        //-----------------------------
        
        
        //MARK: Add Movie to wishlist
        let favoriteInactiveButton1 = tablesQuery.cells.containing(.staticText, identifier:"Movie 1").buttons["favorite inactive"]
        let favoriteInactiveButton2 = tablesQuery.cells.containing(.staticText, identifier:"Movie 2").buttons["favorite inactive"]
        let favoriteInactiveButton5 = tablesQuery.cells.containing(.staticText, identifier:"Movie 5").buttons["favorite inactive"]
        
        favoriteInactiveButton1.tap()
        favoriteInactiveButton2.tap()
        favoriteInactiveButton5.tap()
        sleep(3)
        //-----------------------------
        
        
        //MARK: Check wishlist movie
        wishListTab.tap()
        sleep(3)
        //-----------------------------
        
        
        //MARK: Remove wishlist movie
        let favoriteButton1 = tablesQuery.cells.containing(.staticText, identifier:"Movie 1").buttons["favorite"]
        let favoriteButton2 = tablesQuery.cells.containing(.staticText, identifier:"Movie 2").buttons["favorite"]
        let favoriteButton5 = tablesQuery.cells.containing(.staticText, identifier:"Movie 5").buttons["favorite"]
        favoriteButton1.tap()
        favoriteButton2.tap()
        favoriteButton5.tap()
        sleep(3)
        //-----------------------------
        
        
        //MARK: Check list movie
        homeTab.tap()
        sleep(3)
        //-----------------------------
        
        //MARK: Logout
        app.navigationBars["Home"].buttons["Logout"].tap()
        sleep(3)
        //-----------------------------
    }

}
