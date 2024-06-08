//
//  StaticFunctions.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit
import StoreKit

let mainColor = UIColor.black
let subColor = UIColor(hexString: "#03FFDD")

func isDebug_pbn10() -> Bool {
    return false
}

func getScale_pbn10() -> CGFloat {
    return getWindowSize_pbn10().width / 375
//    return isPad() ? getWindowSize_pbn10().width / 1024 : getWindowSize_pbn10().width / 375
}

func getWindowSize_pbn10() -> CGSize {
    return UIApplication.shared.keyWindow?.bounds.size ?? UIScreen.main.bounds.size
}

func statusBarHeight_pbn10() -> CGFloat {
    let statusBarSize = UIApplication.shared.statusBarFrame.size
    return Swift.min(statusBarSize.width, statusBarSize.height)
}

func createImage_pbn10(name: String, tintColor: UIColor? = nil, corner: CGFloat = 0) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false

    imageView.image = getImage_pbn10(named: name)
    
    if let tintColor = tintColor {
        imageView.tintColor = tintColor
    }
    
    if corner > 0 {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = corner
    }

    return imageView
}

func createLabel_pbn10(size: CGFloat, text: String, color: UIColor, font: FontEnum_pbn10 = .DEFAULT_pbn10, textAlignment: NSTextAlignment = .natural, numberOfLines: Int = 1) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = color
    label.textAlignment = textAlignment
    label.numberOfLines = numberOfLines
    if font == .DEFAULT_pbn10 {
        label.font = UIFont.systemFont(ofSize: size)
    } else {
        label.font = UIFont(name: font.rawValue, size: size)
    }

    return label
}

func createScrollView_pbn10(color: UIColor, corner: CGFloat = 0) -> UIScrollView {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    
    if corner > 0 {
        view.layer.cornerRadius = corner
        view.clipsToBounds = true
    }
    
    return view
}

func createProgressView_pbn10(colorStart: UIColor, colorEnd: UIColor, width: CGFloat, height: CGFloat, corner: CGFloat, isLeftToRight: Bool = false) -> UIProgressView {
    let progressUpload = UIProgressView()
    progressUpload.translatesAutoresizingMaskIntoConstraints = false
    progressUpload.isUserInteractionEnabled = false
    
    if corner > 0 {
        progressUpload.layer.cornerRadius = corner
        progressUpload.clipsToBounds = true
    }
    
    let progressImage = UIImage.gradientImage(colorStart: colorStart, colorEnd: colorEnd, width: width, height: height, corner: corner, isLeftToRight: isLeftToRight)
    progressUpload.progressImage = progressImage
    
    progressUpload.setProgress(0, animated: false)
    return progressUpload
}

func createSearchBar_pbn10() -> UISearchBar {
    let searchBar = UISearchBar()
    searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    searchBar.backgroundColor = .clear
    searchBar.barTintColor = .clear
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.placeholder = "Search Picture"
    return searchBar
}

func getFont_pbn10(font: FontEnum_pbn10 = .DEFAULT_pbn10, size: CGFloat) -> UIFont {
    return UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
}

func createTextView_pbn10(size: CGFloat, text: String, color: UIColor, bgColor: UIColor = .clear, font: FontEnum_pbn10 = .DEFAULT_pbn10, corner: CGFloat = 0) -> UITextView {
    let textView = UITextView()
    setupTextView_pbn10(textView: textView, size: size, text: text, color: color, bgColor: bgColor, font: font, corner: corner)
    return textView
}

func setupTextView_pbn10(textView: UITextView, size: CGFloat, text: String, color: UIColor, bgColor: UIColor = .clear, font: FontEnum_pbn10 = .DEFAULT_pbn10, corner: CGFloat = 0) {
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.text = text
    textView.textColor = color
    textView.backgroundColor = bgColor

    if font == .DEFAULT_pbn10 {
        textView.font = UIFont.systemFont(ofSize: size)
    } else {
        textView.font = UIFont(name: font.rawValue, size: size)
    }
    
    if corner > 0 {
        textView.layer.cornerRadius = corner
    }

    textView.isEditable = false
    textView.isSelectable = false
    textView.isScrollEnabled = false
    textView.isUserInteractionEnabled = false
}

func createTextView_pbn10(size: CGFloat, text: String, color: UIColor, fontName: String) -> UITextView {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.text = text
    textView.textColor = color
    textView.backgroundColor = UIColor.clear
    textView.font = UIFont(name: fontName, size: size)
    textView.isEditable = false
    textView.isSelectable = false
    textView.isScrollEnabled = false
    textView.isUserInteractionEnabled = false
    return textView
}

