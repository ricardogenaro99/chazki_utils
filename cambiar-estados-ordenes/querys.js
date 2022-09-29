module.exports = {
	insertURLImgOrder: `
      mutation insertURLImgOrder($IDorder: Int!, $groupID: Int!, $urls: FileUrlInput) {
          InsertURLImgOrder: insertURLImgOrder(orderID: $IDorder, ordersImagesGroupID: $groupID, url: $urls) {
            id
            orderID
            groupID
            filename
            url
          }
        }  
      `,
	updateOrderData: `
      mutation updateOrderData($orderID: Int!, $dataUpdOrder: OrderInput) {
        updateOrderData: updateOrderData(orderID: $orderID, dataUpdOrder: $dataUpdOrder) {
          message
          motive
          statusCode
        }
      }    
      `,
	rescheduleOrders: `
      mutation rescheduleOrders($ordersID: [Int!]!) {
        rescheduleOrders(ordersID: $ordersID) {
          message
          motive
          statusCode
        }
      }   
      `,
	getOrderHistorial: `
      query getOrderHistorial($orderID: Int, $trackCode: String, $enterpriseID: Int) {
        OrderHistorial: getOrderHistorial(orderID: $orderID, trackCode: $trackCode, enterpriseID: $enterpriseID) {
          Service {
            name
          }
          id
          trackCode
          Enterprise {
            comercialName
          }
          Activities {
            id
            Type {
              subclass
              subtype
            }
            addressPoint {
              coordinates
            }
          }
          Status {
            subtype
            type
            class
            subclass
          }
          OrderService {
            id
            promiseTime
            startTime
            endTime
            deleted
            dateLastStatus
            LastStatus {
              subtype
              subclass
            }
            OrderServiceHistorial {
              createdAt
              id
              motive
              deleted
              userIDUpdate
              Status {
                subtype
                type
                class
                subclass
              }
              Incidence {
                name
              }
              UserUpdate {
                names
                lastname
              }
            }
            Routes {
              id
              routeCode
              AffiliateVehicles {
                id
                vehiclePlate
                CategoryVehicle {
                  subtype
                  type
                  class
                  subclass
                }
              }
              Affiliates {
                userID
                User {
                  names
                  lastname
                  phone
                  picture
                }
                LocationAffiliate {
                  locationPoint {
                    coordinates
                  }
                }
              }
            }
          }
        }
      }     
      `,
	returnPackageNoLocated: `
      mutation returnPackageNoLocated($addressReturn: addressReturnOrder!, $orderNoLocatedIDs: [Int!]!) {
        returnPackageNoLocated(addressReturn: $addressReturn, orderNoLocatedIDs: $orderNoLocatedIDs) {
          message
          motive
          statusCode
        }
      }   
      `,
	getOrder: `
      query getOrder($orderID: Int) {
        Order: getOrder(orderID: $orderID) {
          id
          enterpriseID
          trackCode
          pickUpAddress
          pickUpNotes
          pickUpPrimaryReference
          pickUpSecondaryReference
          pickUpAddressReference
          pickUpPostalCode
          dropAddress
          dropNotes
          dropPrimaryReference
          dropSecondaryReference
          dropAddressReference
          dropPostalCode
          packageQuantity
          urlFileAcuse
          pickUpPoint {
            type
            coordinates
          }
          dropPoint {
            type
            coordinates
          }
          PackageSizeID {
            id
            name
          }
          productDescription
          Incidence {
            id
            name
          }
          PaymentProofID {
            subtype
            type
            class
            subclass
          }
          Status {
            subtype
            type
            class
            subclass
          }
          ClassificationOrder {
            subtype
            type
            class
            subclass
            extra {
              color
            }
          }
          Service {
            id
            name
          }
          productPrice
          PaymentMethodID {
            subtype
            type
            class
            subclass
          }
          dropContactName
          dropContactPhone
          dropContactEmail
          pickUpContactName
          pickUpContactPhone
          pickUpContactEmail
          receptorAcuse
          relationshipAcuse
          OrderService {
            id
            OrderServiceHistorial {
              id
              Status {
                subtype
                type
                class
                subclass
              }
              userIDUpdate
              UserUpdate {
                names
                lastname
              }
              Incidence {
                id
                name
              }
              incidenceID
            }
          }
        }
      }
      `,
};
