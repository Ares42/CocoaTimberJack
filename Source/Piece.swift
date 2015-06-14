//
//  Piece.swift
//  PushPush2
//
//  Created by Luke Solomon on 6/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Piece: CCNode {

    var _branchLeft : CCSprite!
    var _center : CCSprite!
    var _branchRight : CCSprite!
    
    func didLoadFromCCB() {
        //allow branch to be a physics body, to detect for collisions

//        _piece.addChild(_branchRight)
//        _piece.addChild(_center)
//        _piece.addChild(_branchLeft)
        
    }
    
    func setupBranchOnSide(side: String) {
        //set branch anchor point to the bottom middle of the node
        
//        var _piece = CCBReader.load("Piece") as! Piece

        //right side
        if (side == "right") {
            _branchRight.visible = true
//            _branchRight.physicsBody.sensor = true
            _branchLeft.visible = false
//            _branchLeft.physicsBody.sensor = false
        }
        
        //left side
        if (side == "left") {
            _branchRight.visible = false
//            _branchRight.physicsBody.sensor = false
            _branchLeft.visible = true
//            _branchLeft.physicsBody.sensor = true
        }
        
        //no side
        if (side == "none") {
            _branchRight.visible = false
//            _branchRight.physicsBody.sensor = false
            _branchLeft.visible = false
//            _branchLeft.physicsBody.sensor = false
        }
    }
}