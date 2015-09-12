//
// LoadmenuView.swift

import UIKit

protocol LoadmenuViewDelegate {
	func drivePressed(drive: UIButton)
	func ridePressed(ride: UIButton)
}

@IBDesignable
class LoadmenuView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 768, height: 1136))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	var loadmenuViewDelegate: LoadmenuViewDelegate?

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .ScaleToFill:
				break
			case .ScaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransformMakeScale(xScale, yScale)
			scalingView.center = CGPoint(x:CGRectGetMidX(self.bounds), y:CGRectGetMidY(self.bounds))
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = NSBundle(forClass:self.dynamicType)
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:768, height:1136)
		__scaling__.center = CGPoint(x:384.0, y:568.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let drive = UIButton.buttonWithType(.Custom) as! UIButton
		drive.bounds = CGRect(x:0, y:0, width:300.0, height:300.0)
		var imgDrive: UIImage!
		if let imagePath = bundle.pathForResource("drive.png", ofType:nil) {
			imgDrive = UIImage(contentsOfFile:imagePath)
		}
		drive.setImage(imgDrive, forState:.Normal)
		drive.contentMode = .Center;
		drive.layer.position = CGPoint(x:384.000, y:343.000)
		drive.transform = CGAffineTransformMakeScale(1.50, 1.50)
		drive.addTarget(self, action:"actionDrivePressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(drive)
		viewsByName["drive"] = drive

		let ride = UIButton.buttonWithType(.Custom) as! UIButton
		ride.bounds = CGRect(x:0, y:0, width:300.0, height:300.0)
		var imgRide: UIImage!
		if let imagePath = bundle.pathForResource("ride.png", ofType:nil) {
			imgRide = UIImage(contentsOfFile:imagePath)
		}
		ride.setImage(imgRide, forState:.Normal)
		ride.contentMode = .Center;
		ride.layer.position = CGPoint(x:384.000, y:793.000)
		ride.transform = CGAffineTransformMakeScale(1.50, 1.50)
		ride.addTarget(self, action:"actionRidePressed:", forControlEvents: .TouchUpInside)
		__scaling__.addSubview(ride)
		viewsByName["ride"] = ride

		self.viewsByName = viewsByName
	}

	// - MARK: loadmenu

	func addLoadmenuAnimation() {
		addLoadmenuAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addLoadmenuAnimation(completion: ((Bool) -> Void)?) {
		addLoadmenuAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addLoadmenuAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addLoadmenuAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addLoadmenuAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addLoadmenuAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addLoadmenuAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Loadmenu")
			self.animationCompletions[layer.animationForKey("Loadmenu")] = complete
		}

		let driveTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		driveTranslationXAnimation.duration = 1.000
		driveTranslationXAnimation.values = [610.000 as Float, 0.000 as Float]
		driveTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		driveTranslationXAnimation.timingFunctions = [anticOverTiming]
		driveTranslationXAnimation.beginTime = beginTime
		driveTranslationXAnimation.fillMode = fillMode
		driveTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["drive"]?.layer.addAnimation(driveTranslationXAnimation, forKey:"loadmenu_TranslationX")

		let rideTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		rideTranslationXAnimation.duration = 1.000
		rideTranslationXAnimation.values = [-610.000 as Float, 0.000 as Float]
		rideTranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		rideTranslationXAnimation.timingFunctions = [anticOverTiming]
		rideTranslationXAnimation.beginTime = beginTime
		rideTranslationXAnimation.fillMode = fillMode
		rideTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["ride"]?.layer.addAnimation(rideTranslationXAnimation, forKey:"loadmenu_TranslationX")
	}

	func removeLoadmenuAnimation() {
		self.layer.removeAnimationForKey("Loadmenu")
		self.viewsByName["drive"]?.layer.removeAnimationForKey("loadmenu_TranslationX")
		self.viewsByName["ride"]?.layer.removeAnimationForKey("loadmenu_TranslationX")
	}

	override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValueForKey(anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimationForKey("Loadmenu")
	}

	func actionDrivePressed(drive: UIButton) {
		loadmenuViewDelegate?.drivePressed(drive)
	}

	func actionRidePressed(ride: UIButton) {
		loadmenuViewDelegate?.ridePressed(ride)
	}
}