

import SpriteKit
import GameplayKit
import CoreGraphics

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    private var yellowMonster = SKSpriteNode()
    
    private var yellowclose = SKSpriteNode()
    private var Monsters = SKSpriteNode()
    private var cookie = SKSpriteNode()
    private var blue = SKSpriteNode()
    private var green = SKSpriteNode()
    private var animation = [SKTexture]()
    private var animate = [SKTexture]()
    private var ani = [SKTexture]()
    private var half = SKSpriteNode()
    private var count = 0
    private var movablenode = SKNode()
    var colorbackground = SKSpriteNode()
    //var isMultipleTouchEnabled: Bool { get set }
    override func didMove(to view: SKView) {
   self.physicsWorld.contactDelegate = self

        //background
        
        colorbackground = SKSpriteNode(imageNamed: "back")
       
        colorbackground.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(colorbackground)
        
        
        
        //yellowcrushers
        
        
       //yellowMonster = SKSpriteNode(imageNamed: "yellowcrusher")
        
       func makeYellow() {
         //   let height = UInt32(self.frame.height/2)
           // let width = UInt32(self.frame.width/2)
        yellowMonster.size = CGSize(width: 150, height: 150)
        //let rand = CGPoint(x: Int(arc4random_uniform(width)), y: Int(arc4random_uniform(height)))
        let rand = CGPoint(x: cookie.position.x + 50, y: cookie.position.y + 50)
       // yellowMonster.position = CGPoint(x: self.frame.width/2 - 500 , y:self.frame.height/2 - 500 )
        yellowMonster.position = rand
        yellowMonster.zPosition = 5
        yellowMonster.physicsBody?.categoryBitMask = WorkCategory.yellowMonster
        yellowMonster.physicsBody?.collisionBitMask = WorkCategory.cookie
        yellowMonster.physicsBody?.contactTestBitMask = WorkCategory.cookie
        yellowMonster.physicsBody?.affectedByGravity = false
        yellowMonster.physicsBody?.isDynamic = true
        
        animation.append(SKTexture(imageNamed: "yellowcrusher"))
        animation.append(SKTexture(imageNamed: "yellowclose"))

        let make = SKAction.run ({
            self.addChild(self.yellowMonster)
     })
        let new = SKAction.wait(forDuration: 3)
        let makeyellow = SKAction.sequence([make, new])
        self.run(makeyellow)
       

        

        //self.addChild(yellowMonster)
        

        
     }
        makeYellow()
        //Monsters.addChild(yellowMonster)
        
        //blue crushers
        
        //blue = SKSpriteNode(imageNamed: "bluemonster")
        blue.size = CGSize(width: 150 , height: 150)
        blue.position = CGPoint(x:self.frame.width/2 - 600, y: self.frame.height/2 - 600)
        
        blue.zPosition = 5
        self.addChild(blue)
        
        //green = SKSpriteNode(imageNamed:"greenmonster")
        green.size = CGSize(width: 150, height: 150)
        green.position = CGPoint(x:self.frame.width/2 - 100, y:self.frame.height/2 - 100)
        green.zPosition = 5
        //self.addChild(green)
              //animation.append(SKTexture(imageNamed:"yellowhands"))
        animate.append(SKTexture(imageNamed: "bluecrusher"))
        animate.append(SKTexture(imageNamed: "blueclose"))
        ani.append(SKTexture(imageNamed:"greencrusher"))
        ani.append(SKTexture(imageNamed: "greenclose"))
       
        
        
        
       let action = SKAction.animate(with: animation, timePerFrame: 0.5)
       let forever = SKAction.repeatForever(action)
       yellowMonster.run(forever)
       //yellowMonster2.run(forever)
     
        
        let act = SKAction.animate(with: animate, timePerFrame: 0.5)
        let forev = SKAction.repeatForever(act)
        blue.run(forev)
        
        let a = SKAction.animate(with: ani, timePerFrame: 0.5)
        let f = SKAction.repeatForever(a)
        green.run(f)
        self.addChild(green)
       func createCookies(){
    
        cookie = SKSpriteNode(imageNamed: "cookie")
        cookie.size = CGSize(width: 150, height: 100)
      
        
        let height = UInt32(self.frame.height/4)
        let width = UInt32(self.frame.width/4)
        
        let randomPosition = CGPoint(x: Int(arc4random_uniform(width)), y: Int(arc4random_uniform(height)))
        cookie.position = randomPosition
        cookie.physicsBody?.categoryBitMask = WorkCategory.cookie
        cookie.physicsBody?.collisionBitMask = WorkCategory.yellowMonster
        cookie.physicsBody?.contactTestBitMask = WorkCategory.yellowMonster
        cookie.physicsBody?.affectedByGravity = false
        cookie.physicsBody?.isDynamic = true
        cookie.name = "cookie"

        
        cookie.zPosition = 7
        self.addChild(cookie)
        let move = SKAction.move(to: cookie.position, duration: 3)
        //let moveForever = SKAction.repeatForever(move)
        blue.run(move)
        let rand = CGPoint(x: Int(arc4random_uniform(width)/2), y: Int(arc4random_uniform(height)/2))
        let action = SKAction.move(to: rand, duration: 5)
        let actionrepeat = SKAction.repeatForever(action)
        blue.run(actionrepeat)
                   //let move1 = SKAction.move(to: cookie.position, duration: 2.5)
        //let moveForever1 = SKAction.repeatForever(move1)
        //yellowMonster2.run(moveForever1)
        //yellowMonster2.run(actionrepeat)

        //green.run(moveForever)

                }
        func createHalf(){
            half = SKSpriteNode(imageNamed:"cookieeat")
            half.size = CGSize(width: 100, height: 100)
            half.zPosition = 7
            self.addChild(half)
            
            
        }
        //createCookies()
        
        
        
        
        let create = SKAction.run({
           createCookies()
        })
        let wait = SKAction.wait(forDuration: 5)
        let yw = SKAction.wait(forDuration: 10)        

        
              //let wait = SKAction.wait(forDuration: 5)
        let CreateWait = SKAction.sequence([create,wait])
        let CreateForever = SKAction.repeatForever(CreateWait)
        self.run(CreateForever)
         //collision
        func removeCookie(){
            enumerateChildNodes(withName: "cookie"){
                node, stop in
                node.removeFromParent()
                createHalf()
            }
        }
        
    
       
        func didBegin(_ contact: SKPhysicsContact) {
            
            let firstBody = contact.bodyA
            let secondBody = contact.bodyB
            
            if firstBody == cookie && secondBody == yellowMonster{
                print("1")
                
                          }
        else if firstBody == yellowMonster && secondBody == cookie {
               
                    removeCookie()
                print("2")
                
            }
        }
 
    
    
            }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            for node in self.children {
                if(node != yellowMonster && node != blue && node != green && node != colorbackground) {

            let location = touch.location(in: self)
            if node.contains(location) {
                movablenode = node
                movablenode.position = location
                let move = SKAction.move(to: cookie.position, duration: 3)
                let moveForever = SKAction.repeatForever(move)
                green.run(moveForever)
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, movablenode != nil {
            movablenode.position = touch.location(in: self)
            let move = SKAction.move(to: cookie.position, duration: 5)
            yellowMonster.run(move)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, movablenode != nil {
            movablenode.position = touch.location(in: self)
            //movablenode = nil
        
            
            
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            //movablenode = nil
           

        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
       
    }
}
