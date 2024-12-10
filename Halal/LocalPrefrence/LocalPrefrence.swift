//
//  LocalPrefrence.swift
//  MaytProvider
//
//  Created by Ankit KaleRamans on 22/10/20.
//  Copyright © 2020 Ankit Jaat. All rights reserved.
//
//git check
import Foundation

//checking git
func saveUserId(userID:String){
    UserDefaults.standard.set(userID, forKey: "userID")
}

func fetchUserId()-> String{
    return UserDefaults.standard.value(forKey: "userID") as? String ?? ""
}


func saveSideMenu(sideMenuShow:Bool){
UserDefaults.standard.set(sideMenuShow, forKey: "sideMenu")
}
func fetchSideMenu()-> Bool{
return UserDefaults.standard.value(forKey: "sideMenu") as? Bool ?? false
}
func saveSignUpStatus(signUpStatus:Bool){
UserDefaults.standard.set(signUpStatus, forKey: "signUpStatus")
}
func fetchSignUpStatus()-> Bool{
return UserDefaults.standard.value(forKey: "signUpStatus") as? Bool ?? false
}
func saveUserName(userName:String){
    UserDefaults.standard.set(userName, forKey: "userName")
}

func fetchUserName()-> String{
    return UserDefaults.standard.value(forKey: "userName") as? String ?? ""
}

func saveUserEmail(email:String){
    UserDefaults.standard.set(email, forKey: "email")
}

func fetchUserEmail()-> String{
    return UserDefaults.standard.value(forKey: "email") as? String ?? ""
}
func saveProfileImage(profileImage:String){
    UserDefaults.standard.set(profileImage, forKey: "profileImage")
}

func fetchProfileImage()-> String{
    return UserDefaults.standard.value(forKey: "profileImage") as? String ?? ""
}
func saveResId(resId:String){
    UserDefaults.standard.set(resId, forKey: "resId")
}

func fetchResId()-> String{
    return UserDefaults.standard.value(forKey: "resId") as? String ?? ""
}
func saveLocation(location:String){
    UserDefaults.standard.set(location, forKey: "location")
}

func fetchLocation()-> String{
    return UserDefaults.standard.value(forKey: "location") as? String ?? ""
}
func savePhoneNumber(phoneNumber:String){
    UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
}

func fetchPhoneNumber()-> String{
    return UserDefaults.standard.value(forKey: "phoneNumber") as? String ?? ""
}
func saveRatingId(ratingId:String){
    UserDefaults.standard.set(ratingId, forKey: "ratingId")
}

func fetchRatingId()-> String{
    return UserDefaults.standard.value(forKey: "ratingId") as? String ?? ""
}
func saveDeviceToken(deviceToken:String){
    UserDefaults.standard.set(deviceToken, forKey: "deviceToken")
}

func fetchDeviceToken()-> String{
    return UserDefaults.standard.value(forKey: "deviceToken") as? String ?? ""
}
func saveIsSelected(isSelected:Bool){
UserDefaults.standard.set(isSelected, forKey: "isSelected")
}
func fetchIsSelected()-> Bool{
return UserDefaults.standard.value(forKey: "isSelected") as? Bool ?? false
}
func saveLatitude(latitude:String){
    UserDefaults.standard.set(latitude, forKey: "latitude")
}

func fetchLatitude()-> String{
    return UserDefaults.standard.value(forKey: "latitude") as? String ?? ""
}
func saveLongitude(longitude:String){
    UserDefaults.standard.set(longitude, forKey: "longitude")
}

func fetchLongitude()-> String{
    return UserDefaults.standard.value(forKey: "longitude") as? String ?? ""
}
func saveSearchLatitude(searchLatitude:String){
    UserDefaults.standard.set(searchLatitude, forKey: "searchLatitude")
}

func fetchSearchLatitude()-> String{
    return UserDefaults.standard.value(forKey: "searchLatitude") as? String ?? ""
}
func saveSearchLongitude(searchLongitude:String){
    UserDefaults.standard.set(searchLongitude, forKey: "searchLongitude")
}

func fetchSearchLongitude()-> String{
    return UserDefaults.standard.value(forKey: "searchLongitude") as? String ?? ""
}
func saveRestaurentName(name:String){
    UserDefaults.standard.set(name, forKey: "name")
}

func fetchRestaurentName()-> String{
    return UserDefaults.standard.value(forKey: "name") as? String ?? ""
}
func savePlaceId(placeId:String){
    UserDefaults.standard.set(placeId, forKey: "placeId")
}