func createTextField_pbn10(size: CGFloat, text: String, placeholderText: String, color: UIColor, placeholderColor: UIColor, bgColor: UIColor, font: FontEnum_pbn10, alignment: NSTextAlignment = .left, corner: CGFloat = 0) -> UITextField {
    let paragraphStyle =  NSMutableParagraphStyle()
    paragraphStyle.alignment = alignment
    
    let customFont: UIFont
    if font == .DEFAULT_pbn10 {
        customFont = UIFont.systemFont(ofSize: size)
    } else {
        customFont = UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.text = text
    textField.textColor = color
    textField.backgroundColor = bgColor
    textField.font = customFont
    textField.textAlignment = alignment
    
    let attributes = [
        NSAttributedString.Key.font: customFont,
        NSAttributedString.Key.foregroundColor: placeholderColor,
        NSAttributedString.Key.paragraphStyle: paragraphStyle
    ]
    textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
    
    if corner > 0 {
        textField.layer.cornerRadius = corner
    }
    
    return textField
}

func createSearchBar_pbn10(barStyle: UIBarStyle, size: CGFloat, text: String, placeholderText: String, color: UIColor, textfieldColor: UIColor, placeholderColor: UIColor, bgColor: UIColor, glassColor: UIColor? = nil , font: FontEnum_pbn10, alignment: NSTextAlignment = .left, corner: CGFloat = 0) -> UISearchBar {
    let paragraphStyle =  NSMutableParagraphStyle()
    paragraphStyle.alignment = alignment
    
    let customFont: UIFont
    if font == .DEFAULT_pbn10 {
        customFont = UIFont.systemFont(ofSize: size)
    } else {
        customFont = UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    searchBar.barStyle = barStyle
    searchBar.backgroundColor = bgColor
    
    if let textField = searchBar.textField {
        textField.frame = CGRect(x: 0, y: 0, width: searchBar.frame.width, height: searchBar.frame.height)
        
        textField.text = text
        textField.textColor = color
        textField.backgroundColor = textfieldColor
        textField.font = customFont
        textField.textAlignment = alignment
        
        let attributes = [
            NSAttributedString.Key.font: customFont,
            NSAttributedString.Key.foregroundColor: placeholderColor,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        
        if let glassColor = glassColor {
            let glassIconView = textField.leftView as? UIImageView
            glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
            glassIconView?.tintColor = glassColor
        }
    }
    
    if corner > 0 {
        searchBar.layer.cornerRadius = corner
    }
    
    return searchBar
}

func createView_pbn10(color: UIColor) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    return view
}

func createView_pbn10(color: UIColor, corner: CGFloat, borderWidth: CGFloat = 0, borderColor: UIColor = .clear) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = color
    view.layer.cornerRadius = corner
    if borderWidth != 0 {
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
    }
    return view
}

func createImageButton_pbn10(name: String, tintColor: UIColor? = nil, contentmode: UIView.ContentMode? = .scaleAspectFit, autoConstraint: Bool = false, corner: CGFloat = 0) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = autoConstraint
    
    if let tintColor = tintColor {
        if let tintedImage = getImage_pbn10(named: name)?.withRenderingMode(.alwaysTemplate) {
            button.setBackgroundImage(tintedImage, for: .normal)
        }
        button.tintColor = tintColor
    } else {
        button.setBackgroundImage(getImage_pbn10(named: name), for: .normal)
    }
    if let contentmode = contentmode {
        button.imageView?.contentMode = contentmode
    }
    
    if corner > 0 {
        button.imageView?.layer.cornerRadius = corner
    }

    return button
}

func createImageButton_pbn10(image: UIImage) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(image, for: .normal)

    return button
}

func getImage_pbn10(named: String) -> UIImage? {
    guard named.count > 0 else {
        return nil
    }
    
    #if ENV_20
    if let image_pbn10 = UIImage(named: "\(named)_20") {
        return image_pbn10
    } else if let image = UIImage(named: named) {
        return image
    } else if let image = UIImage(systemName: named) {
        return image
    } else {
        return nil
    }
    #else
    if let image = UIImage(named: named) {
        return image
    } else if let image = UIImage(systemName: named) {
        return image
    } else {
        return nil
    }
    #endif
}

