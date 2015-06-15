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
    var treeSide: String!
    
    func didLoadFromCCB() {
        //allow branch to be a physics body, to detect for collisions
        
    }
    
    func setupBranchOnSide(side: String) {

        //right side
        if (side == "right") {
            _branchRight.visible = true
            _branchLeft.visible = false
            treeSide = "right"
        }
        
        //left side
        if (side == "left") {
            _branchRight.visible = false
            _branchLeft.visible = true
            treeSide = "left"
        }
        
        //no side
        if (side == "none") {
            _branchRight.visible = false
            _branchLeft.visible = false
            treeSide = "none"
        }
    }
}