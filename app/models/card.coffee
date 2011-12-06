Spine = require('spine')
Item = require('models/item')

class Card extends Item
  @configure 'Card', 'name', 'type', 'description', 'quantity', 'cost', 'fname', 'lname', 'title', 'email', 'address', 'city', 'state', 'zip', 'country', 'telDirect', 'telCompany', 'telCell', 'telFax', 'website', 'company'

  getvCard: ->
    card  = "BEGIN:VCARD\n" # BEGIN:VCARD
    card += "VERSION:2.1\n"  # VERSION:2.1
    card += "N:" + @.lname + ";" + @.fname + ";;;\n" # N:Baker;Craig;;;
    card += "ADR;INTL;PARCEL;WORK:;;" + @.address + ";" + @.city + ";" + @.state + ";" + @.zip + ";" + @.country + "\n" # ADR;INTL;PARCEL;WORK;;;1 S St.;Baton Rouge;LA;70909;USA
    card += "EMAIL;INTERNET:" + @.email + "\n" # EMAIL;INTERNET:craig@mail.com
    card += "ORG;" + @.company + "\n" # ORG:RigNet
    card += "TEL;WORK:" + @.telCompany + "\n" # TEL;WORK:5043332222
    card += "TEL;WORK;FAX:" + @.telFax + "\n" # TEL;WORK;FAX:5043332222
    card += "TEL;WORK;CELL:" + @.telCell + "\n" # TEL;WORK;CELL:5043332222
    card += "TEL;WORK;DIRECT:" + @.telDirect + "\n" # TEL;WORK;DIRECT:5043332222
    card += "TITLE:" + @.title + "\n" # TITLE:Programmer
    card += "URL;WORK:" + @.website + "\n" # URL;WORK:rig.net
    card += "END:VCARD\n" # END:VCARD
  
module.exports = Card