func createTextButton_pbn10(size: CGFloat, text: String, textColor: UIColor, bgColor: UIColor, font: FontEnum_pbn10 = .DEFAULT_pbn10, uppercased: Bool = false) -> UIButton {
    let systemDefaultBtn: UIButton = UIButton(type: UIButton.ButtonType.system)
    systemDefaultBtn.translatesAutoresizingMaskIntoConstraints = false
    systemDefaultBtn.backgroundColor = bgColor

    systemDefaultBtn.setTitleColor(textColor, for: UIControl.State.normal)

    if uppercased {
        systemDefaultBtn.setTitle(text.uppercased(), for: UIControl.State.normal)
    } else {
        systemDefaultBtn.setTitle(text, for: UIControl.State.normal)
    }

    if font == .DEFAULT_pbn10 {
        systemDefaultBtn.titleLabel?.font = UIFont.systemFont(ofSize: size)
    } else {
        systemDefaultBtn.titleLabel?.font = UIFont(name: font.rawValue, size: size)
    }

    return systemDefaultBtn
}

func createTextButton_pbn10(type: UIButton.ButtonType = .system, size: CGFloat, text: String, textColor: UIColor, bgColor: UIColor, font: FontEnum_pbn10 = .DEFAULT_pbn10, corner: CGFloat = 0) -> UIButton {
    let systemDefaultBtn: UIButton = UIButton(type: type)
    systemDefaultBtn.translatesAutoresizingMaskIntoConstraints = false
    systemDefaultBtn.backgroundColor = bgColor
    systemDefaultBtn.setTitle(text, for: UIControl.State.normal)
    systemDefaultBtn.setTitleColor(textColor, for: UIControl.State.normal)
    systemDefaultBtn.layer.cornerRadius = corner
    if font == .DEFAULT_pbn10 {
        systemDefaultBtn.titleLabel?.font = UIFont.systemFont(ofSize: size)
    } else {
        systemDefaultBtn.titleLabel?.font = UIFont(name: font.rawValue, size: size)
    }
    return systemDefaultBtn
}

func addShadow_pbn10(view: UIView, width: CGFloat, height: CGFloat, shadowOpacity: Float = 0.18, shadowRadius: CGFloat = 2.0, shadowColor: UIColor = UIColor.black) {
    view.layer.shadowOffset = CGSize(width: width, height: height)
    view.layer.shadowOpacity = shadowOpacity
    view.layer.shadowRadius = shadowRadius
    view.layer.shadowColor = shadowColor.cgColor
}

func createSegment_pbn10(items: [String], selectedColor: UIColor = subColor, selectedTextColor: UIColor = .black, corner: CGFloat = 0) -> UISegmentedControl {
    let segmentedControl = UISegmentedControl(items: items)
    segmentedControl.selectedSegmentTintColor = selectedColor
    segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedTextColor], for: .selected)
    segmentedControl.layer.cornerRadius = corner
    return segmentedControl
}

func createSwitch_pbn10(color: UIColor = subColor) -> UISwitch {
    let switchView = UISwitch(frame: .zero)
    switchView.onTintColor = color.withAlphaComponent(0.5)
    switchView.thumbTintColor = color
    return switchView
}

func createSwitch(onTintColor: UIColor, thumbTintColor: UIColor) -> UISwitch {
    let switchView = UISwitch(frame: .zero)
    switchView.translatesAutoresizingMaskIntoConstraints = false
    switchView.onTintColor = onTintColor
    switchView.thumbTintColor = thumbTintColor
    return switchView
}

func combineToAttText(texts: [String], sizes: [CGFloat], colors: [UIColor], fonts: [FontEnum_pbn10]) -> NSAttributedString {
    let combination = NSMutableAttributedString()

    guard texts.count > 0,
        texts.count == sizes.count,
        texts.count == colors.count,
        texts.count == fonts.count else {
        print("combineText count Error")
        return combination
    }

    for i in 0 ..< texts.count {
        let text: String = texts[i]
        let size: CGFloat = sizes[i]
        let color: UIColor = colors[i]
        let f: FontEnum_pbn10 = fonts[i]
        if let font: UIFont = (f == FontEnum_pbn10.DEFAULT_pbn10) ? UIFont.systemFont(ofSize: size) : UIFont(name: f.rawValue, size: size) {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color,
                .font: font,
            ]
            let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
            combination.append(attributedString)
        } else {
            print("combineText font Error")
        }
    }

    return combination
}

func getInt_pbn10(_ key: String, _ defaultKey: Int) -> Int {
    let prefs = UserDefaults.standard
    if prefs.object(forKey: key) == nil {
        return defaultKey
    } else {
        return prefs.integer(forKey: key)
    }
}

