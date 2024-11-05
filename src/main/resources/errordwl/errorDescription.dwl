%dw 2.0
output application/json
import * from dw::core::Strings
import * from dw::Runtime 
---
{
	"identifier": error.errorType.identifier,
	"namespace": error.errorType.namespace,
	"description": error.description,
	"statusCode": error.muleMessage.typedAttributes.statusCode default error.exception.cause.cause.statusCode default 500,
	"errorType": error.errorType.identifier
}