//
//  ViewController.swift
//  ARKit_iniciacion
//
//  Created by estech on 22/3/23.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuracion = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuracion)
//        self.dibuja()
        
        self.sceneView.autoenablesDefaultLighting = true
    }
    
//    func dibuja() {
//        let node = SCNNode()
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0, 0, -1)
//        self.sceneView.scene.rootNode.addChildNode(node)
//    }
    
    @IBAction func esferaAzul(_ sender: Any) {
        let nodeEsfera = SCNNode(geometry: SCNSphere(radius: 0.05))
        nodeEsfera.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        nodeEsfera.position = SCNVector3(0, 0, -0.4)
        self.sceneView.scene.rootNode.addChildNode(nodeEsfera)
    }
    
    
    @IBAction func cuboAmarillo(_ sender: Any) {
        let nodeCuboAmarillo = SCNNode()
        nodeCuboAmarillo.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        nodeCuboAmarillo.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        nodeCuboAmarillo.geometry?.firstMaterial?.specular.contents = UIColor.orange
        nodeCuboAmarillo.position = SCNVector3(0, 1, -1)
        nodeCuboAmarillo.eulerAngles = SCNVector3(-90.degreesToRadians, -3, 0)
        self.sceneView.scene.rootNode.addChildNode(nodeCuboAmarillo)
        
        let nodePiramide = SCNNode()
        nodePiramide.geometry = SCNPyramid(width: 0.1, height: 0.2, length: 0.1)
        nodePiramide.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        nodePiramide.position = SCNVector3(0, 0.01, 0)
        nodeCuboAmarillo.addChildNode(nodePiramide)
        
        let nodePlano = SCNNode()
        nodePlano.geometry = SCNPlane(width: 0.02, height: 0.04)
        nodePlano.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        nodePlano.position = SCNVector3(0, -0.08, 0.10001)
        nodeCuboAmarillo.addChildNode(nodePlano)
        
    }
    
    @IBAction func capsula(_ sender: Any) {
        let nodeCapsula = SCNNode(geometry: SCNCapsule(capRadius: 0.05, height: 0.3))
        nodeCapsula.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        nodeCapsula.position = SCNVector3(0, 0, -0.7)
        self.sceneView.scene.rootNode.addChildNode(nodeCapsula)
    }
    
    @IBAction func resetEscena(_ sender: Any) {
        //Pausa la sesion es decir se congela
        self.sceneView.session.pause()
        //Se eliminan todos los nodos de la sesion
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        
        //Volver a ejecutar la sesion
        self.sceneView.session.run(configuracion, options: [.resetTracking, .removeExistingAnchors])
    }
    
}

extension Int {
    var degreesToRadians: Float {
        return (Float(self) * .pi/180)
    }
}

