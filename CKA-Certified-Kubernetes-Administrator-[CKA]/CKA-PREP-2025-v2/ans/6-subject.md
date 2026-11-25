### k get crd | grep -i cert-manager > ../ans/6-resource.md

GROUP:      cert-manager.io
KIND:       Certificate
VERSION:    v1

FIELD: subject <Object>


DESCRIPTION:
    Requested set of X509 certificate subject attributes. More info:
    https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.6 
     The common name attribute is specified separately in the `commonName`
    field. Cannot be set if the `literalSubject` field is set.
    
FIELDS:
  countries	<[]string>
    Countries to be used on the Certificate.

  localities	<[]string>
    Cities to be used on the Certificate.

  organizationalUnits	<[]string>
    Organizational Units to be used on the Certificate.

  organizations	<[]string>
    Organizations to be used on the Certificate.

  postalCodes	<[]string>
    Postal codes to be used on the Certificate.

  provinces	<[]string>
    State/Provinces to be used on the Certificate.

  serialNumber	<string>
    Serial number to be used on the Certificate.

  streetAddresses	<[]string>
    Street addresses to be used on the Certificate.