func fetchPlaceId()-> String{
    return UserDefaults.standard.value(forKey: "placeId") as? String ?? ""
}
func saveHomePage(homePage:String){
    UserDefaults.standard.set(homePage, forKey: "homePage")
}

func fetchHomePage()-> String{
    return UserDefaults.standard.value(forKey: "homePage") as? String ?? ""
}
func saveResLatitude(resLatitude:String){
    UserDefaults.standard.set(resLatitude, forKey: "resLatitude")
}

func fetchResLatitude()-> String{
    return UserDefaults.standard.value(forKey: "resLatitude") as? String ?? ""
}
func saveResLongitude(resLongitude:String){
    UserDefaults.standard.set(resLongitude, forKey: "resLongitude")
}

func fetchResLongitude()-> String{
    return UserDefaults.standard.value(forKey: "resLongitude") as? String ?? ""
}
func saveResWebSite(resWebsite:String){
    UserDefaults.standard.set(resWebsite, forKey: "resWebsite")
}

func fetchResWebSite()-> String{
    return UserDefaults.standard.value(forKey: "resWebsite") as? String ?? ""
}
func saveInstaImage(instaImage:String){
    UserDefaults.standard.set(instaImage, forKey: "instaImage")
}

func fetchInstaImage()-> String{
    return UserDefaults.standard.value(forKey: "instaImage") as? String ?? ""
}
func saveResLocation(location:String){
    UserDefaults.standard.set(location, forKey: "location")
}

func fetchResLocation()-> String{
    return UserDefaults.standard.value(forKey: "location") as? String ?? ""
}
func saveResLat(resLat:String){
    UserDefaults.standard.set(resLat, forKey: "resLat")
}

func fetchResLat()-> String{
    return UserDefaults.standard.value(forKey: "resLat") as? String ?? ""
}
func saveResLong(resLong:String){
    UserDefaults.standard.set(resLong, forKey: "resLong")
}

func fetchResLong()-> String{
    return UserDefaults.standard.value(forKey: "resLong") as? String ?? ""
}
func saveOfferListingLat(offerListingLat:String){
    UserDefaults.standard.set(offerListingLat, forKey: "offerListingLat")
}

func fetchOfferListingLat()-> String{
    return UserDefaults.standard.value(forKey: "offerListingLat") as? String ?? ""
}
func saveOfferListingLong(offerListingLong:String){
    UserDefaults.standard.set(offerListingLong, forKey: "offerListingLong")
}
func fetchOfferListingLong()-> String{
    return UserDefaults.standard.value(forKey: "offerListingLong") as? String ?? ""
}

func saveMapLong(mapLog:String){
    UserDefaults.standard.set(mapLog, forKey: "mapLog")
}

func fetchMapLong()-> String{
    return UserDefaults.standard.value(forKey: "mapLog") as? String ?? ""
}
func saveMapLat(mapLat:String){
    UserDefaults.standard.set(mapLat, forKey: "mapLat")
}

func fetchMapLat()-> String{
    return UserDefaults.standard.value(forKey: "mapLat") as? String ?? ""
}
func saveMapId(id:String){
    UserDefaults.standard.set(id, forKey: "id")
}

func fetchMapId()-> String{
    return UserDefaults.standard.value(forKey: "id") as? String ?? ""
}
func saveMenuImage(menuImage:String){
    UserDefaults.standard.set(menuImage, forKey: "menuImage")
}

func fetchMenuImage()-> String{
    return UserDefaults.standard.value(forKey: "menuImage") as? String ?? ""
}
func saveResIdNear(resIdNear:String){
    UserDefaults.standard.set(resIdNear, forKey: "resIdNear")
}

func fetchResIdNear()-> String{
    return UserDefaults.standard.value(forKey: "resIdNear") as? String ?? ""
}
func saveIsComingFrom(isComingFrom:Bool){
UserDefaults.standard.set(isComingFrom, forKey: "isComingFrom")
}
func fetchIsComingFrom()-> Bool{
return UserDefaults.standard.value(forKey: "isComingFrom") as? Bool ?? false
}
func saveHomeCurrentLat(homeCurrentLat:String){
    UserDefaults.standard.set(homeCurrentLat, forKey: "homeCurrentLat")
}

func fetchHomeCurrentLat()-> String{
    return UserDefaults.standard.value(forKey: "homeCurrentLat") as? String ?? ""
}
func saveHomeCurrentLong(homeCurrentLog:String){
    UserDefaults.standard.set(homeCurrentLog, forKey: "homeCurrentLog")
}

