//
//  Branch.swift
//  PushPush2
//
//  Created by Luke Solomon on 6/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Branch: CCNode {
    
    var _branch : CCSprite!
    
    let _branchMinimumPositionY = 0
    let _branchDistance: CGFloat = 0
    
    func didLoadFromCCB() {
        _branch.physicsBody.sensor = true
    }
    

    func setupBranchOnSide(side: NSString) {
        
        _branch.anchorPoint.y = 1
        _branch.anchorPoint.x = 0.5
        
        //right side
        if (side == "right") {
            _branch.position = ccp(_branch.position.x + 40, _branch.position.y - 80)
            _branch.flipX = true
        }
        
        //left side
        if (side == "left") {
            _branch.position = ccp(_branch.position.x - 40, _branch.position.y - 80)
            _branch.flipX = false
        }
    }
    
    
}