func setInt_pbn10(_ key: String, _ value: Int) {
    let prefs = UserDefaults.standard
    prefs.set(value, forKey: key)
}

func getFloat_pbn10(_ key: String, _ defaultKey: Float) -> Float {
    let prefs = UserDefaults.standard
    if prefs.object(forKey: key) == nil {
        return defaultKey
    } else {
        return prefs.float(forKey: key)
    }
}

func setFloat_pbn10(_ key: String, _ value: Float) {
    let prefs = UserDefaults.standard
    prefs.set(value, forKey: key)
}

func getBool_pbn10(_ key: String, _ defaultKey: Bool) -> Bool {
    let prefs = UserDefaults.standard
    if prefs.object(forKey: key) == nil {
        return defaultKey
    } else {
        return prefs.bool(forKey: key)
    }
}

func setBool_pbn10(_ key: String, _ value: Bool) {
    let prefs = UserDefaults.standard
    prefs.set(value, forKey: key)
}

func getString_pbn10(_ key: String, _ defaultKey: String) -> String {
    let prefs = UserDefaults.standard
    return prefs.string(forKey: key) ?? defaultKey
}

func setString_pbn10(_ key: String, _ value: String) {
    let prefs = UserDefaults.standard
    prefs.setValue(value, forKeyPath: key)
}

func setStringList_pbn10(_ key: String, _ value: [String]) {
    let prefs = UserDefaults.standard
    prefs.setValue(value, forKeyPath: key)
}

func getStringList_pbn10(_ key: String) -> [String] {
    let prefs = UserDefaults.standard
    return prefs.stringArray(forKey: key) ?? [String]()
}

func setBoolList_pbn10(_ key: String, _ value: [Bool]) {
    let prefs = UserDefaults.standard
    prefs.setValue(value, forKeyPath: key)
}

func getBoolList_pbn10(_ key: String, _ defaultKey: [Bool]) -> [Bool] {
    let prefs = UserDefaults.standard
    return prefs.object(forKey: key) as? [Bool] ?? defaultKey
}

func getPoint_pbn10(_ key: String, _ defaultKey: CGPoint?) -> CGPoint? {
    let key1 = "\(key)_1"
    let key2 = "\(key)_2"
    
    let prefs = UserDefaults.standard
    if prefs.object(forKey: key1) == nil || prefs.object(forKey: key1) == nil {
        return defaultKey
    } else {
        let value1 = prefs.float(forKey: key1)
        let value2 = prefs.float(forKey: key2)
        return CGPoint(x: CGFloat(value1), y: CGFloat(value2))
    }
}

func setPoint_pbn10(_ key: String, _ value: CGPoint) {
    let key1 = "\(key)_1"
    let key2 = "\(key)_2"
    
    let prefs = UserDefaults.standard
    prefs.set(Float(value.x), forKey: key1)
    prefs.set(Float(value.y), forKey: key2)
}

func shadow_pbn10(layer: CALayer) {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 2.0
    layer.shadowOpacity = 0.8
    layer.shadowOffset = CGSize(width: 0, height: 2)
    layer.masksToBounds = false
}

func createCollectionView_pbn10(isHorizontal: Bool = true, headerHeight: CGFloat = 0, showScrollBar: Bool = false, corner: CGFloat = 0) -> UICollectionView {
    let flowLayout = UICollectionViewFlowLayout()
    if isHorizontal {
        flowLayout.scrollDirection = .horizontal

    } else {
        flowLayout.scrollDirection = .vertical
    }

    if headerHeight > 0 {
        flowLayout.headerReferenceSize = CGSize(width: getWindowSize_pbn10().width, height: headerHeight)
    }

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false

    collectionView.alwaysBounceVertical = true
    collectionView.backgroundColor = .clear
    collectionView.scrollsToTop = true
    collectionView.showsVerticalScrollIndicator = showScrollBar
    collectionView.showsHorizontalScrollIndicator = showScrollBar
    
    if corner > 0 {
        collectionView.layer.cornerRadius = corner
    }
    
    return collectionView
}

func parseFloat_pbn10(_ s: String) -> CGFloat {
    let numberFormatter = NumberFormatter()
    return CGFloat(numberFormatter.number(from: s)!.floatValue)
}

func parseDouble_pbn10(_ s: String) -> Double {
    let numberFormatter = NumberFormatter()
    return numberFormatter.number(from: s)!.doubleValue
}

