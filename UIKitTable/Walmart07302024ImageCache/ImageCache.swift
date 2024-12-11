//
//  ImageCache.swift
//  UIKitTable
//
//  Created by Siran Li on 7/30/24.
//

import UIKit


/*
 # PROMPT:
 Today, we're going to have you implement a simple image manager class for a small application. The image
 manager class, given a URL, is responsible for fetching an image over the network and caching the image
 in memory to prevent repeated network requests for the same resource (URL).
 
 We have provided you the skeleton ImageManager class and a single public fetchImage method stub. Your job
 is to implement this method and return a decoded UIImage or an Error to a completion handler. You may add
 additional instance variables and methods to the class.
 
 Perfect Swift syntax is not expected nor are API method signatures to Apple frameworks. Please feel free
 to ask any clarifying questions throughout the exercise.
 */

/*
/// An object that retrieves images from a remote source and caches them in memory.
@available(iOS 15.0, *)
public class ImageManager {
    
    /// Fetches an image from a remote source.
    ///
    /// - Parameters:
    ///   - url: The URL of the image.
    ///   - completionHandler: The result of the fetch.
    public func fetchImage(for url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        // TODO: Implement
    }
}

// Call Site
let testImage = URL(string: "https://picsum.photos/200")!
let manager = ImageManager()

manager.fetchImage(for: testImage) { result in
    do {
        let image = try result.get()
    } catch {
        print(error)
    }
}
*/
