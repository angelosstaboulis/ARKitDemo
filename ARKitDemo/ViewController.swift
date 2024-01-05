//
//  ViewController.swift
//  ARKitDemo
//
//  Created by Angelos Staboulis on 4/1/24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    var labelNew = UILabel(frame: .zero)
    var labelView = UIStackView()
    @IBOutlet var sceneView: ARSCNView!
    var willOrientation:Int!=0
    var didOrienttion:Int!=0
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()

        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
 
        // Create a new scene

    
        sceneView.scene = scene
    }
    
    override func viewDidLayoutSubviews() {
        let viewLabel = createLabel(text: "Hello World")
        let salGuide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            viewLabel.centerYAnchor.constraint(equalTo: salGuide.centerYAnchor, constant: 0),
            viewLabel.centerXAnchor.constraint(equalTo: salGuide.centerXAnchor, constant: 0),
            viewLabel.widthAnchor.constraint(equalTo: salGuide.widthAnchor, multiplier: 0.9),
            viewLabel.heightAnchor.constraint(equalTo: salGuide.heightAnchor, multiplier: 0.15)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
extension ViewController{
    func createLabelView(label:UILabel)->UIStackView{
        labelView.addArrangedSubview(label)
        labelView.axis = .vertical
        labelView.distribution = .fillEqually
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.backgroundColor = UIColor.blue
        return labelView
    }
    func createLabel(text:String)->UIStackView{
        labelNew.backgroundColor = UIColor.blue
        labelNew.text = text
        labelNew.textAlignment = .center
        labelNew.numberOfLines = 0
        labelNew.lineBreakMode = .byWordWrapping
        labelNew.textColor = UIColor().random()
        labelNew.font = UIFont(name: "Arial", size: 17)
        let viewLabel = createLabelView(label: labelNew)
        sceneView.addSubview(viewLabel)
        return viewLabel
    }
}
extension UIColor{
    func random()->UIColor{
        let redValue = CGFloat(UInt32.random(in: 0...255))/255
        let greenValue = CGFloat(UInt32.random(in: 0...255))/255
        let blueValue = CGFloat(UInt32.random(in: 0...255))/255
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