func addGradient_pbn10(view: UIView, colorStart: UIColor, colorEnd: UIColor, width: CGFloat, height: CGFloat, corner: CGFloat, isLeftToRight: Bool = false) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.name = "gradientLayer"
    gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    gradientLayer.colors = [colorStart.cgColor, colorEnd.cgColor]
    if isLeftToRight {
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    gradientLayer.cornerRadius = corner
    view.layer.insertSublayer(gradientLayer, at: 0)
}

func addTopGradient_pbn10(view: UIView, colorStart: UIColor, colorEnd: UIColor, width: CGFloat, height: CGFloat, corner: CGFloat) {
    let gradient = CAGradientLayer()
    gradient.frame = CGRect(x: 0, y: 0, width: width, height: height)
    gradient.colors = [colorStart.cgColor, colorEnd.cgColor]
    gradient.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    gradient.cornerRadius = corner
    view.layer.insertSublayer(gradient, at: 0)
}

func addGradient_pbn10(view: UIView, c1: UIColor, c2: UIColor, c3: UIColor, width: CGFloat, height: CGFloat, corner: CGFloat, isLeftToRight: Bool = true) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.name = "gradientLayer"
    gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)

    gradientLayer.colors = [c1.cgColor, c2.cgColor, c3.cgColor]
    gradientLayer.locations = [0, 0.5, 1]

    if isLeftToRight {
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    }

    gradientLayer.cornerRadius = corner
    view.layer.insertSublayer(gradientLayer, at: 0)
}

func addGradient_pbn10(view: UIView, colorStart: UIColor, colorEnd: UIColor, width: CGFloat, height: CGFloat, startPoint: CGPoint, endPoint: CGPoint, corner: CGFloat) {
    let gradient = CAGradientLayer()
    gradient.name = "gradientLayer"
    gradient.frame = CGRect(x: 0, y: 0, width: width, height: height)
    gradient.colors = [colorStart.cgColor, colorEnd.cgColor]

    gradient.startPoint = startPoint
    gradient.endPoint = endPoint

    gradient.cornerRadius = corner
    view.layer.insertSublayer(gradient, at: 0)
}

func addBorderGradient_pbn10(view: UIView, colorStart: UIColor, colorEnd: UIColor, width: CGFloat, height: CGFloat, corner: CGFloat, borderWidth: CGFloat, strokeColor: UIColor = .black) {
    let gradient = CAGradientLayer()
    gradient.name = "gradientLayer"
    gradient.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height))
    gradient.colors = [colorStart.cgColor, colorEnd.cgColor]

    let shape = CAShapeLayer()
    shape.path = UIBezierPath(roundedRect: CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height)), cornerRadius: corner).cgPath
    shape.lineWidth = borderWidth
    shape.strokeColor = strokeColor.cgColor
    shape.fillColor = UIColor.clear.cgColor
    gradient.mask = shape

    view.layer.addSublayer(gradient)
}

func roundCorners(view: UIView, cornerRadius: Double) {
    let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))

    let maskLayer = CAShapeLayer()
    maskLayer.frame = view.bounds
    maskLayer.path = path.cgPath
    view.layer.mask = maskLayer
}

func getBackGroundColor_pbn10() -> UIColor {
    return UIColor(rgb: 0xF0F0F0)
}

func getNotchTop_pbn10() -> CGFloat {
    let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
    return topPadding
}

func getSafeAreaTop_pbn10() -> CGFloat {
    let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
    return topPadding
}

func getSafeAreaBottom_pbn10() -> CGFloat {
    let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
    return bottomPadding
}

func convertToGrayScale_pbn10(image: UIImage) -> UIImage {
    let imageRect: CGRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
    let colorSpace = CGColorSpaceCreateDeviceGray()
    let width = image.size.width
    let height = image.size.height

    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
    let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
    // have to draw before create image

    context?.draw(image.cgImage!, in: imageRect)
    let imageRef = context!.makeImage()
    let newImage = UIImage(cgImage: imageRef!)

    return newImage
}

func getTodayString_pbn10(date: Date = Date(), dateFromat: String = "yyyy-MM-dd") -> String {
    let format = DateFormatter()
    format.dateFormat = dateFromat
    var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "UTC" }
    format.locale = Locale.init(identifier: localTimeZoneAbbreviation)
    format.timeZone = NSTimeZone.local

    let formattedDate = format.string(from: date)
//    print("formattedDate", formattedDate)
    return formattedDate
}

//func isSameDay(key: String, saveToday: Bool = true) -> Bool {
//    let today: String = getTodayString_pbn10()
//    let isSameDay: Bool = (getString_pbn10(key, "") == today)
//    if isSameDay {
//        return true
//    } else {
//        if saveToday {
//            setString_pbn10(key, today)
//        }
//        return false
//    }
//}

