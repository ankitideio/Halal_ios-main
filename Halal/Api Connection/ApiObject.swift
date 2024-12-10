//
//  ApiObject.swift
//  MyChef
//
//  Created by snow-macmini-1 on 17/02/21.
//

import Foundation

let BaseUrl =  "https://admin.halaladvisor.com.au/"
//let BaseUrl = "http://65.2.172.163/Halal_Backend/"
let imageBaseUrl = "https://admin.halaladvisor.com.au/upload/profile_pics/"
//let imageBaseUrl = "http://65.2.172.163/Halal_Backend/upload/homebanner_images/"

let apiLogin = "registration/signin"
let apiSignUp = "registration/signup"
let apiForgotPassword = "registration/forgotpassword"
let apiHome = "resturent/getresturentbycat"
let apiUpdateProfile = "registration/edit_user"
let apiDeleteAccount = "registration/deleteuser"
let apiGetCuisinesList = "resturent/topcuisines"
let apiFavoritesList = "resturent/getFavouriteResturant"
let apiAddressSearchList = "halal_api/halal.php"
let apiSendFeedback = "home/sendFeedback"
let apiVoucherList =  "resturent/my_voucher_list"
let apiAddToFav = "halal_api/res_fav.php?req=fav_res&key=1702NKDRDA&"
let apiRestaurantDetail =  "resturent/getresturentbyid"
let apiGalleryImgOnResDetail = "resturent/resturent_gallery"
let apiFetchMyReviewForRestuarent = "resturent/fetch_review"
let apiReadAllReviews = "resturent/getallreviewsbyrestid"
let apiaddReviews = "resturent/manage_review"
let apiMenu = "resturent/getRestaurantMenu"
let apiOfferList =  "resturent/getOffersListing"
let apiRemoveFvrt = "halal_api/res_unfav.php?req=unfav_res&key=1702NKDRDA&"
let apiLogout = "registration/logOut"
let apiRedeemOffer = "resturent/redeemOffer"
let reviewImageDelete = "resturent/delete_review_image"
let apiFeaturedImage = "resturent/getFeaturedImages"
let apiGoogleReview = "https://maps.googleapis.com/maps/api/geocode/json?address="
let apiGoogleReviewPlace = "https://maps.googleapis.com/maps/api/place/details/json?placeid="
let apiInstagramApi = "https://graph.instagram.com/"+"17841403879853603"+"/media?fields=id,media_type,media_url,thumbnail_url,timestamp,username,permalink,caption&limit=1000&access_token=IGQVJXOHJLcTFaQy14ZAHR0V3JUMWpQaTlKMWJacVhXNjdEdjVBMEFUc0Y4LTJTNF9jYVI3SGZABaW80WEtVR0tLczFIUGNxazdZAd1BqYXVlQmdncXBldDNieGFDb0xfak16QWVaSU1n"

let apiNearByVenues = "resturent/getNearByRestruent"
let apiTrackActivity = "resturent/trackActivity"
let apiSocialLogin = "registration/third_party_login"
let apiOfferListing = "resturent/getresturentofferslisting"
let apiTrackAnalytics = "resturent/trackAnalytics"
