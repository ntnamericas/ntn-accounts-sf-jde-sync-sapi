%dw 2.0
ns soapenv http://schemas.xmlsoap.org/soap/envelope/
ns jp5 http://ntnusa.e1.bssv.JP57SF01/
ns ntn http://ntnusa.e1.bssv.JP57SF01/
output application/xml
---
{
	soapenv#Envelope: {
		soapenv#Header: {
		},
		soapenv#Body: {
			ntn#createAdressbookCustomer: {
				ANS: payload."id",
				AC01: payload.nbcaMarket,
				AC02: payload.region,
				AC03: payload.custTypeCode,
				AC04: payload.ntnSalesRep,
				AC05: payload.customerServiceCoordinatorCode,
				AC06: payload.engineer,
				AC08: payload.ntnMarketCode,
				AC10: payload.ntnCustomerGroup,
				AC12: payload.ntnGlobalMarket,
				ADD1: payload.shippingStreet[0],
				ADD2: payload.shippingStreet[1],
				ADD3: payload.shippingStreet[2],
				ADD4: payload.shippingStreet[3],
				ADDS: payload.shippingStateCode,
				ADDZ: payload.shippingPostalCode,
				ALPH: payload.alphaName,
				SHAN: if (payload.jdeAddressNumber != null) 
				        if (payload.jdeAddressNumber as Number <= 90000000) 
				            payload.jdeAddressNumber
				        else if (payload.jdeAddressNumber as Number <= 900000000) 
				            (payload.jdeAddressNumber as Number - 90000000)
				        else 
				            (payload.jdeAddressNumber as Number - 900000000)
				      else 
				        null,
				AN8: if (payload.billToNumber != null) 
				        if (payload.billToNumber as Number <= 90000000) 
				            payload.billToNumber
				        else if (payload.billToNumber as Number <= 900000000) 
				            (payload.billToNumber as Number - 90000000)
				        else 
				            (payload.billToNumber as Number - 900000000)
				     else 
				        null,
				PA8: if (payload.parentNumber != null) 
				        if (payload.parentNumber as Number <= 90000000) 
				            payload.parentNumber
				        else if (payload.parentNumber as Number <= 900000000) 
				            (payload.parentNumber as Number - 90000000)
				        else 
				            (payload.parentNumber as Number - 900000000)
				     else 
				        null,
				AT1: payload.searchType,
				BADT: payload.billingAddressType,
				CPGP: payload.customerPriceGroup40PC,
				CTR: payload.shippingCountryCode,
				CTY1: payload.shippingCity,
				DUNS: payload.dunsNumber,
				fax: payload.fax,
				phone: payload.phone,
				SIC: payload.ntnCompanyName
			}
		}
	}
}