func isSameDay(key: String, saveToday: Bool = true) -> Bool {
    func getStoredTimeInterval(_ key: String) -> TimeInterval {
        let storedTimeInterval = UserDefaults.standard.double(forKey: key)
        return storedTimeInterval
    }

    func setStoredTimeInterval(_ key: String, _ timeInterval: TimeInterval) {
        UserDefaults.standard.set(timeInterval, forKey: key)
    }
    
    let todayTimeInterval: TimeInterval = Date().timeIntervalSince1970
        
    let storedDateTimeInterval: TimeInterval = getStoredTimeInterval(key)
        
    let isSameDay: Bool = Calendar.current.isDate(Date(timeIntervalSince1970: storedDateTimeInterval), inSameDayAs: Date(timeIntervalSince1970: todayTimeInterval))

    if todayTimeInterval < storedDateTimeInterval {
        return true
    }
    if isSameDay {
        return true
    } else {
        if saveToday {
            setStoredTimeInterval(key, todayTimeInterval)
        }
        return false
    }
}

func isEverShow(key: String, willShow: Bool) -> Bool {
    let isShow: Bool = getBool_pbn10(key, false)
    if isShow {
        return true
    } else {
        if willShow == true {
            setBool_pbn10(key, true)
        }
        return false
    }
}

func addImageAndTextToButton_pbn10(btnBg: UIView, widthMax: CGFloat, height: CGFloat, imageName: String, imageSize: CGFloat, maxTextSize: CGFloat, text: String, distancePhotoAndText: CGFloat, textColor: UIColor = .white) {
    let containTakePhoto = createView_pbn10(color: .clear)
    containTakePhoto.isUserInteractionEnabled = false
    btnBg.addSubview(containTakePhoto)
    NSLayoutConstraint.activate([
        containTakePhoto.centerXAnchor.constraint(equalTo: btnBg.centerXAnchor),
        containTakePhoto.centerYAnchor.constraint(equalTo: btnBg.centerYAnchor),
        containTakePhoto.widthAnchor.constraint(lessThanOrEqualToConstant: widthMax),
        containTakePhoto.heightAnchor.constraint(equalToConstant: height),
    ])
    containTakePhoto.isUserInteractionEnabled = false

    let ivTakePhoto = createImage_pbn10(name: imageName)
    btnBg.addSubview(ivTakePhoto)
    NSLayoutConstraint.activate([
        ivTakePhoto.leadingAnchor.constraint(equalTo: containTakePhoto.leadingAnchor),
        ivTakePhoto.centerYAnchor.constraint(equalTo: containTakePhoto.centerYAnchor),
        ivTakePhoto.widthAnchor.constraint(equalToConstant: imageSize),
        ivTakePhoto.heightAnchor.constraint(equalToConstant: imageSize),
    ])

    let tvTakePhoto = createLabel_pbn10(size: maxTextSize, text: text, color: textColor)
    btnBg.addSubview(tvTakePhoto)
    tvTakePhoto.adjustsFontSizeToFitWidth = true
    NSLayoutConstraint.activate([
        tvTakePhoto.leadingAnchor.constraint(equalTo: ivTakePhoto.trailingAnchor, constant: distancePhotoAndText),
        tvTakePhoto.centerYAnchor.constraint(equalTo: containTakePhoto.centerYAnchor),
        tvTakePhoto.trailingAnchor.constraint(equalTo: containTakePhoto.trailingAnchor),
    ])
}

func addBorder_pbn10(view: UIView, color: Int, borderWidth: CGFloat, corner: CGFloat) {
    view.layer.cornerRadius = corner
    view.layer.borderWidth = borderWidth
    view.layer.borderColor = UIColor(rgb: color).cgColor
}

class TopCornerImageView_pbn10: UIImageView {
    var radius: CGFloat = 0.0
    init(image: UIImage?, radius: CGFloat) {
        super.init(image: image)
        self.radius = radius
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: radius)
    }
}

class TopCornerView_pbn10: UIView {
    var radius: CGFloat = 0.0

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: radius)
    }
}

class CornerTextView_pbn10: UITextView {
    var radius: CGFloat = 0.0
    var rectCorner: UIRectCorner = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: rectCorner, radius: radius)
    }
}

class BottomCornerView_pbn10: UIView {
    var radius: CGFloat = 0.0

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
    }
}

class LeftCornerView_pbn10: UIView {
    var radius: CGFloat = 0.0

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .bottomLeft], radius: radius)
    }
}

