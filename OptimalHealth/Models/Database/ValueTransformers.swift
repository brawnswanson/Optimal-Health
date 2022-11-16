//
//  ValueTransformers.swift
//  Optimal Health
//
//  Created by Daniel Pressner on 13.11.22.
//

import Foundation

class DateComponentsTransformer: ValueTransformer {
  override class func transformedValueClass() -> AnyClass {
    return NSData.self
  }
  override class func allowsReverseTransformation() -> Bool {
    return true
  }
  override func transformedValue(_ value: Any?) -> Any? {
    guard let value = value as? DateComponents, let result = try? JSONEncoder().encode(value) else { return nil }
    return result
  }
  override func reverseTransformedValue(_ value: Any?) -> Any? {
    guard let data = value as? Data, let result = try? JSONDecoder().decode(DateComponents.self, from: data) else { return nil }
    return result
  }
}

extension NSValueTransformerName {
  static let dateComponentsTransformerName = NSValueTransformerName("DateComponentsTransformer")
}