func fetchHomeCurrentLong()-> String{
    return UserDefaults.standard.value(forKey: "homeCurrentLog") as? String ?? ""
}
func saveInstaUserName(instaUserName:String){
    UserDefaults.standard.set(instaUserName, forKey: "instaUserName")
}

func fetchInstaUserName()-> String{
    return UserDefaults.standard.value(forKey: "instaUserName") as? String ?? ""
}
func saveFeaturedLat(featuredLat:String){
    UserDefaults.standard.set(featuredLat, forKey: "featuredLat")
}

func fetchFeaturedLat()-> String{
    return UserDefaults.standard.value(forKey: "featuredLat") as? String ?? ""
}
func saveFeaturedLong(featuredLog:String){
    UserDefaults.standard.set(featuredLog, forKey: "featuredLog")
}

func fetchFeaturedLong()-> String{
    return UserDefaults.standard.value(forKey: "featuredLog") as? String ?? ""
}
func saveAddressLat(addressLat:String){
    UserDefaults.standard.set(addressLat, forKey: "addressLat")
}

func fetchAddressLat()-> String{
    return UserDefaults.standard.value(forKey: "addressLat") as? String ?? ""
}
func saveAddressLong(addressLong:String){
    UserDefaults.standard.set(addressLong, forKey: "addressLong")
}

func fetchAddressLong()-> String{
    return UserDefaults.standard.value(forKey: "addressLong") as? String ?? ""
}

func saveResTime(resTime:String){
    UserDefaults.standard.set(resTime, forKey: "resTime")
}

func fetchResTime()-> String{
    return UserDefaults.standard.value(forKey: "resTime") as? String ?? ""
}
func saveResCurrentLat(resCurrentLat:String){
    UserDefaults.standard.set(resCurrentLat, forKey: "resCurrentLat")
}

func fetchResCurrentLat()-> String{
    return UserDefaults.standard.value(forKey: "resCurrentLat") as? String ?? ""
}
func saveResCurrentLong(resCurrentLong:String){
    UserDefaults.standard.set(resCurrentLong, forKey: "resCurrentLong")
}

func fetchResCurrentLong()-> String{
    return UserDefaults.standard.value(forKey: "resCurrentLong") as? String ?? ""
}
func saveReviewCount(reviewCount:String){
    UserDefaults.standard.set(reviewCount, forKey: "reviewCount")
}

func fetchReviewCount()-> String{
    return UserDefaults.standard.value(forKey: "reviewCount") as? String ?? ""
}
func saveGoogleReviewCount(googleReviewCount:String){
    UserDefaults.standard.set(googleReviewCount, forKey: "googleReviewCount")
}

func fetchGoogleReviewCount()-> String{
    return UserDefaults.standard.value(forKey: "googleReviewCount") as? String ?? ""
}
func saveResRating(resRating:String){
    UserDefaults.standard.set(resRating, forKey: "resRating")
}

func fetchResRating()-> String{
    return UserDefaults.standard.value(forKey: "resRating") as? String ?? ""
}
func saveTotalRating(totlaRating:String){
    UserDefaults.standard.set(totlaRating, forKey: "totlaRating")
}

func fetchTotalRating()-> String{
    return UserDefaults.standard.value(forKey: "totlaRating") as? String ?? ""
}
func saveCusineId(cusineId:String){
    UserDefaults.standard.set(cusineId, forKey: "cusineId")
}

func fetchCusineId()-> String{
    return UserDefaults.standard.value(forKey: "cusineId") as? String ?? ""
}
func saveMapheight(mapHeight:Bool){
UserDefaults.standard.set(mapHeight, forKey: "mapHeight")
}
func fetchMapheight()-> Bool{
return UserDefaults.standard.value(forKey: "mapHeight") as? Bool ?? false
}
func saveResHeight(resHeight:Bool){
UserDefaults.standard.set(resHeight, forKey: "resHeight")
}
func fetchResHeight()-> Bool{
return UserDefaults.standard.value(forKey: "resHeight") as? Bool ?? true
}
func saveAddressName(addressName:String){
    UserDefaults.standard.set(addressName, forKey: "addressName")
}

