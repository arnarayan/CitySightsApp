//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-27.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business

    
    var body: some View {

        VStack(alignment: .leading) {
            VStack (alignment: .leading, spacing:0) {
                TopImage(business: self.business)
                if (business.isClosed != nil) {
                    if (business.isClosed! == true) {
                        ZStack(alignment:.leading) {
                            Rectangle().foregroundColor(Color.gray)
                                .frame(height: 25)
                            Text("Closed")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding([.top, .leading, .bottom], 5.0)
                        }
                    }else {
                        ZStack(alignment:.leading) {
                            Rectangle().foregroundColor(Color.blue)
                                .frame(height: 25)
                            Text("Open")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding([.top, .leading, .bottom], 5.0)
                        }
                    }
                }
            }

            Group {
                ScrollView(showsIndicators: false) {
                    NameAndAddress(business: self.business)
                    Spacer()
                    RowDivider(leftLabel:"Phone: ", leftContent:"\(business.displayPhone ?? "")", rightLabel: "Call", rightContent: "tel:\(business.phone!)")
                    RowDivider(leftLabel:"Reviews: ", leftContent:"\(business.reviewCount ?? 0)", rightLabel: "Read", rightContent: "\(business.url!)")
                    RowDivider(leftLabel:"Website: ", leftContent: business.url!, rightLabel: "Visit", rightContent: "\(business.url!)")
                }

            }

            Spacer()
            
            ZStack {
                RectangleCard(color: Color.blue).frame(height: 100)
                Button(action: {
                    
                }, label: {
                    Text("Get Directions").foregroundColor(Color.white).bold()
                })
            }
                

        }


    }
    
}


