## About

HexView is a UI element that allows you to add hexagons into the design of your app.  You can customize many properties directly from the storyboard.  This component is a subclass of `UIControl` and is setup to recognize taps similar to `UIButton`.

If you have questions, please feel free to [email me](mailto:lambrou@gmail.com). You can check the rest of my work [here](https://github.com/tlambrou).

## Installation

Download the repo and add the HexView.swift file to your iOS project

## Usage

There are two ways to add a Hex to your iOS app or project...

#### From Storyboard
1. Drag a normal View from the Object Library into your Storyboard.
2. Select the view in your storboard and then click on the identity inspector tab in the inspector.
3. Add a custom class of `HexView` in the "Class" field.

#### In Code
To add a Hex view to your project, just instantiate it in code by using typing the following `HexView()`.  You can alter different attributes of the view the same way you would modify any other UIView. 

### Version 0.1

Has inspectable properties
## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/MakeSchool-18/ui-components](https://github.com/MakeSchool-18/ui-components).

## License

The component is available as open source under the terms of the [Common Public Attribution License Version 1.0 (CPAL-1.0)](https://opensource.org/licenses/CPAL-1.0).
