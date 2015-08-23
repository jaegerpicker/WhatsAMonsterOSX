//
//  GameScene.swift
//  WhatsAMonster
//
//  Created by Shawn Campbell on 8/22/15.
//  Copyright (c) 2015 Team Awesome McPants. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = "What's a Monster?"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        myLabel.name = "menu"
        let monsterLabel = SKLabelNode(fontNamed: "Arial")
        monsterLabel.text = "Monster"
        monsterLabel.fontSize = 35
        monsterLabel.fontColor = NSColor.redColor()
        monsterLabel.position = CGPoint(x: myLabel.position.x, y: myLabel.position.y - 35)
        monsterLabel.name = "monster"
        let robotLabel = SKLabelNode(fontNamed: "Arial")
        robotLabel.text = "Robot"
        robotLabel.fontSize = 35
        robotLabel.fontColor = NSColor.blueColor()
        robotLabel.name = "robot"
        robotLabel.position = CGPoint(x: myLabel.position.x, y: myLabel.position.y - 70)
        
        self.addChild(myLabel)
        self.addChild(monsterLabel)
        self.addChild(robotLabel)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        let location = theEvent.locationInNode(self)
        let node = self.nodeAtPoint(location)
        if node.name == "monster" {
            let sprite = SKSpriteNode(imageNamed: "pinkMonster")
            sprite.position = CGPoint(x: 0 + 20, y:CGRectGetMaxY(self.frame) - 50)
            sprite.setScale(0.02)
            self.addChild(sprite)
            let robotNode = node.parent?.childNodeWithName("robot")
            robotNode?.removeFromParent()
            let menuLabel = node.parent?.childNodeWithName("menu")
            menuLabel?.removeFromParent()
            node.removeFromParent()
        } else if node.name == "robot" {
            let sprite = SKSpriteNode(imageNamed:"blueRobot")
            sprite.position = CGPoint(x: 0 + 20, y:CGRectGetMaxY(self.frame) - 50)
            sprite.setScale(0.04)
            self.addChild(sprite)
            let monsterLabel = node.parent?.childNodeWithName("monster")
            monsterLabel?.removeFromParent()
            let menuLabel = node.parent?.childNodeWithName("menu")
            menuLabel?.removeFromParent()
            node.removeFromParent()
        }
        
        //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //sprite.runAction(SKAction.repeatActionForever(action))
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