func fetchAddressName()-> String{
    return UserDefaults.standard.value(forKey: "addressName") as? String ?? ""
}
func saveIsComing(isComing:Bool){
UserDefaults.standard.set(isComing, forKey: "isComing")
}
func fetchIsComing()-> Bool{
return UserDefaults.standard.value(forKey: "isComing") as? Bool ?? false
}
func saveReviewSelected(reviewSelected:Bool){
UserDefaults.standard.set(reviewSelected, forKey: "reviewSelected")
}
func fetchReviewSelected()-> Bool{
return UserDefaults.standard.value(forKey: "reviewSelected") as? Bool ?? false
}
func saveOfferResName(offerResName:String){
    UserDefaults.standard.set(offerResName, forKey: "offerResName")
}

func fetchOfferResName()-> String{
    return UserDefaults.standard.value(forKey: "offerResName") as? String ?? ""
}
func saveOfferSelected(offerSelected:Bool){
UserDefaults.standard.set(offerSelected, forKey: "offerSelected")
}
func fetchOfferSelected()-> Bool{
return UserDefaults.standard.value(forKey: "offerSelected") as? Bool ?? false
}
func saveCityName(cityName:String){
    UserDefaults.standard.set(cityName, forKey: "cityName")
}

func fetchCityName()-> String{
    return UserDefaults.standard.value(forKey: "cityName") as? String ?? ""
}
func saveStateCode(stateCode:String){
    UserDefaults.standard.set(stateCode, forKey: "stateCode")
}

func fetchStateCode()-> String{
    return UserDefaults.standard.value(forKey: "stateCode") as? String ?? ""
}
func saveDistanceLat(distanceLat:String){
    UserDefaults.standard.set(distanceLat, forKey: "distanceLat")
}

func fetchDistanceLat()-> String{
    return UserDefaults.standard.value(forKey: "distanceLat") as? String ?? ""
}
func saveDistanceLong(distanceLong:String){
    UserDefaults.standard.set(distanceLong, forKey: "distanceLong")
}

func fetchDistanceLong()-> String{
    return UserDefaults.standard.value(forKey: "distanceLong") as? String ?? ""
}
func saveUrbanName(urbanName:String){
    UserDefaults.standard.set(urbanName, forKey: "urbanName")
}

func fetchUrbanName()-> String{
    return UserDefaults.standard.value(forKey: "urbanName") as? String ?? ""
}
func saveResName(restaurentName:String){
    UserDefaults.standard.set(restaurentName, forKey: "restaurentName")
}

func fetchResName()-> String{
    return UserDefaults.standard.value(forKey: "restaurentName") as? String ?? ""
}
func saveAllReviewPlaceId(allReviewPlaceId:String){
    UserDefaults.standard.set(allReviewPlaceId, forKey: "allReviewPlaceId")
}

func fetchAllReviewPlaceId()-> String{
    return UserDefaults.standard.value(forKey: "allReviewPlaceId") as? String ?? ""
}

func saveSearchParamValue(search:String){
    UserDefaults.standard.set(search, forKey: "search")
}

func fetchSearchParamValue()-> String{
    return UserDefaults.standard.value(forKey: "search") as? String ?? ""
}

func saveSplashStatusForWalkthrough(statusWalkthrough:Bool){
    UserDefaults.standard.set(statusWalkthrough, forKey: "statusWalkthrough")
}

func fetchSplashStatusForWalkthrough()-> Bool{
    return UserDefaults.standard.value(forKey: "statusWalkthrough") as? Bool ?? false
}

func saveSplashStatusForSignUp(statusSignup:Bool){
    UserDefaults.standard.set(statusSignup, forKey: "statusSignup")
}

func fetchSplashStatusForSignUp()-> Bool{
    return UserDefaults.standard.value(forKey: "statusSignup") as? Bool ?? false
}

func saveSplashStatusForHome(status:Bool){
    UserDefaults.standard.set(status, forKey: "status")
}

func fetchSplashStatusForHome()-> Bool{
    return UserDefaults.standard.value(forKey: "status") as? Bool ?? false
}
func saveComingNotification(comingNotification:Bool){
    UserDefaults.standard.set(comingNotification, forKey: "comingNotification")
}

func fetchComingNotification()-> Bool{
    return UserDefaults.standard.value(forKey: "comingNotification") as? Bool ?? false
}
func saveRatingData(ratingData:[String:Any]){
    UserDefaults.standard.set(ratingData, forKey: "ratingData")
}

func fetchRatingData()-> [String:Any]{
    return UserDefaults.standard.value(forKey: "ratingData") as? [String:Any] ?? [:]
}
