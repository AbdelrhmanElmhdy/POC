//
//  AnalyticsDelegate.swift
//  
//
//  Created by Abdelrhman Elmahdy on 29/08/2023.
//

import Foundation
import BtechFoundation

protocol DeliverySectionAnalyticsDelegate {
    func didSelectCity(_ city: City)
    func didSelectArea(_ are: Area)
    
    func didSelectStorePickup()
    func didHomeDelivery()
    
    func didPresentSavedAddresses(_ deliveryAddresses: [DeliveryAddress])
    func didSelectSavedAddress(_ deliveryAddress: DeliveryAddress)
    func didChangeFocusOnNumberAndNameField(isFocused: Bool, streetNumberAndName: String)
    func didChangeFocusOnNearbyLandmarkField(isFocused: Bool, nearbyLandmark: String)
    
    func didPressContinue(_ receiv: DeliveryAddress)
}
