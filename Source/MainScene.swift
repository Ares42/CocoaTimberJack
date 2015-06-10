import Foundation

class MainScene: CCNode {
    
    var _Background : CCNodeGradient!
    var _ScoreLabel : CCLabelTTF!
    var _timer : CCSprite!
    var _player : CCSprite!
    var _bottom : CCSprite!
    var _restartButton: CCButton!
    
    var _branch : CCSprite!
    var _branches: [CCNode] = []
    let _firstTreePosition: CGFloat = 0
    
    let time : Int = 0

    var _score : NSInteger = 0
    var _gameOver = false
    var SW = CCDirector.sharedDirector().viewSize().width
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
        _restartButton.visible = false
        
        self.spawnABranch()
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if (_gameOver == false) {
            if (touch.locationInWorld().x > SW/2) {
                println("Right")
                
                _player.anchorPoint.x = 1
                _player.flipX = false
                _player.position.x = 1
                
            } else if (touch.locationInWorld().x < SW/2) {
                println("Left")
                
                _player.anchorPoint.x = 0
                _player.flipX = true
                _player.position.x = 0
                
            }
        
        }
        println(String(stringInterpolationSegment: touch.locationInWorld()))
        updateScore()
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, _character: CCNode!, _tree1: CCNode!) -> Bool {
        self.gameOver()
        return true
    }
    
    func updateScore () {
        // to do: Implement score increase
        
        _score++
        _ScoreLabel.string = String(_score)
        
        //_branches[0].removeFromParent()
    }
    
    func spawnABranch () {
        
//        var previousBranchY = _branch.position.y
//        var previousBranchSide = _branches[10-1]
//        _branch.position.y = 1
//        if _branches.count < 5 {
//            
//            previousBranchY = _branches.last!.position.y
//            
//        }
//        
//        let branchside = Int(arc4random_uniform(99))
//        
//        if (branchside >= 0 && branchside < 44) {
//            //put a branch on the right side
//        } else if (branchside >= 45 && branchside < 90) {
//            //put a branch on the left side
//        } else if (branchside >= 90 && branchside < 99) {
//            //don't spawn a branch
//        }
//        
//        let branch = CCBReader.load("Branch") as! Branch
//        branch.position = ccp(+)
//        
    }
    
    func checkCollision () {
        
    }
    
    override func update(delta: CCTime) {
        for branch in _branches.reverse() {
            if (branch.position.y <= 0) {
                branch.removeFromParent()
                _branches.removeAtIndex(find(_branches, branch)!)
                self.spawnABranch()
            }
        }
        
        
    }
    
    func gameOver () {
        
    }
    
}