require 'sinatra/base'
require 'json'
require 'active_support/all'

module Sinatra
  module BridgeProcessor
    def process(p)
      {
        "ProfileText": profile_text(p),
        "FirstName": p["firstName"],
        "LastName": p["lastName"],
        "PostCode": p["postcode"],
        "Address": address(p),
        "EmailAddress": p["emailAddress"],
        "MobileNumber": p["mobileNumber"],
        "Media": media_id(p["mediaType"]),
        "CreatedUser": user_id(p["thisUser"]),
        "FAO": user_id(p["thisUser"]),
        "OriginalCvFileData": resume_file(p),
        "OriginalCvExtension": get_original_ext(p),
        "AnnualSalary": p["minimumAnnualSalary"].to_s,
      }
    end

    def media_name(media)
      media = media.split(",")
      media[1]
    end

    private

    def profile_text(p)
      (p["whyLeaving"] +
                    ". " + p["currentSituation"] +
                    ". " + p["whatDoTheyWant"]   +
                    ". " + p["people"]   +
                    ". " + p["otherNotes"])
    end

    def user_id(user)
      user = user.split(",")
      user[0]
    end

    def media_id(media)
      media = media.split(",")
      media[0]
    end

    def status_id(status)
      status = status.split(",")
      status[0]
    end

    def get_original_ext(p)
      if p['resume']
        name = p['resume']['filename']
        result = "." + name.split('.')[1]
      end
    end

    def resume_file(p)
      if p['resume']
        encode_from_file_location(p['resume']['tempfile'])
      end
    end


    def address(p)
      [ p["address1"],
        p["address2"],
        p["address3"] ]
    end

  end

  helpers BridgeProcessor
end
