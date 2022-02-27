//
//  ImageCroppingView.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/09/16.
//

import SwiftUI

var UniversalSafeOffsets = UIApplication.shared.windows.first?.safeAreaInsets

struct ImageCroppingView: View {
    //These are the initial dimension of the actual image
    @State var imageWidth:CGFloat = 0
    @State var imageHeight:CGFloat = 0
    
    @Binding var shown:Bool
    
    @State var croppingOffset = CGSize(width: 0, height: 0)
    @State var croppingMagnification:CGFloat = 1
    
    var image:UIImage
    @Binding var croppedImage:UIImage?
    @Binding var change:Bool
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            VStack{
                Spacer()
                    .frame(height: UniversalSafeOffsets?.top ?? 0)
                HStack(alignment: .top){
                    Button(
                        action: {
                            shown = false
//                            croppedImage = nil
                            change = false
                        }){
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    Spacer()
                    Text("You may need to re-select your filter after cropping")
                        .font(.system(size: 12))
                        .foregroundColor(.init(white: 0.7))
                        .padding(.horizontal, 20)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button(action: {
                        let cgImage: CGImage = image.cgImage!
                        // save時のwidthの比率でcropImageのwidhtを測っている
                        let scaler = CGFloat(cgImage.width)/imageWidth
                        // 短い方の長さ
                        let dim:CGFloat = getDimension(w: CGFloat(cgImage.width), h: CGFloat(cgImage.height))
                        // 長い方をoffsetで正方形に揃える
                        let xOffset = (((imageWidth/2) - (getDimension(w: imageWidth, h: imageHeight) * croppingMagnification/2)) + croppingOffset.width) * scaler
                        let yOffset = (((imageHeight/2) - (getDimension(w: imageWidth, h: imageHeight) * croppingMagnification/2)) + croppingOffset.height) * scaler
                        let scaledDim = dim * croppingMagnification
                        
                        
                        if let cImage = cgImage.cropping(to: CGRect(x: xOffset, y: yOffset, width: scaledDim, height: scaledDim)){
                            croppedImage = UIImage(cgImage: cImage)
                            shown = false
                            change = true
                        }
                        
                        
                        
                    }){
                        Text("Done")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    
                }
                .font(.system(size: 20))
                .padding()
                
                Spacer()
                ZStack{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .overlay(GeometryReader{geo -> AnyView in
                            DispatchQueue.main.async{
                                self.imageWidth = geo.size.width
                                self.imageHeight = geo.size.height
                            }
                            return AnyView(EmptyView())
                        })
                    
                    ViewFinderView(imageWidth: self.$imageWidth, imageHeight: self.$imageHeight, finalOffset: $croppingOffset, finalMagnification: $croppingMagnification)
                    
                    
                }
                .padding()
                Spacer()
            }
        }.edgesIgnoringSafeArea(.vertical)
    }
}


struct ViewFinderView:View{
    
    @Binding var imageWidth:CGFloat
    @Binding var imageHeight:CGFloat
    @State var center:CGFloat = 0
    
    @State var activeOffset:CGSize = CGSize(width: 0, height: 0)
    @Binding var finalOffset:CGSize
    
    @State var activeMagnification:CGFloat = 1
    @Binding var finalMagnification:CGFloat
    
    @State var dotSize:CGFloat = 13
    var dotColor = Color.init(white: 1).opacity(0.9)
    var surroundingColor = Color.black.opacity(0.45)
    
