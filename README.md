# SwiftUI Screen Corner Radius Customizer

## Overview

This iOS SwiftUI project showcases how to dynamically adjust the corner radius of UI elements, such as bottom sheets and top alerts, to seamlessly match the curvature of different iPhone screens. This enhances the user interface for a more cohesive visual experience.

Additionally, the project includes a helpful extension for `UIScreen` to retrieve and utilize the display corner radius.

## Features

- Dynamically adjusts corner radius based on the curvature of the screen.
- Utilizes `UIScreen` extension for easy access to display corner radius.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## UIScreen Extension

Included in this project is an extension for `UIScreen` that provides functions to retrieve the display corner radius. This can be used in conjunction with the SwiftUI views to achieve optimal corner matching.

```swift
public extension UIScreen {
    // Key used to retrieve the display corner radius value
    private static let cornerRadiusKey: String = {
        let components = ["Radius", "Corner", "display", "_"]
        return components.reversed().joined()
    }()
    
    // Returns the display corner radius, or a default value of 10 if unavailable
    var displayCornerRadius: CGFloat {
        guard let cornerRadius = self.value(forKey: Self.cornerRadiusKey) as? CGFloat else {
            return 10
        }
        // Ensure the corner radius is not less than 10
        return max(cornerRadius, 10)
    }
    
    // Returns the display corner radius, capped at the specified minimum value
    func displayCorner(minimum: CGFloat) -> CGFloat {
        if self.displayCornerRadius < minimum {
            return minimum
        } else {
            return self.displayCornerRadius
        }
    }
}

```
## Uses

This project allows you to seamlessly match the corner radius of UI elements with the curvature of different iPhone screens, improving the overall user interface. The `UIScreen` extension included in the code provides easy access to the display corner radius.

### Detailed Usage

```swift
var body : some View {
    var padding = 10
    
    ZStack{
        
        VStack{
            Spacer()
            
            VStack{
                // Your view here
            }
            .padding()
            .fullWidth() // View's extension included in code
            .background(Color.white)
            
            // MARK: - Applying screenCornerRadius
            /// A minimum value of 20 is applied. If the device doesn't have any corner radius, the default value of 20 will be used. 
            /// This results in a corner radius of 10 after subtracting the padding.
            .cornerRadius(screenCornerRadius(minimum: 20) - padding)
            
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
        }
       
    }
    .padding(padding)
    .ignoresSafeArea()
    
    // Hide home bar (extension included in code)
    .hideHomeIndicator() 
}
```

Additionally, the code uses extensions for `fullWidth()` and `hideHomeIndicator()` for further UI enhancements.

That's great! If you find the project useful, please consider giving it a star on GitHub. You can do so by visiting the project's GitHub repository and clicking on the "Star" button at the top right.

Also, don't forget to follow the GitHub profile for updates on future projects!

Additionally, you can connect with Moksh Suthar on LinkedIn [here](https://www.linkedin.com/in/moksh-suthar-5253841b5/). It's a great way to stay in touch and network within the community.