class BottomRightCornerView_pbn10: UIView {
    var radius: CGFloat = 0.0

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.bottomRight], radius: radius)
    }
}

class TopRightCornerView_pbn10: UIView {
    var radius: CGFloat = 0.0

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topRight], radius: radius)
    }
}

func getStringWidth(_ string: String, fontSize: CGFloat, fontEnum_pbn10: FontEnum_pbn10) -> CGFloat {
    let font: UIFont = UIFont(name: fontEnum_pbn10.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    
    let attributes = [NSAttributedString.Key.font: font]
    let attributedText = NSAttributedString(string: string, attributes: attributes)
        
    let maxWidth = CGFloat.greatestFiniteMagnitude
    let maxSize = CGSize(width: maxWidth, height: font.lineHeight)
    let boundingRect = attributedText.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
    
    return boundingRect.width
    
//    let fontAttributes = [NSAttributedString.Key.font: font]
//    let size = (string as NSString).size(withAttributes: fontAttributes)
//    return size.width
}

func getTextRectSize(text: String, fontEnum: FontEnum_pbn10, fontSize: CGFloat, fixedWidth: CGFloat) -> CGSize {
    let font = UIFont(name: fontEnum.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    let maxSize = CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
    let options = NSStringDrawingOptions.usesLineFragmentOrigin
    let attributes = [NSAttributedString.Key.font: font]

    let boundingRect = NSString(string: text).boundingRect(with: maxSize, options: options, attributes: attributes, context: nil)
    let rectSize = boundingRect.size
    return rectSize
}

func getFullscreenFrame() -> CGRect {
    return CGRect(x: 0, y: 0, width: getWindowSize_pbn10().width, height: getWindowSize_pbn10().height)
}

class UpperLeftCornerView_pbn10: UIView {
    var radius: CGFloat = 0.0

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft], radius: radius)
    }
}

func getDailyReaminTime_pbn10() -> String {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)
    let todaySecond = 86400 - (hour * 3600 + minutes * 60 + seconds)
    if todaySecond < 0 {
        return "00:00:00"
    }

    var result = ""
    let h = todaySecond / 3600
    if h >= 10 {
        result += "\(h):"
    } else {
        result += "0\(h):"
    }

    let m = (todaySecond / 60) % 60
    if m >= 10 {
        result += "\(m):"
    } else {
        result += "0\(m):"
    }

    let s = todaySecond % 60
    if s >= 10 {
        result += "\(s)"
    } else {
        result += "0\(s)"
    }

    return result
}

func date2String(_ date: Date, dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "zh_Hant_TW")
    formatter.dateFormat = dateFormat
    let date = formatter.string(from: date)
    return date
}

func getCurrentTimeString() -> String {
    return date2String(Date(), dateFormat: "yyyy-MM-dd HH:mm:ss")
}

func string2Date(_ string: String, dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> Date {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "zh_Hant_TW")
    formatter.dateFormat = dateFormat
    let date = formatter.date(from: string)
    print("string 2 date input = \(string)")
    return date!
}

func createCombineImage_pbn10(named: String, x: CGFloat = 0, y: CGFloat = 0, w: CGFloat = 0, h: CGFloat = 0) -> NSAttributedString {
    let image = NSTextAttachment()
    image.image = getImage_pbn10(named: named)
    image.bounds = CGRect(x: x, y: y, width: w, height: h)
    return NSAttributedString(attachment: image)
}

func createCombineText_pbn10(text: String, color: UIColor, size: CGFloat, font: FontEnum_pbn10, alignment: NSTextAlignment = .left) -> NSMutableAttributedString {
    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = alignment
    let attributes1: [NSAttributedString.Key: Any] = [
        .foregroundColor: color,
        .font: getFont_pbn10(font: font, size: size),
        .paragraphStyle: paragraph
    ]
    let result = NSMutableAttributedString(string: text, attributes: attributes1)
    return result
}

func createCombineText_pbn10(text: String, color: UIColor, size: CGFloat, font: FontEnum_pbn10, strokeWidth: CGFloat, strokeColor: UIColor) -> NSMutableAttributedString {
    let attributes1: [NSAttributedString.Key: Any] = [
        .foregroundColor: color,
        .font: getFont_pbn10(font: font, size: size),
        .strokeWidth: strokeWidth,
        .strokeColor: strokeColor,
    ]
    let result = NSMutableAttributedString(string: text, attributes: attributes1)
    return result
}

