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

    let _firstPiecePosition: CGFloat = 280
    var _piece0: CCNode!
    var _piece1: CCNode!
    var _piece2: CCNode!
    var _piece3: CCNode!
    var _piece4: CCNode!
    var _piece5: CCNode!
    var _piece6: CCNode!
    var _piece7: CCNode!
    
    var _Pieces: [CCNode] = []
    
    
    //variables
    let time : Int = 0
    var _score : NSInteger = 0
    var _gameOver = false
    var SW = CCDirector.sharedDirector().viewSize().width
    var playerSide: String!
    var treeSide: String!
    
    //CCBLoading
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
        _restartButton.visible = false
        
        self.spawnABranch("none")
        self.spawnABranch(pickRandomBranchSide())
        self.spawnABranch(pickRandomBranchSide())
        self.spawnABranch(pickRandomBranchSide())
        self.spawnABranch(pickRandomBranchSide())
        self.spawnABranch(pickRandomBranchSide())
        self.spawnABranch(pickRandomBranchSide())
        self.spawnABranch(pickRandomBranchSide())
    }
    
    //Testing out the touch began stuff
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if (_gameOver == false) {
            
            //touch on the right side of the screen
            if (touch.locationInWorld().x > SW/2) {
                _player.anchorPoint.x = 1
                _player.flipX = false
                _player.position.x = SW
                playerSide = "right"
                
            //touch on the left side of the screen
            } else if (touch.locationInWorld().x < SW/2) {
                _player.anchorPoint.x = 0
                _player.flipX = true
                _player.position.x = 0
                playerSide = "left"
            }
            self.updateScore()
            self.spawnABranch(pickRandomBranchSide())
            self.removeBranchFromTree()
            self.checkIfGameOver()
        }
    }
    
    func updateScore () {
        //increase the score
        _score++
        _ScoreLabel.string = String(_score)
        
        //increase the size of the timer
        if (_timer.scaleX < 1) {
            var delta: Float = 0.1
            _timer.scaleX = _timer.scaleX + delta
        }
    }
    
    func pickRandomBranchSide () -> String{
        let branchside = Int(arc4random_uniform(99))
        
        if (branchside >= 0 && branchside < 44) {
            treeSide = "right"
        } else if (branchside >= 45 && branchside < 90) {
            treeSide = "left"
        } else if (branchside >= 90 && branchside < 99) {
            treeSide = "none"
        }
        
        return (treeSide)
    }
    
    func spawnABranch (side: String) {
        var _newPiece = CCBReader.load("Piece") as! Piece
        
        _newPiece.setupBranchOnSide(side)
        _Pieces.append(_newPiece)
        _tree.addChild(_newPiece)

        
//        _Pieces[_Pieces.count].positionInPoints = ccp(146, _Pieces[(_Pieces.count)].positionInPoints.y + 40)

        var nextPieceLocation = CGFloat((_Pieces.count * 40) + 26)
        _newPiece.positionInPoints = ccp(146, nextPieceLocation)
        
        println(_newPiece.position)
        println(_newPiece.anchorPoint)
        

        
        //
    }
    
    func removeBranchFromTree() {
        _Pieces[0].removeFromParent()
//        var previousPieceLocation = CGFloat(((_Pieces.count - 1) * 40) + 30)
        var i: Int = 0
        for Piece in _Pieces {
            _Pieces[i].positionInPoints = ccp(146, _Pieces[i].positionInPoints.y - 40)
            i++
        }
    }
    
    override func update(delta: CCTime) {
        if (_timer.scaleX > 0) {
            var delta: Float = 0.001
            _timer.scaleX = _timer.scaleX - delta
        } else {
            self.gameOver()
        }
        
    }
    
    //player has hit a tree
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, branchLeft: CCSprite!) -> Bool {
        self.gameOver()
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, branchRight: CCSprite!) -> Bool {
        self.gameOver()
        return true
    }
    
    func checkIfGameOver () {
        if (treeSide == playerSide) {
            self.gameOver()
        }
    }
    
    func gameOver () {
        _restartButton.visible = true
        _gameOver = true
        _ScoreLabel.string = "GAME OVER"
    }
    
    func restart() {
        _gameOver = false
        _restartButton.visible = false
        _score = 0
        _ScoreLabel.string = "0"
        _timer.scaleX = 1
    }
}