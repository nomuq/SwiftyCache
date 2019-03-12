// MIT License

// Copyright (c) 2019 Satish Babariya

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


import Foundation

public let Cache = SwiftyCache.standard

public class CacheKeys {
    fileprivate init() {}
}

public class CacheKey<T>: CacheKeys {
    public let key: String

    public let value: T

    public init(_ key: String, _ value: T) {
        self.key = key
        self.value = value
        super.init()
    }
}

public class SwiftyCache {
    fileprivate class CacheObject: NSObject {
        fileprivate let value: Any

        fileprivate init(_ value: Any) {
            self.value = value
        }
    }

    public static let standard: SwiftyCache = SwiftyCache()

    private let cache: NSCache<NSString, CacheObject>

    fileprivate init() {
        cache = NSCache()
    }

    public subscript<T>(key: CacheKey<T>) -> T {
        get {
            if let object = cache.object(forKey: key.key as NSString), let value: T = object.value as? T {
                return value
            }
            return key.value
        }
        set {
            cache.setObject(CacheObject(newValue), forKey: key.key as NSString)
        }
    }

    public subscript<T>(key: CacheKey<T>, cost: Int) -> T {
        get {
            if let object = cache.object(forKey: key.key as NSString), let value: T = object.value as? T {
                return value
            }
            return key.value
        }
        set {
            cache.setObject(CacheObject(newValue), forKey: key.key as NSString, cost: cost)
        }
    }

    public subscript<T>(key: String) -> T? {
        get {
            if let object = cache.object(forKey: key as NSString), let value: T = object.value as? T {
                return value
            }
            return nil
        }
        set {
            guard let newValue = newValue else {
                cache.removeObject(forKey: key as NSString)
                return
            }
            cache.setObject(CacheObject(newValue), forKey: key as NSString)
        }
    }

    public subscript<T>(key: String, cost: Int) -> T? {
        get {
            if let object = cache.object(forKey: key as NSString), let value: T = object.value as? T {
                return value
            }
            return nil
        }
        set {
            guard let newValue = newValue else {
                cache.removeObject(forKey: key as NSString)
                return
            }
            cache.setObject(CacheObject(newValue), forKey: key as NSString, cost: cost)
        }
    }

    public func remove<T>(_ key: CacheKey<T>) {
        cache.removeObject(forKey: key.key as NSString)
    }

    public func removeAll() {
        cache.removeAllObjects()
    }
}
