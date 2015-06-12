import Foundation

class MainScene: CCNode {
    //CCNodes
    var _Background : CCNodeGradient!
    var _ScoreLabel : CCLabelTTF!
    var _timer : CCSprite!
    var _player : CCSprite!
    var _bottom : CCSprite!
    var _restartButton: CCButton!
    
    //branches
    var _tree : CCNode!
    var _piece  : CCSprite!
    var _Pieces: [CCNode] = []
    let _firstTreePosition: CGFloat = 0
    
    //variables
    let time : Int = 0
    var _score : NSInteger = 0
    var _gameOver = false
    var SW = CCDirector.sharedDirector().viewSize().width
    
    //CCBLoading
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
        _restartButton.visible = false
    }
    
    //Testing out the touch began stuff
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if (_player.position.x == 222 && _piece.position.x == 276) {
            self.gameOver()
        }
        if (_gameOver == false) {
            
            //touch on the right side of the screen
            if (touch.locationInWorld().x > SW/2) {
                println("Right")
                _player.anchorPoint.x = 1
                _player.flipX = false
                _player.position.x = SW
                
            //touch on the left side of the screen
            } else if (touch.locationInWorld().x < SW/2) {
                println("Left")
                _player.anchorPoint.x = 0
                _player.flipX = true
                _player.position.x = 0
            }
        }
        
        println(String(stringInterpolationSegment: touch.locationInWorld()))
        self.spawnABranch()
        self.updateScore()
    }
    
    func updateScore () {
        // to do: Implement score increase
        _score++
        _ScoreLabel.string = String(_score)
    }
    
    func spawnABranch () {
        let _newpiece: Piece! = Piece()
        
        //Creating the randomness for a branch
        let branchside = Int(arc4random_uniform(99))
        
        if (branchside >= 0 && branchside < 44) {
            _newpiece.setupBranchOnSide("right")
        } else if (branchside >= 45 && branchside < 90) {
            _newpiece.setupBranchOnSide("left")
        } else if (branchside >= 90 && branchside < 99) {

        }
        
        _Pieces.append(_newpiece)
        _tree.addChild(_newpiece)
        
        //_branches[0].removeFromParent()
    }
    
    override func update(delta: CCTime) {
        
    }
    
    //player has hit a tree
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, branch: CCSprite!) -> Bool {
        self.gameOver()
        return true
    }
    
    func gameOver () {
        _restartButton.visible = true
        _gameOver = true
    }
}