func drawDashLine_pbn10(lineView: UIView, lineLength: CGFloat, lineSpacing: CGFloat, lineColor: UIColor) {
    let shapeLayer = CAShapeLayer()
    shapeLayer.bounds = lineView.bounds
    //        只要是CALayer这种类型,他的anchorPoint默认都是(0.5,0.5)
    shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
    //        shapeLayer.fillColor = UIColor.blue.cgColor
    shapeLayer.strokeColor = lineColor.cgColor

    shapeLayer.lineWidth = lineView.frame.size.height
    shapeLayer.lineJoin = .round

    shapeLayer.lineDashPattern = [NSNumber(value: Int(lineLength)), NSNumber(value: Int(lineSpacing))]

    let path = CGMutablePath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: lineView.frame.size.width, y: 0))

    shapeLayer.path = path
    lineView.layer.addSublayer(shapeLayer)
}

func createIndicator_pbn10(style: UIActivityIndicatorView.Style = .medium, color: UIColor? = nil) -> UIActivityIndicatorView {
    let indicator = UIActivityIndicatorView(style: style)
    indicator.translatesAutoresizingMaskIntoConstraints = false
    if let color = color {
        indicator.color = color
    }
    return indicator
}

func removeGradient_pbn10(view: UIView) {
    view.layer.sublayers?.forEach {
        if $0.name == "gradientLayer" {
            $0.removeFromSuperlayer()
        }
    }
}

func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
    return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
}

func getSafeAreaHeight(view: UIView) -> CGFloat {
    let guide = view.safeAreaLayoutGuide
    let height = guide.layoutFrame.size.height
    print("safe Height = \(height)")
    return height
}

func getSafeAreaTop(view: UIView) -> CGFloat {
    let guide = view.safeAreaLayoutGuide
    let top = guide.layoutFrame.origin.y
    print("safe top = \(top)")
    return top
}

func isPad() -> Bool{
    if(UIDevice.current.userInterfaceIdiom == .pad){
        return true
    }
    return false
}

func isShortScreen() -> Bool { // protrait only
    let isShortScreen = isPad() || (getWindowSize_pbn10().width / getWindowSize_pbn10().height) >= 0.55
    // screen w/h
    // ip8  0.562
    // ip12 0.46
    // ipad 0.74
    
    return isShortScreen
}

func isRightToLeftUI() -> Bool {
    let isRightToLeft: Bool = UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.rightToLeft
    return isRightToLeft
}

func getWindow() -> UIWindow? {
    if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
        return window
    }
    return nil
}

func getCustomFontNames(fontFileNames: [String]) -> [String : String] {
    var dic: [String : String] = Dictionary()
    
    for fontFileName in fontFileNames {
        if let fonstScriptName = handleGetFontName(fontFileName: fontFileName, fontType: "ttf") {
            dic[fontFileName] = fonstScriptName
        } else if let fonstScriptName = handleGetFontName(fontFileName: fontFileName, fontType: "otf") {
            dic[fontFileName] = fonstScriptName
        }
    }
    
    return dic
}

private func handleGetFontName(fontFileName: String, fontType: String = "ttf") -> String? {
    if let urlpath = Bundle.main.path(forResource: fontFileName, ofType: fontType) {
        let url = NSURL.fileURL(withPath: urlpath)
        if let dataProvider = CGDataProvider(url: url as CFURL),
            let cgFont = CGFont(dataProvider),
            let cgFontScriptName = cgFont.postScriptName {
            let fonstScriptName = String(cgFontScriptName as NSString)
            
            var error: Unmanaged<CFError>?
            if CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) == true {
                return fonstScriptName
            } else {
                if let _ = UIFont(name: fonstScriptName, size: 10) {
                    return fonstScriptName
                } else {
                    print("*** Error getCustomFontNames:\(fontFileName)")
                }
            }
        }
    }
    return nil
}

func imageFromLayer(layer: CALayer) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, layer.isOpaque, 0)
    layer.render(in: UIGraphicsGetCurrentContext()!)
    let outputImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return outputImage ?? UIImage()
}

func applyGradientOnView(view: UIView, colors: [UIColor], direction: String, size: CGSize) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.name = "gradientLayer"
    gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

    var cgColors = [CGColor]()
    colors.forEach {
        cgColors.append($0.cgColor)
    }
    gradientLayer.colors = cgColors
    gradientLayer.locations = [0, 0.5, 1]

    switch direction {
    case "上-下":
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    case "左-右":
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    case "左上-右下":
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    default:
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
    }
    view.layer.insertSublayer(gradientLayer, at: 0)
}