    var body: some View {
        ZStack{
        //These are the views for the surrounding rectangles
        // Stackは自動的に真ん中に寄せてくれる
            Group{
                Rectangle()
                    .foregroundColor(surroundingColor)
                    .frame(
                        width: ((imageWidth-getDimension(w: imageWidth, h: imageHeight))/2) + activeOffset.width + (getDimension(w: imageWidth, h: imageHeight) * (1 - activeMagnification) / 2),
                        height: imageHeight
                    )
                    .offset(x: getSurroundingViewOffsets(horizontal: true, left_or_up: true), y: 0)
                Rectangle()
                    .foregroundColor(surroundingColor)
                    .frame(
                        width: ((imageWidth-getDimension(w: imageWidth, h: imageHeight))/2) - activeOffset.width + (getDimension(w: imageWidth, h: imageHeight) * (1 - activeMagnification) / 2),
                        height: imageHeight
                    )
                    .offset(x: getSurroundingViewOffsets(horizontal: true, left_or_up: false), y: 0)
                Rectangle()
                    .foregroundColor(surroundingColor)
                    .frame(width: getDimension(w: imageWidth, h: imageHeight) * activeMagnification, height: ((imageHeight-getDimension(w: imageWidth, h: imageHeight))/2) + activeOffset.height + (getDimension(w: imageWidth, h: imageHeight) * (1 - activeMagnification) / 2))
                    .offset(x: activeOffset.width, y: getSurroundingViewOffsets(horizontal: false, left_or_up: true))
                Rectangle()
                    .foregroundColor(surroundingColor)
                    .frame(width: getDimension(w: imageWidth, h: imageHeight) * activeMagnification, height: ((imageHeight-getDimension(w: imageWidth, h: imageHeight))/2) - activeOffset.height + (getDimension(w: imageWidth, h: imageHeight) * (1 - activeMagnification) / 2))
                    .offset(x: activeOffset.width, y: getSurroundingViewOffsets(horizontal: false, left_or_up: false))
            }
            //This view creates a very translucent rectangle that overlies the picture we'll be uploading
            // 短い方の長さで正方形を作る
            Rectangle()
                .frame(
                    width: getDimension(w: imageWidth, h: imageHeight)*activeMagnification,
                    height: getDimension(w: imageWidth, h: imageHeight)*activeMagnification
                )
                .foregroundColor(Color.white.opacity(0.05))
                .offset(x: activeOffset.width, y: activeOffset.height)
                .gesture(
                    DragGesture()
                        .onChanged{drag in
                            //Create an instance of the finalOffset + the change made via dragging - "workingOffset" will be used only for calcuations to determine if our drag should be "finalized"
                            let workingOffset = CGSize(
                                width: finalOffset.width + drag.translation.width,
                                height: finalOffset.height + drag.translation.height
                            )
                            //First check if we are within the right and left bounds when translating in the horizontal dimension
                            if workingOffset.width + (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2) <= imageWidth/2 &&
                                (workingOffset.width - (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2)) >= -imageWidth/2 {
                                //If we are, then set the activeOffset.width equal to the workingOffset.width
                                self.activeOffset.width = workingOffset.width
                            } else if workingOffset.width + (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2) > imageWidth/2 {
                                //If we are at the right-most bound then align the right-most edges accordingly
                                self.activeOffset.width = (imageWidth/2) - (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2)
                            } else {
                                //If we are at the left-most bound then align the left-most edges accordingly
                                self.activeOffset.width = -(imageWidth/2) + (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2)
                            }
                            
                            //Next check if we are within the upper and lower bounds when translating in the vertical dimension
                            if workingOffset.height + (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2) <= imageHeight/2 &&
                                ((workingOffset.height) - (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2)) >= -imageHeight/2 {
                                //If we are, then set the activeOffset.height equal to the workingOffset.height
                                self.activeOffset.height = workingOffset.height
                            }
                            else if workingOffset.height + (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2) > imageWidth/2 {
                                //If we are at the bottom-most bound then align the bottom-most edges accordingly
                                self.activeOffset.height = (imageHeight/2) - (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2)
                            } else {
                                //If we are at the top-most bound then align the top-most edges accordingly
                                self.activeOffset.height = -((imageHeight/2) - (finalMagnification * getDimension(w: imageWidth, h: imageHeight)/2))
                            }
                            
                        }
                        .onEnded{drag in
                            //Set the finalOffset equal to activeOffset; the whole point of this is that we use activeOffset to update the view, whereas finalOffset serves as the starting point for any calculations for each iteration of onChanged in a drag gesture
                            self.finalOffset = activeOffset
                        }
                )
            
            //These views create the white grid
            //This view creates the outer square
            Rectangle()
                .stroke(lineWidth: 1)
                .frame(
                    width: getDimension(w: imageWidth, h: imageHeight)*activeMagnification,
                    height: getDimension(w: imageWidth, h: imageHeight)*activeMagnification
                )
                .foregroundColor(.white)
                .offset(x: activeOffset.width, y: activeOffset.height)
            
            //This view creates a thin rectangle in the center that is 1/3 the outer square's width
            Rectangle()
                .stroke(lineWidth: 1)
                .frame(
                    width: getDimension(w: imageWidth, h: imageHeight)*activeMagnification/3,
                    height: getDimension(w: imageWidth, h: imageHeight)*activeMagnification
                )
                .foregroundColor(Color.white.opacity(0.6))
                .offset(x: activeOffset.width, y: activeOffset.height)
            
            //This view creates a thin rectangle in the center that is 1/3 the outer square's height
            Rectangle()
                .stroke(lineWidth: 1)
                .frame(
                    width: getDimension(w: imageWidth, h: imageHeight)*activeMagnification,
                    height: getDimension(w: imageWidth, h: imageHeight)*activeMagnification/3
                )
                .foregroundColor(Color.white.opacity(0.6))
                .offset(x: activeOffset.width, y: activeOffset.height)
        }
        
    }
    
    
    
    //This function gets the offset for the surrounding views that obscure what has not been selected in the crop
    func getSurroundingViewOffsets(horizontal:Bool, left_or_up:Bool) -> CGFloat {
        let initialOffset:CGFloat = horizontal ? imageWidth : imageHeight
        let negVal:CGFloat = left_or_up ? -1 : 1
        let compensator = horizontal ? activeOffset.width : activeOffset.height
        
        return (((negVal * initialOffset) - (negVal * (initialOffset - getDimension(w: imageWidth, h: imageHeight))/2))/2) + (compensator/2) + (-negVal * (getDimension(w: imageWidth, h: imageHeight) * (1 - activeMagnification) / 4))
    }
    
    //This function determines the intended magnification you were going for. It does so by measuring the distance you dragged in both dimensions and comparing it against the longest edge of the image. The larger ratio is determined to be the magnification that you intended.
    func getMagnification(_ dragTranslation:CGSize) -> CGFloat {
        
        if (getDimension(w: imageWidth, h: imageHeight) - dragTranslation.width)/getDimension(w: imageWidth, h: imageHeight) < (getDimension(w: imageWidth, h: imageHeight) - dragTranslation.height)/getDimension(w: imageWidth, h: imageHeight) {
            return (getDimension(w: imageWidth, h: imageHeight) - dragTranslation.width)/getDimension(w: imageWidth, h: imageHeight)
        } else {
            return (getDimension(w: imageWidth, h: imageHeight) - dragTranslation.height)/getDimension(w: imageWidth, h: imageHeight)
        }
    }
    
    
}








//This function just gets the larger of two values, when comparing two inputs. It is typically executed by submitting a width and height of a view to return the larger of the two
func getDimension(w:CGFloat,h:CGFloat) -> CGFloat{
    if h > w {
        return w
    } else {
        return h
    }
    
}
